USE [ProjectDatabaseSON]
GO

CREATE TRIGGER [dbo].[UygunDersSecVeSayfayaKaydol] ON [dbo].[OGRENCI_DERS_KAYIT]
AFTER INSERT, DELETE
AS
BEGIN
  DECLARE @Is_INSERTED varchar(11),@Is_DELETED varchar(11)
  SELECT @Is_INSERTED = inserted.OgrNo FROM inserted
  SELECT @Is_DELETED = deleted.OgrNo FROM deleted
		DECLARE @OgrNo varchar(11);
		DECLARE @GnclDersNo int;
		DECLARE @DrsNo int;

		DECLARE @OgrenciBolumu varchar(50);
		DECLARE @DersinBolumu varchar(50);
		DECLARE @DersYili int
		DECLARE @DersDonemi int

		DECLARE @AlinanAKTS int;
		DECLARE @DersAKTS int;
		DECLARE @MaxAKTS int;

		DECLARE @Ogr_profile varchar(50);
		DECLARE @DersPageID varchar(50);
  IF (@Is_INSERTED IS NOT NULL AND @Is_DELETED IS NULL)  
  Begin
			SET @OgrNo = (SELECT i.OgrNo FROM inserted i)
			SET @GnclDersNo = (SELECT i.GuncelDersNo FROM inserted i)
			SET @DrsNo = (SELECT i.DersNo FROM inserted i)

			SET @DersinBolumu = (SELECT BagliOlduguBolum
								FROM DERS
								WHERE @DrsNo=DERS.DersNo)

			SET @OgrenciBolumu = (SELECT Bolumu
								FROM OGRENCI
								WHERE @OgrNo=OGRENCI.OgrNo)

			IF @DersinBolumu != @OgrenciBolumu
			BEGIN
				ROLLBACK
				PRINT 'OGRENCI SADECE KENDI BOLUMUNDEN DERS ALABILIR'
			END

			ELSE
			BEGIN
				SET @MaxAKTS = (SELECT MaxAKTS FROM REGULARITY
								WHERE RegNo IN(SELECT Regularity FROM OGRENCI_DONEM_AKTS WHERE @OgrNo=OGRENCI_DONEM_AKTS.OgrNo))
				SET @DersYili = (SELECT Yil FROM GUNCEL_DERS WHERE @GnclDersNo=GuncelDersNo AND @DrsNo=DersNo)
				SET @DersDonemi = (SELECT SomestrNo FROM GUNCEL_DERS WHERE @GnclDersNo=GuncelDersNo AND @DrsNo=DersNo)

				SET @AlinanAKTS = (SELECT AKTS
									FROM OGRENCI_DONEM_AKTS
									WHERE @OgrNo=OGRENCI_DONEM_AKTS.OgrNo AND @DersYili=OGRENCI_DONEM_AKTS.Yil AND @DersDonemi=OGRENCI_DONEM_AKTS.SomestrNo)

				SET @DersAKTS = (SELECT DERS.AKTS
								FROM DERS
								WHERE @DrsNo=DERS.DersNo)

				SET @AlinanAKTS = @AlinanAKTS+@DersAKTS
			
				IF (@AlinanAKTS>@MaxAKTS)
				BEGIN
					PRINT 'OGRENCI MAX AKTS SINIRINI ASTI'
					ROLLBACK TRANSACTION
				END
			
				ELSE
				BEGIN
					UPDATE OGRENCI_DONEM_AKTS 
						SET AKTS = @AlinanAKTS
						FROM OGRENCI_DONEM_AKTS 
						WHERE @OgrNo=OGRENCI_DONEM_AKTS.OgrNo AND @DersYili=OGRENCI_DONEM_AKTS.Yil AND @DersDonemi=OGRENCI_DONEM_AKTS.SomestrNo
		
						/* ders kaydı gerçekleştikten sonra öğrencinin dersin facebook sayfasına kaydı otomatik yapılacak */
						SET @Ogr_profile = (SELECT profileID FROM FACEBOOK_OGRENCI WHERE FACEBOOK_OGRENCI.OgrNo=@OgrNo)
						SET @DersPageID = (SELECT PageID FROM GUNCEL_DERS_SAYFASI WHERE GuncelDersNo = @GnclDersNo AND DersNo = @DrsNo)
						INSERT INTO SAYFA_UYELERI(ProfileID, PageID) VALUES(@Ogr_profile, @DersPageID)		
				END
			END		
  End
  IF (@Is_DELETED IS NOT NULL AND @Is_INSERTED IS NULL)
  Begin
		SET @OgrNo = (SELECT i.OgrNo FROM deleted i)
		SET @GnclDersNo = (SELECT i.GuncelDersNo FROM deleted i)
		SET @DrsNo = (SELECT i.DersNo FROM deleted i)

		SET @DersYili = (SELECT Yil FROM GUNCEL_DERS WHERE @GnclDersNo=GuncelDersNo AND @DrsNo=DersNo)
		SET @DersDonemi = (SELECT SomestrNo FROM GUNCEL_DERS WHERE @GnclDersNo=GuncelDersNo AND @DrsNo=DersNo)

		SET @AlinanAKTS = (SELECT AKTS
					FROM OGRENCI_DONEM_AKTS
					WHERE @OgrNo=OGRENCI_DONEM_AKTS.OgrNo AND @DersYili=OGRENCI_DONEM_AKTS.Yil AND @DersDonemi=OGRENCI_DONEM_AKTS.SomestrNo)
		SET @DersAKTS = (SELECT DERS.AKTS
							FROM DERS
							WHERE @DrsNo=DERS.DersNo)

		SET @AlinanAKTS = @AlinanAKTS-@DersAKTS /* ogrenci dersi birakinca aldigi akts'den dusulecek */

		UPDATE OGRENCI_DONEM_AKTS 
						SET AKTS = @AlinanAKTS
						FROM OGRENCI_DONEM_AKTS 
						WHERE OGRENCI_DONEM_AKTS.OgrNo=@OgrNo AND OGRENCI_DONEM_AKTS.Yil=@DersYili AND OGRENCI_DONEM_AKTS.SomestrNo=@DersDonemi
					
		DECLARE @Ogr_profiled varchar(50);
		DECLARE @DersPageIDd varchar(50);
		SET @Ogr_profiled = (SELECT profileID FROM FACEBOOK_OGRENCI WHERE FACEBOOK_OGRENCI.OgrNo=@OgrNo)
		SET @DersPageIDd = (SELECT PageID FROM GUNCEL_DERS_SAYFASI WHERE GuncelDersNo = @GnclDersNo AND DersNo = @DrsNo)
		
		DELETE FROM SAYFA_UYELERI
		WHERE PageID = @DersPageIDd AND ProfileID = @Ogr_Profiled
  End 
END
				

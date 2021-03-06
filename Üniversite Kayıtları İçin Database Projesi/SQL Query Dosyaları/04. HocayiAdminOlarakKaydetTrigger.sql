USE [ProjectDatabaseSON]
GO

CREATE TRIGGER [dbo].[HocayiAdminOlarakKaydet] ON [dbo].[HOCA_DERS]
AFTER INSERT
AS
BEGIN
DECLARE @TCNo varchar(11);
DECLARE @GnclDersNo int;
DECLARE @DrsNo int;

DECLARE @Hoca_profile varchar(50);
DECLARE @DersPageID varchar(50);

	SET @TCNo = (SELECT i.Hoca_TCNo FROM inserted i)
	SET @GnclDersNo = (SELECT i.GuncelDersNo FROM inserted i)
	SET @DrsNo = (SELECT i.DersNo FROM inserted i)
	
	/* hoca dersi vermek icin kaydoldugu zaman facebook sayfasinin adminlerine ve sayfa uyelerine eklenecek */
	SET @Hoca_profile = (SELECT profileID FROM FACEBOOK_OGR_GOR WHERE FACEBOOK_OGR_GOR.TCNo=@TCNo)
	SET @DersPageID = (SELECT PageID FROM GUNCEL_DERS_SAYFASI WHERE GuncelDersNo = @GnclDersNo AND DersNo = @DrsNo)
	
	INSERT INTO ADMIN_SAYFA VALUES(@DersPageID,@Hoca_profile)
	INSERT INTO SAYFA_UYELERI VALUES(@Hoca_profile,@DersPageID)				
END		
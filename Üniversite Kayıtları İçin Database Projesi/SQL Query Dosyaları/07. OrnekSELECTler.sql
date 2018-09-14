USE ProjectDatabaseSON
GO
/*---------------------------------------------------------------------------------------------------------------*/
/* minimum 2 adet tablo kullanan SELECT'ler */
/* 2016 Guz doneminde Max 30 AKTS alabilen ogrencilerin ogrenci no,isim, soyisim ve bolumleri */
SELECT OGRENCI.OgrNo,Isim,Soyad,Bolumu
FROM OGRENCI,OGRENCI_DONEM_AKTS
WHERE Regularity='True' AND OGRENCI.OgrNo=OGRENCI_DONEM_AKTS.OgrNo

/* Bilgisayar Muhendisligi bolumunde okuyan/mezun ogrencilerin ogrNo,isim,soyad ve facebook profileID'leri */
SELECT OGRENCI.OgrNo,Isim,Soyad,profileID
FROM OGRENCI,FACEBOOK_OGRENCI
WHERE Bolumu='Bilgisayar Muhendisligi' AND OGRENCI.OgrNo=FACEBOOK_OGRENCI.OgrNo

/* Bilgisayar Muhendisligi bolumunde acilan derslerin ders no,ders adi,AKTS'leri ve 2016 yili icin guncel no'lari */
SELECT GuncelDersNo,DERS.DersNo,DersAdi,AKTS
FROM GUNCEL_DERS,DERS
WHERE BagliOlduguBolum='Bilgisayar Muhendisligi' AND DERS.DersNo=GUNCEL_DERS.DersNo
/*---------------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------------------------------------*/
/* minimum 3 adet tablo kullanan SELECT'ler */
/* Bilgisayar Muhendisliginden mezun ogrencilerin OgrNo,Isim,Soyad,MezuniyetYili ve LinkedinID'leri */
SELECT OGRENCI.OgrNo,Isim,Soyad,MezuniyetYili,ProfileID
FROM OGRENCI,MEZUN,LINKEDIN_OGRENCI
WHERE Bolumu='Bilgisayar Muhendisligi' AND OGRENCI.OgrNo=MEZUN.OgrNo AND MEZUN.OgrNo=LINKEDIN_OGRENCI.OgrNo

/* database2016 guncel ders facebook sayfasina post gonderen ogretim gorevlilerinin isimleri,
soyadlari, facebookID'leri, email'leri ve post icerikleri */
SELECT Isim,Soyisim,ProfileID,Email,Icerik
FROM OGRETIM_GOR,FACEBOOK_OGR_GOR,POST
WHERE POST.Gonderilen='database2016' AND POST.Gonderen=FACEBOOK_OGR_GOR.ProfileID AND FACEBOOK_OGR_GOR.TCNo=OGRETIM_GOR.TCNo

/* database2016 facebook sayfasýna kayýtlý ogrencilerin ogrNo,isim,soyad ve profileID'leri */
SELECT OGRENCI.OgrNo,Isim,Soyad,FACEBOOK_OGRENCI.ProfileID
FROM OGRENCI,FACEBOOK_OGRENCI,SAYFA_UYELERI
WHERE SAYFA_UYELERI.PageID='database2016' AND SAYFA_UYELERI.ProfileID=FACEBOOK_OGRENCI.ProfileID AND FACEBOOK_OGRENCI.OgrNo=OGRENCI.OgrNo

/* Muhendislik fakultesindeki butun hocalarin isim,soyisim,facebook ve linkedin profilleri */
SELECT Isim,Soyisim,FACEBOOK_OGR_GOR.ProfileID as 'facebook',LINKEDIN_OGR_GOR.ProfileID as 'linkedin' /* Kolon isimleri degistirildi çýktý için */
FROM OGRETIM_GOR,FACEBOOK_OGR_GOR,LINKEDIN_OGR_GOR
WHERE OGRETIM_GOR.CalistigiBirim='Muhendislik Fakultesi' AND OGRETIM_GOR.TCNo=FACEBOOK_OGR_GOR.TCNo
AND OGRETIM_GOR.TCNo=LINKEDIN_OGR_GOR.TCNo
/*---------------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------------------------------------*/
/* minimum 4 adet tablo kullanan SELECT'ler */
/* Bilgisayar Muh. bolumunde Uygulamali Saati olan dersleri 2016 guz doneminde alan ogrencilerin ogrNo,isimleri,soyadlarý ve Ders Ismi */
SELECT OGRENCI.OgrNo,Isim,Soyad,DERS.DersAdi
FROM OGRENCI,DERS,GUNCEL_DERS,OGRENCI_DERS_KAYIT
WHERE DERS.BagliOlduguBolum='Bilgisayar Muhendisligi' AND UygulamaliSaat>0 AND DERS.DersNo=GUNCEL_DERS.DersNo AND GUNCEL_DERS.GuncelDersNo=OGRENCI_DERS_KAYIT.GuncelDersNo AND OGRENCI_DERS_KAYIT.Yil=2016
AND OGRENCI_DERS_KAYIT.SomestrNo=0 AND OGRENCI.OgrNo=OGRENCI_DERS_KAYIT.OgrNo

/* Bilgisayar Muhendisligi bolumunden 2015 yilinda mezun olan ogrencilerin ogrNo,ýsim,soyad,linkedinID ve CV'lerindeki sirketler*/
SELECT OGRENCI.OgrNo,Isim,Soyad,LINKEDIN_OGRENCI.ProfileID,KurulusID
FROM OGRENCI,MEZUN,LINKEDIN_OGRENCI,CV
WHERE Bolumu='Bilgisayar Muhendisligi' AND MEZUN.OgrNo=OGRENCI.OgrNo AND OGRENCI.OgrNo=LINKEDIN_OGRENCI.OgrNo
AND LINKEDIN_OGRENCI.ProfileID=CV.CalisanID

/* Bilgisayar Muhendisligi bolumunde ders veren hocalarýn isim,soyisim,unvan ve verdikleri ders adi */
SELECT Isim,Soyisim,UnvanAdi,DersAdi
FROM OGRETIM_GOR,DERS,GUNCEL_DERS,OGR_GOR_UNVANI,HOCA_DERS
WHERE DERS.BagliOlduguBolum='Bilgisayar Muhendisligi' AND GUNCEL_DERS.DersNo=DERS.DersNo
AND HOCA_DERS.GuncelDersNo=GUNCEL_DERS.GuncelDersNo AND HOCA_DERS.Hoca_TCNo=OGRETIM_GOR.TCNo AND
OGRETIM_GOR.Unvan=OGR_GOR_UNVANI.UnvanNo
/* --------------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------------------------------------*/
/* nested queries */
/* Bilgisayar Muhendisliginde okuyan/mezun tum ogrencilerin ogrNo,facebook profilleri */
SELECT FACEBOOK_OGRENCI.OgrNo,FACEBOOK_OGRENCI.ProfileID as 'facebook'
FROM FACEBOOK_OGRENCI
WHERE FACEBOOK_OGRENCI.OgrNo IN(SELECT OgrNo FROM OGRENCI WHERE Bolumu='Bilgisayar Muhendisligi')

/* Universiteden 3.00 uzeri ortalama ile mezun olan ogrencilerin ogrNo,isim,soyad,bolumleri */
SELECT OgrNo,Isim,Soyad,Bolumu
FROM OGRENCI
WHERE OgrNo IN(SELECT OgrNo FROM MEZUN WHERE NotOrt>3.00)
/* --------------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------------------------------------*/
/* LEFT-RIGHT JOIN'ler */
/* linkedin profili olan ogrencilerin profileID'lerinin, profil yoksa NULL bilgilerinin yazdýrýlmasý */
SELECT OGRENCI.OgrNo,Isim,Soyad,LINKEDIN_OGRENCI.ProfileID
FROM OGRENCI LEFT JOIN LINKEDIN_OGRENCI
ON OGRENCI.OgrNo=LINKEDIN_OGRENCI.OgrNo

/* 2016 Bahar yariyilina kayit yaptiran ogrenci varsa aldigi AKTS, kayit yaptirmadiysa NULL bilgisi */ 
SELECT OGRENCI.OgrNo,Isim,Soyad,AKTS
FROM OGRENCI LEFT JOIN OGRENCI_DONEM_AKTS
ON OGRENCI.OgrNo=OGRENCI_DONEM_AKTS.OgrNo AND Yil=2016 AND SomestrNo=1

/* Birimlere bagli olan tum bolumler ve henuz birim kaydi girilmemis birimler */
SELECT AKADEMIK_BIRIM.BirimAdi,BOLUM.BolumAdi
FROM BOLUM RIGHT JOIN AKADEMIK_BIRIM
ON BOLUM.KurucuBirim=AKADEMIK_BIRIM.BirimAdi
/* --------------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------------------------------------*/
/* EXISTS-NOT EXISTS */
/* Mezunlarda kaydý bulunan tum ogrencilerin OGRENCI tablosundaki kayýtlarýný yazdýrma */
SELECT *
FROM OGRENCI
WHERE EXISTS (SELECT *
			  FROM MEZUN WHERE OGRENCI.OgrNo=MEZUN.OgrNo)

/* Henuz herhangi bir ders vermek icin kaydi girilmemis ogretim gorevlilerinin listelenmesi */
SELECT *
FROM OGRETIM_GOR
WHERE NOT EXISTS(SELECT *
				FROM HOCA_DERS WHERE OGRETIM_GOR.TCNo=HOCA_DERS.Hoca_TCNo)
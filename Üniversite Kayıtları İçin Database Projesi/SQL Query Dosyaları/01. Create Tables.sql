CREATE DATABASE ProjectDatabaseSON
GO

USE ProjectDatabaseSON
GO 

CREATE TABLE BIRIM_TIPI
(
	TipNo int not null,
	BirimTipi varchar(50) not null,
	Primary Key(TipNo),
	unique(BirimTipi)
);

CREATE TABLE AKADEMIK_BIRIM
(
	BirimAdi varchar(50) not null,
	BirimTipNo int not null,
	Primary Key (BirimAdi),
	Constraint TipNoDegisimi
	Foreign Key (BirimTipNo) References BIRIM_TIPI(TipNo)
			On Update Cascade
);

CREATE TABLE BOLUM
(
	BolumAdi varchar(50) not null,
	KurucuBirim varchar(50) not null,
	Primary Key (BolumAdi),
	Constraint BirimAdiDegisimi
	Foreign Key (KurucuBirim) References AKADEMIK_BIRIM(BirimAdi)
			On Update Cascade
);

CREATE TABLE DERS
(
	DersNo int not null,
	DersAdi varchar(50) not null,
	TeorikSaat int null,
	UygulamaliSaat int null,
	AKTS int null,
	BagliOlduguBolum varchar(50) not null,
	primary key(DersNo),
	Foreign key(BagliOlduguBolum) references BOLUM(BolumAdi),
	check(AKTS>0)
);

CREATE TABLE SOMESTR
(
	SomestrNo int not null,
	SomestrAdi varchar(10) not null,
	primary key (SomestrNo),
	unique(SomestrAdi)
);

CREATE TABLE GUNCEL_DERS
(
	GuncelDersNo int not null,
	DersNo int not null,
	Yil int not null,
	SomestrNo int not null,
	Primary Key (GuncelDersNo, DersNo),
	unique(GuncelDersNo),
	Constraint DersNoDegisimi
	Foreign Key (DersNo) References DERS(DersNo)
				On Update Cascade,
	Foreign Key (SomestrNo) References SOMESTR(SomestrNo)
);

CREATE TABLE OGR_GOR_UNVANI
(
	UnvanNo int not null,
	UnvanAdi varchar(20) not null,
	primary key(UnvanNo),
	unique(UnvanAdi)
);

CREATE TABLE OGRETIM_GOR
(
	TCNo varchar(11) not null,
	Isim varchar(50) not null,
	Soyisim varchar(25) not null,
	Email varchar(40) not null,
	Unvan int not null,
	CalistigiBirim varchar(50) not null,
	primary key (TCNo),
	foreign key (Unvan) references OGR_GOR_UNVANI(UnvanNo),
	Constraint BirimIsimDegisimi
	foreign key (CalistigiBirim) references AKADEMIK_BIRIM(BirimAdi)
			On Update Cascade,
	unique(Email),
	CHECK(LEN(TCNo)=11)
);

CREATE TABLE HOCA_DERS
(
	Hoca_TCNo varchar(11) not null,
	GuncelDersNo int not null,
	DersNo int not null,
	primary key (Hoca_TCNo,GuncelDersNo,DersNo),
	foreign key (Hoca_TCNo) references OGRETIM_GOR(TCNo),
	Constraint DersNoDegisim
	foreign key (GuncelDersNo,DersNo) references GUNCEL_DERS(GuncelDersNo,DersNo)
			On Update Cascade
);

CREATE TABLE OGRENCI
(
	TCNo varchar(11) not null,
	OgrNo varchar(11) not null,
	Isim varchar(25) not null,
	Soyad varchar(25) not null,
	Email varchar(50) not null,
	Bolumu varchar(50) not null,
	Primary Key(TCNo),
	Foreign Key(Bolumu) references BOLUM(BolumAdi),
	Unique(OgrNo),
	Unique(Email),
	CHECK(LEN(TCNo)=11),
	CHECK(LEN(OgrNo)=11)
);

CREATE TABLE MEZUN
(
	OgrNo varchar(11) not null,
	MezuniyetYili int not null,
	NotOrt float not null,
	primary key(OgrNo),
	foreign key(OgrNo) references OGRENCI(OgrNo),
	check(NotOrt>=2.0)
);

CREATE TABLE REGULARITY
(
	RegNo bit not null,
	MaxAKTS int not null,
	primary key (RegNo)
);

CREATE TABLE OGRENCI_DONEM_AKTS
(
	OgrNo varchar(11) not null,
	SomestrNo int not null,
	Yil int not null,
	Regularity bit not null,
	AKTS int not null,
	Primary Key(OgrNo,SomestrNo,Yil),
	Foreign Key(OgrNo) references OGRENCI(OgrNo),
	Foreign Key(SomestrNo) references SOMESTR(SomestrNo),
	Foreign Key(Regularity) references REGULARITY(RegNo),
	check(AKTS>=0)
);

CREATE TABLE OGRENCI_DERS_KAYIT
(
	OgrNo varchar(11) not null,
	GuncelDersNo int not null,
	DersNo int not null,
	SomestrNo int not null,
	Yil int not null,
	Primary Key(OgrNo,GuncelDersNo,DersNo),
	Foreign Key(OgrNo,SomestrNo,Yil) references OGRENCI_DONEM_AKTS(OgrNo,SomestrNo,Yil),
	Constraint DersNolariDegisim
	Foreign Key(GuncelDersNo,DersNo) references GUNCEL_DERS(GuncelDersNo,DersNo)
			On Update Cascade
);

CREATE TABLE FACEBOOK_OGR_GOR
(
	TCNo varchar(11) not null,
	ProfileID varchar(50) not null,
	Primary Key(ProfileID),
	Foreign Key(TCNo) references OGRETIM_GOR(TCNo),
	Unique(TCNo)
);

CREATE TABLE FACEBOOK_OGRENCI 
(
	OgrNo varchar(11) not null,
	ProfileID varchar(50) not null,
	Primary Key(ProfileID),
	Foreign Key(OgrNo) references OGRENCI(OgrNo),
	Unique(OgrNo)
);

CREATE TABLE GUNCEL_DERS_SAYFASI
(
	PageID varchar(50) not null,
	GuncelDersNo int not null,
	DersNo int not null,
	SayfaAdi varchar(50) not null,
	Primary Key(PageID),
	Constraint FacebookDersNo
	Foreign Key(GuncelDersNo,DersNo) references GUNCEL_DERS(GuncelDersNo,DersNo)
			On Update Cascade
);

CREATE TABLE ADMIN_SAYFA
(
	PageID VARCHAR(50) not null,
	ProfileID VARCHAR(50) not null,
	primary key(PageID,ProfileID),
	foreign key(PageId) references GUNCEL_DERS_SAYFASI(PageID),
	foreign key(ProfileID) references FACEBOOK_OGR_GOR(ProfileID)
);
	
CREATE TABLE SAYFA_UYELERI
(
	ProfileID varchar(50) not null,
	PageID varchar(50) not null,
	Primary Key(ProfileID,PageID),
	Foreign Key(PageID) references GUNCEL_DERS_SAYFASI(PageID)
	/* okul dýþýndan çalýþan vs eklemek için profileID foreign key deðil */
);

CREATE TABLE POST
(
	PostID varchar(50) not null, /* sayfanýn üyesi deðilse patlayacak trigger */
	Gonderen varchar(50) not null,
	Gonderilen varchar(50) not null,
	Icerik varchar(50) not null,
	Primary Key(PostID),
	Foreign Key(Gonderilen) references GUNCEL_DERS_SAYFASI(PageID)
);

CREATE TABLE LINKEDIN_OGRENCI
(
	ProfileID varchar(50) not null,
	OgrNo varchar(11) not null,
	OgretimKurumu varchar(50) not null,
	primary key(ProfileID),
	foreign key(OgrNo) references OGRENCI(OgrNo),
	unique(OgrNo)
);

CREATE TABLE LINKEDIN_OGR_GOR
(
	ProfileID varchar(50) not null,
	TCNo varchar(11) not null,
	OgretimKurumu varchar(50) not null,
	primary key(ProfileID),
	foreign key(TCNo) references OGRETIM_GOR(TCNo),
	unique(TCNo)
);

CREATE TABLE KURULUS
(
	ProfileID varchar(50) not null,
	KurulusIsmi varchar(50) not null,
	primary key(ProfileID),
	unique(KurulusIsmi)
);

CREATE TABLE CV
(
	CalisanID varchar(50) not null,
	KurulusID varchar(50) not null,
	BaslamaTarihi int not null,
	AyrilmaTarihi int,
	Primary Key(CalisanID,KurulusID),
	foreign key(KurulusID) references KURULUS(ProfileID),
	foreign key(CalisanID) references LINKEDIN_OGRENCI(ProfileID),
	Check(AyrilmaTarihi>BaslamaTarihi)
);



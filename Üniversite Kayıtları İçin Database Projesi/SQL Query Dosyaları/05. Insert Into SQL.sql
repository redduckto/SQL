USE ProjectDatabaseSON
GO

INSERT INTO BIRIM_TIPI VALUES(0,'Fakulte')
INSERT INTO BIRIM_TIPI VALUES(1,'MYO')
INSERT INTO BIRIM_TIPI VALUES(2,'Enstitu')
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO AKADEMIK_BIRIM VALUES('Muhendislik Fakultesi',0)
INSERT INTO AKADEMIK_BIRIM VALUES('IIBF',0)
INSERT INTO AKADEMIK_BIRIM VALUES('Fen Bilimleri Enstitusu',2)
INSERT INTO AKADEMIK_BIRIM VALUES('Fen Edebiyat Fakultesi',0)
INSERT INTO AKADEMIK_BIRIM VALUES('Tip Fakultesi',0)
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO BOLUM VALUES('Bilgisayar Muhendisligi','Muhendislik Fakultesi')
INSERT INTO BOLUM VALUES('Kimya Muhendisligi','Muhendislik Fakultesi')
INSERT INTO BOLUM VALUES('Tekstil Muhendisligi','Muhendislik Fakultesi')
INSERT INTO BOLUM VALUES('Isletme','IIBF')
INSERT INTO BOLUM VALUES('Iktisat','IIBF')
INSERT INTO BOLUM VALUES('Bilgisayar Muhendisligi Yuksek Lisans','Fen Bilimleri Enstitusu')
INSERT INTO BOLUM VALUES('Kimya Muhendisligi Yuksek Lisans','Fen Bilimleri Enstitusu')
INSERT INTO BOLUM VALUES('Cografya','Fen Edebiyat Fakultesi')
INSERT INTO BOLUM VALUES('Biyoloji','Fen Edebiyat Fakultesi')
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO SOMESTR VALUES(0,'Guz')
INSERT INTO SOMESTR VALUES(1,'Bahar')
INSERT INTO SOMESTR VALUES(2,'Yaz')
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO REGULARITY VALUES('False',42)
INSERT INTO REGULARITY VALUES('True',30)
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO DERS VALUES(301,'DatabaseManagement',3,2,5,'Bilgisayar Muhendisligi')
INSERT INTO DERS VALUES(102,'Algoritma',4,3,7,'Bilgisayar Muhendisligi')
INSERT INTO DERS VALUES(203,'Data Structures',4,3,5,'Bilgisayar Muhendisligi')
INSERT INTO DERS VALUES(104,'Fizik I',4,3,5,'Bilgisayar Muhendisligi')
INSERT INTO DERS VALUES(114,'Fizik II',4,3,5,'Bilgisayar Muhendisligi')
INSERT INTO DERS VALUES(100,'Matematik I',4,0,6,'Kimya Muhendisligi')
INSERT INTO DERS VALUES(110,'Matematik II',4,0,6,'Kimya Muhendisligi')
INSERT INTO DERS VALUES(904,'Fizik I',4,3,5,'Kimya Muhendisligi')
INSERT INTO DERS VALUES(908,'Organik Kimya',4,2,7,'Kimya Muhendisligi')
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO GUNCEL_DERS VALUES(3012016,301,2016,0)
INSERT INTO GUNCEL_DERS VALUES(1022016,102,2016,0)
INSERT INTO GUNCEL_DERS VALUES(2032016,203,2016,0)
INSERT INTO GUNCEL_DERS VALUES(1042016,104,2016,0)
INSERT INTO GUNCEL_DERS VALUES(1142016,114,2016,1)
INSERT INTO GUNCEL_DERS VALUES(1002016,100,2016,0)
INSERT INTO GUNCEL_DERS VALUES(1102016,110,2016,1)
INSERT INTO GUNCEL_DERS VALUES(9042016,904,2016,0)
INSERT INTO GUNCEL_DERS VALUES(9082016,908,2016,0)
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO GUNCEL_DERS_SAYFASI VALUES('database2016',3012016,301,'Database Man 2016')
INSERT INTO GUNCEL_DERS_SAYFASI VALUES('algoritma2016',1022016,102,'Alg Prog 2016')
INSERT INTO GUNCEL_DERS_SAYFASI VALUES('datastructures2016',2032016,203,'Data Structures 2016')
INSERT INTO GUNCEL_DERS_SAYFASI VALUES('fizikI2016',1042016,104,'Fizik I 2016')
INSERT INTO GUNCEL_DERS_SAYFASI VALUES('fizik22016',1142016,114,'Fizik 2 2016')
INSERT INTO GUNCEL_DERS_SAYFASI VALUES('matematik12016',1002016,100,'Matematik 1 2016')
INSERT INTO GUNCEL_DERS_SAYFASI VALUES('matematik22016',1102016,110,'Matematik 2 2016')
INSERT INTO GUNCEL_DERS_SAYFASI VALUES('fizik1kimya2016',9042016,904,'Fizik I 2016')
INSERT INTO GUNCEL_DERS_SAYFASI VALUES('organikkimya2016',9082016,908,'Organik Kimya 2016')
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO OGRENCI VALUES('25285465921','05150000631','Onur','Onder','onuronder@egemail.com','Bilgisayar Muhendisligi')
INSERT INTO OGRENCI VALUES('52631628384','05120000312','Akif','Kaban','akifkaban@egemail.com','Bilgisayar Muhendisligi')
INSERT INTO OGRENCI VALUES('68045612342','05120000278','Fatih','Celik','fatihcelik@egemail.com','Bilgisayar Muhendisligi')
INSERT INTO OGRENCI VALUES('12365478940','05110000300','Orhan','Kadir','orhankadir@egemail.com','Kimya Muhendisligi')
INSERT INTO OGRENCI VALUES('32174185266','05110000412','Aysegul','Yilmaz','aysegulyilmaz@egemail.com','Kimya Muhendisligi')
INSERT INTO OGRENCI VALUES('42587965412','05130000517','Cagri','Ozcan','cagriozcan@egemail.com','Isletme')
INSERT INTO OGRENCI VALUES('63214785496','05120000482','Yakup','Onder','yakuponder@egemail.com','Isletme')
INSERT INTO OGRENCI VALUES('74896541253','05080000211','Batu','Dogukan','batudogukan@egemail.com','Bilgisayar Muhendisligi')
INSERT INTO OGRENCI VALUES('14587236985','05100000482','Tugce','Saykan','tugcesaykan@egemail.com','Bilgisayar Muhendisligi')
INSERT INTO OGRENCI VALUES('15151523456','05100000480','Selim','Arikan','selimarikan@egemail.com','Isletme')
INSERT INTO OGRENCI VALUES('32321245659','05090000781','Burcu','Yildirim','burcuyildirim@egemail.com','Isletme')
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO MEZUN VALUES('05080000211',2013,2.42)
INSERT INTO MEZUN VALUES('05100000482',2015,3.25)
INSERT INTO MEZUN VALUES('05100000480',2016,2.37)
INSERT INTO MEZUN VALUES('05090000781',2015,3.65)
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO FACEBOOK_OGRENCI VALUES('05150000631','onuronder91')
INSERT INTO FACEBOOK_OGRENCI VALUES('05120000312','akifkaban93')
INSERT INTO FACEBOOK_OGRENCI VALUES('05120000278','fatihcelik93')
INSERT INTO FACEBOOK_OGRENCI VALUES('05110000300','orhankadir')
INSERT INTO FACEBOOK_OGRENCI VALUES('05110000412','aysegulyilmaz')
INSERT INTO FACEBOOK_OGRENCI VALUES('05130000517','cagriozcan')
INSERT INTO FACEBOOK_OGRENCI VALUES('05120000482','yakuponder')
INSERT INTO FACEBOOK_OGRENCI VALUES('05080000211','batudogukan')
INSERT INTO FACEBOOK_OGRENCI VALUES('05100000482','tugcesaykan')
INSERT INTO FACEBOOK_OGRENCI VALUES('05100000480','selimarikan')
INSERT INTO FACEBOOK_OGRENCI VALUES('05090000781','burcuyildirim')
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO OGRENCI_DONEM_AKTS VALUES('05150000631',0,2016,'False',0) /* ogrencinin donem kaydi yapildi */
INSERT INTO OGRENCI_DONEM_AKTS VALUES('05120000312',0,2016,'False',0)
INSERT INTO OGRENCI_DONEM_AKTS VALUES('05120000278',0,2016,'True',0)
INSERT INTO OGRENCI_DONEM_AKTS VALUES('05110000300',0,2016,'False',0)
INSERT INTO OGRENCI_DONEM_AKTS VALUES('05110000412',0,2016,'True',0)
INSERT INTO OGRENCI_DONEM_AKTS VALUES('05130000517',0,2016,'True',0)
INSERT INTO OGRENCI_DONEM_AKTS VALUES('05120000482',0,2016,'True',0)
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO OGRENCI_DERS_KAYIT VALUES('05150000631',3012016,301,0,2016)
INSERT INTO OGRENCI_DERS_KAYIT VALUES('05150000631',2032016,203,0,2016)
INSERT INTO OGRENCI_DERS_KAYIT VALUES('05150000631',1022016,102,0,2016)
INSERT INTO OGRENCI_DERS_KAYIT VALUES('05150000631',1042016,104,0,2016)

INSERT INTO OGRENCI_DERS_KAYIT VALUES('05120000312',3012016,301,0,2016)
INSERT INTO OGRENCI_DERS_KAYIT VALUES('05120000312',2032016,203,0,2016)
INSERT INTO OGRENCI_DERS_KAYIT VALUES('05120000312',1022016,102,0,2016)

INSERT INTO OGRENCI_DERS_KAYIT VALUES('05110000412',9042016,904,0,2016)
INSERT INTO OGRENCI_DERS_KAYIT VALUES('05110000412',9082016,908,0,2016)
INSERT INTO OGRENCI_DERS_KAYIT VALUES('05110000412',1002016,100,0,2016)
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO OGR_GOR_UNVANI VALUES(0,'Yardimci Docent')
INSERT INTO OGR_GOR_UNVANI VALUES(1,'Docent')
INSERT INTO OGR_GOR_UNVANI VALUES(2,'Professor')
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO OGRETIM_GOR VALUES('52684655313','M.Osman','Unalir','mosmanunalir@ege.edu.tr',1,'Muhendislik Fakultesi')
INSERT INTO OGRETIM_GOR VALUES('23561762468','Basar','Aksanli','basaraksanli@ege.edu.tr',0,'IIBF')
INSERT INTO OGRETIM_GOR VALUES('95318431545','Levent','Toker','leventtoker@ege.edu.tr',2,'Muhendislik Fakultesi')
INSERT INTO OGRETIM_GOR VALUES('84612841348','Oguz','Dikenelli','oguzdikenelli@ege.edu.tr',2,'Muhendislik Fakultesi')
INSERT INTO OGRETIM_GOR VALUES('75118431548','Hilal','Hacioglu','hllhacioglu@ege.edu.tr',0,'Muhendislik Fakultesi')
INSERT INTO OGRETIM_GOR VALUES('21846131316','M.Fatih','Celik','mfatihcelik@ege.edu.tr',1,'Muhendislik Fakultesi')
INSERT INTO OGRETIM_GOR VALUES('84518483164','Ahmet','Egesoy','ahmetegesoy@ege.edu.tr',1,'Fen Edebiyat Fakultesi')
INSERT INTO OGRETIM_GOR VALUES('32174585511','Okan','Bursa','okanbursa@ege.edu.tr',0,'Muhendislik Fakultesi')
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO FACEBOOK_OGR_GOR VALUES('52684655313','mosmanunalir')
INSERT INTO FACEBOOK_OGR_GOR VALUES('23561762468','basaraksanli')
INSERT INTO FACEBOOK_OGR_GOR VALUES('95318431545','leventtoker')
INSERT INTO FACEBOOK_OGR_GOR VALUES('84612841348','oguzdikenelli')
INSERT INTO FACEBOOK_OGR_GOR VALUES('75118431548','hllhacioglu')
INSERT INTO FACEBOOK_OGR_GOR VALUES('21846131316','mfatihcelik')
INSERT INTO FACEBOOK_OGR_GOR VALUES('84518483164','ahmetegesoy')
INSERT INTO FACEBOOK_OGR_GOR VALUES('32174585511','okanbursa')
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO HOCA_DERS VALUES('52684655313',3012016,301)
INSERT INTO HOCA_DERS VALUES('32174585511',3012016,301)

INSERT INTO HOCA_DERS VALUES('95318431545',2032016,203)

INSERT INTO HOCA_DERS VALUES('84518483164',1022016,102)
INSERT INTO HOCA_DERS VALUES('32174585511',1022016,102)

INSERT INTO HOCA_DERS VALUES('84612841348',1042016,104)

INSERT INTO HOCA_DERS VALUES('21846131316',9042016,904)

INSERT INTO HOCA_DERS VALUES('21846131316',9082016,908)

INSERT INTO HOCA_DERS VALUES('75118431548',1002016,100)
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO POST VALUES('post00001','okanbursa','database2016','Uygulama Dersleri Hakkinda')
INSERT INTO POST VALUES('post00002','mosmanunalir','database2016','Proje Gruplari')
INSERT INTO POST VALUES('post00003','onuronder91','database2016','Ara Sinav ile Ilgili')
INSERT INTO POST VALUES('post00004','akifkaban93','database2016','Proje ile Ilgili')
INSERT INTO POST VALUES('post00011','onuronder91','datastructures2016','Lab4 Soru Cozumu')
INSERT INTO POST VALUES('post00012','akifkaban93','datastructures2016','Lab5 Soru Cozumu')
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO LINKEDIN_OGRENCI VALUES('batudogknlinkedin','05080000211','Ege Universitesi')
INSERT INTO LINKEDIN_OGRENCI VALUES('tugcesyknlinkedin','05100000482','Ege Universitesi')
INSERT INTO LINKEDIN_OGRENCI VALUES('selimarikanlinkedin','05100000480','Ege Universitesi')
INSERT INTO LINKEDIN_OGRENCI VALUES('burcuyldrmlinkedin','05090000781','Ege Universitesi')
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO LINKEDIN_OGR_GOR VALUES('okanbursalinkedin','32174585511','Ege Universitesi')
INSERT INTO LINKEDIN_OGR_GOR VALUES('mosmanunalirlinkedin','52684655313','Ege Universitesi')
INSERT INTO LINKEDIN_OGR_GOR VALUES('mfatihclklinkedin','21846131316','Ege Universitesi')
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO KURULUS VALUES('abctech','ABC Technologies')
INSERT INTO KURULUS VALUES('xyzsoft','XYZ Software')
INSERT INTO KURULUS VALUES('qwebank','QWE Bankasi')
/*----------------------------------------------------------------------------------------------------*/
INSERT INTO CV VALUES('batudogknlinkedin','abctech',20130712,20140820)
INSERT INTO CV VALUES('batudogknlinkedin','xyzsoft',20140630,NULL)

INSERT INTO CV VALUES('tugcesyknlinkedin','qwebank',20140610,20140820)
INSERT INTO CV VALUES('tugcesyknlinkedin','xyzsoft',20150720,NULL)

INSERT INTO CV VALUES('selimarikanlinkedin','abctech',20160710,NULL)

INSERT INTO CV VALUES('burcuyldrmlinkedin','qwebank',20150804,NULL)
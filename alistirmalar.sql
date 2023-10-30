SELECT * FROM adresler
USE odev
INSERT INTO adresler VALUES('Kýlýçaslan','Melikgazi',10,'Kayseri','38030','Türkiye')

SELECT * FROM uyeler
USE odev
INSERT INTO uyeler VALUES('Ýrem','Odabaþý','0','9','5466017490','iremodabasi@gmail.com')

SELECT * FROM kutuphane
USE odev
INSERT INTO kutuphane VALUES('9','Kayseri Belediyesi Merkez Kütüphanesi','Yoðun ilgi var, eksik kalýyor')

SELECT * FROM kitaplar
USE odev
INSERT INTO kitaplar VALUES(6060509040, 'Beyin Haritasý', '2021-02-15' , 106)

SELECT * FROM emanet
USE odev
INSERT INTO emanet VALUES(6057479360,10,3,'2023-01-05', NULL)

USE odev
UPDATE emanet SET teslim_Tarih='2023-03-10' WHERE uye_id=10

SELECT adresler.sehir FROM adresler INNER JOIN uyeler ON adresler.adresNo = uyeler.adresNo ORDER BY sehir ASC;

SELECT * FROM uyeler ORDER BY uye_id ASC

SELECT * FROM uyeler WHERE adresNo=(SELECT adresNo FROM adresler WHERE sehir='Kayseri') AND telefon LIKE '%6%'

SELECT COUNT(*) FROM uyeler WHERE adresNo=(SELECT adresNo FROM adresler WHERE sehir='Eskiþehir')

SELECT COUNT(*) FROM emanet WHERE emanet_Tarih>='2020-01-01' AND emanet_Tarih<='2020-12-31';

SELECT kitaplar.isim, uyeler.ad, uyeler.soyad FROM kitaplar
INNER JOIN emanet ON kitaplar.isbn= emanet.isbn 
INNER JOIN uyeler ON emanet.uye_id = uyeler.uye_id;

SELECT * FROM kitaplar WHERE isbn=(SELECT isbn FROM emanet WHERE emanet_Tarih>='2023-01-01')

SELECT * FROM Kitaplar WHERE yayýn_Tarih < DATEADD(YEAR, -3, GETDATE());
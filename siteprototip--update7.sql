CREATE DATABASE site_prototipi;
GO
USE site_prototipi;
GO

CREATE TABLE kategori
(
    kategoriID INT PRIMARY KEY IDENTITY(1,1),
    kategoriAdi NVARCHAR(50) NOT NULL
);

CREATE TABLE satici
(
    saticiID INT PRIMARY KEY IDENTITY(1,1),
    saticiAdi NVARCHAR(100) NOT NULL,
    saticiAdres NVARCHAR(200) NOT NULL
);

CREATE TABLE musteri
(
    musteriID INT PRIMARY KEY IDENTITY(1,1),
    ad NVARCHAR(25) NOT NULL,
    soyad NVARCHAR(25) NOT NULL,
    mail NVARCHAR(50) NOT NULL UNIQUE,
    sehir NVARCHAR(15) NULL,
    kayitTarihi DATETIME NULL
);

CREATE TABLE urun
(
    urunID INT PRIMARY KEY IDENTITY(1,1),
    urunAdi NVARCHAR(100) NOT NULL,
    urunFiyat MONEY DEFAULT 0,
    urunStok SMALLINT DEFAULT 0,
    kategoriID INT,
    saticiID INT,
    FOREIGN KEY (kategoriID) REFERENCES kategori(kategoriID),
    FOREIGN KEY (saticiID) REFERENCES satici(saticiID)
);

CREATE TABLE siparis
(
    siparisID INT PRIMARY KEY IDENTITY(1,1),
    musteriID INT NOT NULL,
    siparisTarihi DATETIME NOT NULL,
    toplamTutar MONEY DEFAULT 0,
    odemeTuru NVARCHAR(20),
    FOREIGN KEY (musteriID) REFERENCES musteri(musteriID)
);

CREATE TABLE siparisDetay
(
    id INT PRIMARY KEY IDENTITY(1,1),
    siparisID INT NOT NULL,
    urunID INT NOT NULL,
    adet SMALLINT DEFAULT 1,
    fiyat MONEY DEFAULT 0,
    FOREIGN KEY (siparisID) REFERENCES siparis(siparisID),
    FOREIGN KEY (urunID) REFERENCES urun(urunID)
);

INSERT INTO kategori (kategoriAdi)
VALUES 
    ('Elektronik'),
    ('Telefon & Aksesuar'),
    ('Bilgisayar & Tablet'),
    ('Ev & Ya�am'),
    ('Mobilya'),
    ('Moda & Giyim'),
    ('Ayakkab� & �anta'),
    ('Kozmetik & Ki�isel Bak�m'),
    ('Spor & Outdoor'),
    ('Kitap & Hobi'),
    ('Oyuncak & Bebek'),
    ('Mutfak & Ev Aletleri');

INSERT INTO satici (saticiAdi, saticiAdres)
VALUES 
    ('TechnoMax Elektronik', 'Maslak Mahallesi Ahi Evran Cad. No:4 Sar�yer/�STANBUL'),
    ('Dijital D�nya', '�ankaya Mahallesi Muhsin Yaz�c�o�lu Cad. No:67 �ankaya/ANKARA'),
    ('MegaTech Store', 'Konak Mahallesi Cumhuriyet Bulvar� No:152 Konak/�ZM�R'),
    ('Ev & Dekor Merkezi', 'Nil�fer Mahallesi Ankara Yolu Cad. No:234 Nil�fer/BURSA'),
    ('ModaStyle Giyim', 'Seyhan Mahallesi �n�n� Cad. No:89 Seyhan/ADANA'),
    ('Ayakkab� D�nyas�', 'Yeni�ehir Mahallesi Atat�rk Blv. No:456 Yeni�ehir/MERS�N'),
    ('Kozmetik Cenneti', 'Bornova Mahallesi Kaz�m Dirik Cad. No:78 Bornova/�ZM�R'),
    ('Spor & Fitness', '�ayyolu Mahallesi Alacaatl� Cad. No:34 �ankaya/ANKARA'),
    ('KitapSaray', 'Kad�k�y Mahallesi Bahariye Cad. No:123 Kad�k�y/�STANBUL'),
    ('Oyuncak Krall���', 'Kar��yaka Mahallesi �emikler Cad. No:90 Kar��yaka/�ZM�R'),
    ('Mutfak D�nyas�', 'Osmangazi Mahallesi Atat�rk Cad. No:167 Osmangazi/BURSA'),
    ('Mobilya Palace', 'Ke�i�ren Mahallesi Sakarya Cad. No:245 Ke�i�ren/ANKARA');

INSERT INTO musteri (ad, soyad, mail, sehir, kayitTarihi)
VALUES 
    ('Melis', '�elik', 'melis.celik36@hotmail.com', 'Mersin', '2019-07-26'),
    ('Seda', '�elik', 'seda.celik@protonmail.com', '�zmir', '2024-08-15'),
    ('Kerem', 'Kaya', 'kerem.kaya28@hotmail.com', '�anl�urfa', '2024-10-01'),
    ('Ahmet', '�etin', 'ahmet.cetin84@mail.com', 'Malatya', '2022-09-15'),
    ('Yusuf', 'Bulut', 'yusuf.bulut@gmail.com', 'Adana', '2022-09-28'),
    ('Emre', '�zt�rk', 'emre.ozturk98@outlook.com', 'Bursa', '2019-01-15'),
    ('Mert', '�elik', 'mert.celik@outlook.com', 'Batman', '2020-12-19'),
    ('Sinem', 'Kaya', 'sinem.kaya@protonmail.com', 'Bursa', '2022-03-31'),
    ('Ali', '�etin', 'ali.cetin81@protonmail.com', 'Gaziantep', '2024-06-22'),
    ('�brahim', 'Kaplan', 'ibrahim.kaplan85@hotmail.com', 'Samsun', '2018-11-23'),
    ('Tolga', 'Ayd�n', 'tolga.aydin@yahoo.com', 'Kayseri', '2023-02-01'),
    ('Melis', 'G�ler', 'melis.guler@outlook.com', 'Gaziantep', '2020-05-08'),
    ('Deniz', '�zt�rk', 'deniz.ozturk@mail.com', '�zmir', '2024-10-31'),
    ('Melis', 'Y�ld�z', 'melis.yildiz@hotmail.com', 'Adana', '2023-03-09'),
    ('Can', 'Demir', 'can.demir@gmail.com', '�stanbul', '2021-05-12'),
    ('Zeynep', 'Arslan', 'zeynep.arslan@outlook.com', 'Ankara', '2020-08-20'),
    ('Burak', '�ahin', 'burak.sahin@mail.com', '�zmir', '2023-11-05'),
    ('Ay�e', 'Y�lmaz', 'ayse.yilmaz@gmail.com', 'Bursa', '2019-03-18');

    
INSERT INTO urun (urunAdi, urunFiyat, urunStok, kategoriID, saticiID)
VALUES 
    -- Elektronik & Bilgisayar (Kategori 1,2,3)
    ('iPhone 15 Pro 256GB', 52999.00, 45, 2, 1),
    ('Samsung Galaxy S24 Ultra', 48999.00, 38, 2, 2),
    ('MacBook Air M2 13"', 42999.00, 22, 3, 1),
    ('Lenovo IdeaPad Gaming 3', 28999.00, 15, 3, 3),
    ('Apple Watch Series 9', 15999.00, 67, 1, 1),
    ('Sony WH-1000XM5 Kulakl�k', 12499.00, 89, 1, 2),
    ('iPad Air 11" 128GB', 24999.00, 31, 3, 1),
    ('Samsung 55" QLED TV', 32999.00, 18, 1, 3),
    ('Airpods Pro 2.Nesil', 8999.00, 120, 2, 1),
    ('Xiaomi Redmi Note 13 Pro', 11999.00, 95, 2, 2),
    
    -- Ev & Ya�am & Mobilya (Kategori 4,5,12)
    ('Koltuk Tak�m� 3+2+1', 45999.00, 8, 5, 12),
    ('Bellona Yatak Odas� Tak�m�', 67999.00, 5, 5, 12),
    ('Yemek Masas� 6 Ki�ilik', 18999.00, 12, 5, 4),
    ('Philips S�p�rge Robotu', 8999.00, 34, 12, 4),
    ('Arzum �ay Makinesi', 2499.00, 78, 12, 11),
    ('Karaca Tencere Seti 12 Par�a', 3499.00, 56, 12, 11),
    ('Faber Ankastre Set', 24999.00, 9, 12, 4),
    ('Elektrikli S�p�rge Bosch', 5999.00, 43, 12, 11),
    
    -- Moda & Giyim (Kategori 6,7)
    ('Levis 501 Kot Pantolon', 1899.00, 150, 6, 5),
    ('Nike Air Max Spor Ayakkab�', 4299.00, 85, 7, 8),
    ('Adidas Ultraboost 22', 5499.00, 67, 7, 8),
    ('Mavi Jeans Ceket', 2499.00, 92, 6, 5),
    ('LC Waikiki Sweatshirt', 599.00, 230, 6, 5),
    ('Puma Spor �anta', 899.00, 145, 7, 6),
    ('Koton Elbise', 1299.00, 167, 6, 5),
    
    -- Kozmetik (Kategori 8)
    ('LOreal Paris Krem', 349.00, 234, 8, 7),
    ('Nivea Nemlendirici Set', 289.00, 345, 8, 7),
    ('Maybelline Maskara', 199.00, 456, 8, 7),
    ('Gillette T�ra� B��a�� 8li', 249.00, 278, 8, 7),
    
    -- Spor (Kategori 9)
    ('Yoga Mat Premium', 449.00, 112, 9, 8),
    ('Decathlon Bisiklet', 8999.00, 15, 9, 8),
    ('Damb�l Seti 20KG', 1299.00, 45, 9, 8),
    
    -- Kitap (Kategori 10)
    ('Su� ve Ceza - Dostoyevski', 89.00, 234, 10, 9),
    ('1984 - George Orwell', 75.00, 345, 10, 9),
    ('Simyac� - Paulo Coelho', 65.00, 456, 10, 9),
    
    -- Oyuncak (Kategori 11)
    ('LEGO Star Wars Set', 2999.00, 34, 11, 10),
    ('Barbie Bebek Seti', 899.00, 78, 11, 10),
    ('Hot Wheels Araba Seti', 349.00, 156, 11, 10);

INSERT INTO siparis (musteriID, siparisTarihi, toplamTutar, odemeTuru)
VALUES 
    (1, '2024-01-15 10:23:00', 53499.00, 'Kredi Kart�'),
    (1, '2024-03-22 14:45:00', 16498.00, 'Kredi Kart�'),
    (2, '2024-02-10 09:15:00', 48999.00, 'Kredi Kart�'),
    (3, '2024-04-05 16:30:00', 8999.00, 'Kap�da �deme'),
    (4, '2024-05-12 11:20:00', 45999.00, 'Banka Kart�'),
    (5, '2024-06-18 13:40:00', 24999.00, 'Kredi Kart�'),
    (6, '2024-07-22 15:10:00', 67999.00, 'Havale'),
    (7, '2024-08-08 10:50:00', 1898.00, 'Kredi Kart�'),
    (8, '2024-08-15 12:25:00', 6098.00, 'Banka Kart�'),
    (9, '2024-09-01 14:35:00', 11999.00, 'Kredi Kart�'),
    (10, '2024-09-10 09:40:00', 8999.00, 'Kap�da �deme'),
    (1, '2024-09-18 16:20:00', 4299.00, 'Kredi Kart�'),
    (11, '2024-09-25 11:15:00', 2499.00, 'Banka Kart�'),
    (12, '2024-09-28 13:50:00', 18999.00, 'Kredi Kart�'),
    (13, '2024-09-29 10:30:00', 889.00, 'Kap�da �deme'),
    (2, '2024-09-30 15:45:00', 12499.00, 'Kredi Kart�'),
    (14, '2024-10-01 09:20:00', 32999.00, 'Havale'),
    (15, '2024-10-02 14:10:00', 5499.00, 'Kredi Kart�');

INSERT INTO siparisDetay (siparisID, urunID, adet, fiyat)
VALUES 
    -- Sipari� 1 (Melis �elik - iPhone)
    (1, 1, 1, 52999.00),
    (1, 9, 1, 500.00), -- Hediye kulakl�k indirimi
    
    -- Sipari� 2 (Melis �elik - Apple Watch + Kulakl�k)
    (2, 5, 1, 15999.00),
    (2, 9, 1, 499.00),
    
    -- Sipari� 3 (Seda �elik - Samsung S24)
    (3, 2, 1, 48999.00),
    
    -- Sipari� 4 (Kerem Kaya - Decathlon Bisiklet)
    (4, 32, 1, 8999.00),
    
    -- Sipari� 5 (Ahmet �etin - Koltuk Tak�m�)
    (5, 11, 1, 45999.00),
    
    -- Sipari� 6 (Yusuf Bulut - iPad Air)
    (6, 7, 1, 24999.00),
    
    -- Sipari� 7 (Emre �zt�rk - Yatak Odas�)
    (7, 12, 1, 67999.00),
    
    -- Sipari� 8 (Mert �elik - Kot Pantolon)
    (8, 19, 1, 1899.00),
    
    -- Sipari� 9 (Sinem Kaya - Spor Ayakkab� + �anta)
    (9, 20, 1, 4299.00),
    (9, 24, 2, 899.00),
    
    -- Sipari� 10 (Ali �etin - Xiaomi Telefon)
    (10, 10, 1, 11999.00),
    
    -- Sipari� 11 (�brahim Kaplan - Decathlon Bisiklet)
    (11, 32, 1, 8999.00),
    
    -- Sipari� 12 (Melis �elik - Nike Ayakkab�)
    (12, 20, 1, 4299.00),
    
    -- Sipari� 13 (Tolga Ayd�n - Arzum �ay Makinesi)
    (13, 15, 1, 2499.00),
    
    -- Sipari� 14 (Melis G�ler - Yemek Masas�)
    (14, 13, 1, 18999.00),
    
    -- Sipari� 15 (Deniz �zt�rk - Kitaplar)
    (15, 34, 2, 89.00),
    (15, 35, 2, 75.00),
    (15, 36, 3, 65.00),
    (15, 39, 1, 349.00),
    
    -- Sipari� 16 (Seda �elik - Sony Kulakl�k)
    (16, 6, 1, 12499.00),
    
    -- Sipari� 17 (Melis Y�ld�z - Samsung TV)
    (17, 8, 1, 32999.00),
    
    -- Sipari� 18 (Can Demir - Adidas Ayakkab�)
    (18, 21, 1, 5499.00);


-- 1: Sipari� verildi�inde stok azaltma
UPDATE urun 
SET urunStok = urunStok - 1 
WHERE urunID = 1;

-- 2: Toplu fiyat g�ncelleme - Elektronik kategorisine %5 zam
UPDATE urun 
SET urunFiyat = urunFiyat * 1.05 
WHERE kategoriID IN (1, 2, 3);

-- 3: M��teri bilgisi g�ncelleme
UPDATE musteri 
SET sehir = '�stanbul' 
WHERE musteriID = 3;

-- 4: Sipari� tutar�n� g�ncelleme (detaylardan hesaplama)
UPDATE s
SET s.toplamTutar = (
    SELECT SUM(sd.adet * sd.fiyat)
    FROM siparisDetay sd
    WHERE sd.siparisID = s.siparisID
)
FROM siparis s;

-- 5: Kritik stok seviyesindeki �r�nlerin fiyat�n� art�r
UPDATE urun 
SET urunFiyat = urunFiyat * 1.10 
WHERE urunStok < 20;

-- 6: �ptal edilen sipari�i silme
DELETE FROM siparisDetay WHERE siparisID = 18;
DELETE FROM siparis WHERE siparisID = 18;

-- 7: Stokta olmayan �r�nleri silme
DELETE FROM urun WHERE urunStok = 0;

-- En �ok sipari� veren 5 m��teri
SELECT TOP 5 
    m.musteriID,
    m.ad + ' ' + m.soyad AS musteriAdSoyad,
    m.mail,
    m.sehir,
    COUNT(DISTINCT s.siparisID) AS siparisSayisi,
    SUM(s.toplamTutar) AS toplamHarcama,
    AVG(s.toplamTutar) AS ortalamaSiparisTutari,
    MAX(s.siparisTarihi) AS sonSiparisTarihi
FROM musteri m
INNER JOIN siparis s ON m.musteriID = s.musteriID
GROUP BY m.musteriID, m.ad, m.soyad, m.mail, m.sehir
ORDER BY siparisSayisi DESC, toplamHarcama DESC;

-- En �ok sat�lan �r�nler (adet baz�nda)
SELECT TOP 10
    u.urunID,
    u.urunAdi,
    k.kategoriAdi,
    sa.saticiAdi,
    u.urunFiyat,
    SUM(sd.adet) AS toplamSatilanAdet,
    COUNT(DISTINCT sd.siparisID) AS siparisSayisi,
    SUM(sd.adet * sd.fiyat) AS toplamCiro,
    u.urunStok AS mevcutStok
FROM urun u
INNER JOIN siparisDetay sd ON u.urunID = sd.urunID
INNER JOIN kategori k ON u.kategoriID = k.kategoriID
INNER JOIN satici sa ON u.saticiID = sa.saticiID
GROUP BY u.urunID, u.urunAdi, k.kategoriAdi, sa.saticiAdi, u.urunFiyat, u.urunStok
ORDER BY toplamSatilanAdet DESC;

-- En y�ksek cirosu olan sat�c�lar
SELECT TOP 10
    sa.saticiID,
    sa.saticiAdi,
    sa.saticiAdres,
    COUNT(DISTINCT u.urunID) AS urunSayisi,
    COUNT(DISTINCT sd.siparisID) AS siparisSayisi,
    SUM(sd.adet) AS toplamSatilanUrun,
    SUM(sd.adet * sd.fiyat) AS toplamCiro,
    AVG(sd.fiyat) AS ortalamaUrunFiyati
FROM satici sa
INNER JOIN urun u ON sa.saticiID = u.saticiID
INNER JOIN siparisDetay sd ON u.urunID = sd.urunID
GROUP BY sa.saticiID, sa.saticiAdi, sa.saticiAdres
ORDER BY toplamCiro DESC;


-- �ehirlere g�re m��teri say�s� ve harcama istatistikleri
SELECT 
    m.sehir,
    COUNT(DISTINCT m.musteriID) AS musteriSayisi,
    COUNT(s.siparisID) AS toplamSiparisSayisi,
    SUM(s.toplamTutar) AS toplamCiro,
    AVG(s.toplamTutar) AS ortalamaSiparisTutari,
    MAX(s.toplamTutar) AS enYuksekSiparis
FROM musteri m
LEFT JOIN siparis s ON m.musteriID = s.musteriID
WHERE m.sehir IS NOT NULL
GROUP BY m.sehir
ORDER BY toplamCiro DESC;

-- Kategori bazl� toplam sat��lar ve performans analizi
SELECT 
    k.kategoriID,
    k.kategoriAdi,
    COUNT(DISTINCT u.urunID) AS urunSayisi,
    COUNT(DISTINCT sd.siparisID) AS siparisSayisi,
    SUM(sd.adet) AS toplamSatilanUrunAdedi,
    SUM(sd.adet * sd.fiyat) AS toplamCiro,
    AVG(sd.fiyat) AS ortalamaUrunFiyati,
    MIN(sd.fiyat) AS enDusukFiyat,
    MAX(sd.fiyat) AS enYuksekFiyat
FROM kategori k
LEFT JOIN urun u ON k.kategoriID = u.kategoriID
LEFT JOIN siparisDetay sd ON u.urunID = sd.urunID
GROUP BY k.kategoriID, k.kategoriAdi
ORDER BY toplamCiro DESC;

-- Aylara g�re sipari� say�s� ve ciro trendi
SELECT 
    YEAR(siparisTarihi) AS yil,
    MONTH(siparisTarihi) AS ay,
    DATENAME(MONTH, siparisTarihi) AS ayAdi,
    COUNT(*) AS siparisSayisi,
    SUM(toplamTutar) AS aylikCiro,
    AVG(toplamTutar) AS ortalamaSiparisTutari,
    MIN(toplamTutar) AS enDusukSiparis,
    MAX(toplamTutar) AS enYuksekSiparis,
    COUNT(DISTINCT musteriID) AS benzersizMusteriSayisi
FROM siparis
GROUP BY YEAR(siparisTarihi), MONTH(siparisTarihi), DATENAME(MONTH, siparisTarihi)
ORDER BY yil DESC, ay DESC;

-- �deme t�r�ne g�re analiz
SELECT 
    odemeTuru,
    COUNT(*) AS siparisSayisi,
    SUM(toplamTutar) AS toplamCiro,
    AVG(toplamTutar) AS ortalamaSiparisTutari,
    MIN(toplamTutar) AS minimumTutar,
    MAX(toplamTutar) AS maksimumTutar,
    CAST(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM siparis) AS DECIMAL(5,2)) AS yuzdeOrani
FROM siparis
GROUP BY odemeTuru
ORDER BY toplamCiro DESC;

-- Sipari�lerde tam detay bilgisi (M��teri + �r�n + Sat�c� + Kategori)
SELECT 
    s.siparisID,
    s.siparisTarihi,
    s.odemeTuru,
    m.ad + ' ' + m.soyad AS musteriAdSoyad,
    m.mail AS musteriMail,
    m.sehir AS musteriSehir,
    u.urunAdi,
    u.urunFiyat AS urunListeFiyati,
    sd.fiyat AS urunSatisFiyati,
    sd.adet,
    sd.adet * sd.fiyat AS satirToplami,
    k.kategoriAdi,
    sa.saticiAdi,
    sa.saticiAdres,
    s.toplamTutar AS siparisToplami
FROM siparis s
INNER JOIN musteri m ON s.musteriID = m.musteriID
INNER JOIN siparisDetay sd ON s.siparisID = sd.siparisID
INNER JOIN urun u ON sd.urunID = u.urunID
INNER JOIN kategori k ON u.kategoriID = k.kategoriID
INNER JOIN satici sa ON u.saticiID = sa.saticiID
ORDER BY s.siparisTarihi DESC, s.siparisID;

-- Hi� sat�lmam�� �r�nler (Stokta bekleyen �r�nler)
SELECT 
    u.urunID,
    u.urunAdi,
    u.urunFiyat,
    u.urunStok,
    k.kategoriAdi,
    sa.saticiAdi,
    u.urunFiyat * u.urunStok AS stokDegeri,
    DATEDIFF(DAY, GETDATE(), GETDATE()) AS gunSayisi -- Eklenme tarihi olsayd� kullan�l�rd�
FROM urun u
INNER JOIN kategori k ON u.kategoriID = k.kategoriID
INNER JOIN satici sa ON u.saticiID = sa.saticiID
LEFT JOIN siparisDetay sd ON u.urunID = sd.urunID
WHERE sd.urunID IS NULL
ORDER BY u.urunFiyat * u.urunStok DESC;

/*Not: M��teriler, Kategoriler gibi ba�l�klarda ki�i ve kategori adlar� yapay zekadan al�nm��t�r.
Ki�iler ger�ek ki�ileri yans�tmamaktad�r. Fiyatlar�n ve saatlerin ayr�nt�l� olmas�n�n sebebi de yapay zekad�r.
Ayr�ca kodlarken hata ald���m noktalar oldu bu hatalar� yapay zeka yard�m�yla d�zelltim.*/
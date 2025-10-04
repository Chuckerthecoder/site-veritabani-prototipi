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
    ('Ev & Yaþam'),
    ('Mobilya'),
    ('Moda & Giyim'),
    ('Ayakkabý & Çanta'),
    ('Kozmetik & Kiþisel Bakým'),
    ('Spor & Outdoor'),
    ('Kitap & Hobi'),
    ('Oyuncak & Bebek'),
    ('Mutfak & Ev Aletleri');

INSERT INTO satici (saticiAdi, saticiAdres)
VALUES 
    ('TechnoMax Elektronik', 'Maslak Mahallesi Ahi Evran Cad. No:4 Sarýyer/ÝSTANBUL'),
    ('Dijital Dünya', 'Çankaya Mahallesi Muhsin Yazýcýoðlu Cad. No:67 Çankaya/ANKARA'),
    ('MegaTech Store', 'Konak Mahallesi Cumhuriyet Bulvarý No:152 Konak/ÝZMÝR'),
    ('Ev & Dekor Merkezi', 'Nilüfer Mahallesi Ankara Yolu Cad. No:234 Nilüfer/BURSA'),
    ('ModaStyle Giyim', 'Seyhan Mahallesi Ýnönü Cad. No:89 Seyhan/ADANA'),
    ('Ayakkabý Dünyasý', 'Yeniþehir Mahallesi Atatürk Blv. No:456 Yeniþehir/MERSÝN'),
    ('Kozmetik Cenneti', 'Bornova Mahallesi Kazým Dirik Cad. No:78 Bornova/ÝZMÝR'),
    ('Spor & Fitness', 'Çayyolu Mahallesi Alacaatlý Cad. No:34 Çankaya/ANKARA'),
    ('KitapSaray', 'Kadýköy Mahallesi Bahariye Cad. No:123 Kadýköy/ÝSTANBUL'),
    ('Oyuncak Krallýðý', 'Karþýyaka Mahallesi Þemikler Cad. No:90 Karþýyaka/ÝZMÝR'),
    ('Mutfak Dünyasý', 'Osmangazi Mahallesi Atatürk Cad. No:167 Osmangazi/BURSA'),
    ('Mobilya Palace', 'Keçiören Mahallesi Sakarya Cad. No:245 Keçiören/ANKARA');

INSERT INTO musteri (ad, soyad, mail, sehir, kayitTarihi)
VALUES 
    ('Melis', 'Çelik', 'melis.celik36@hotmail.com', 'Mersin', '2019-07-26'),
    ('Seda', 'Çelik', 'seda.celik@protonmail.com', 'Ýzmir', '2024-08-15'),
    ('Kerem', 'Kaya', 'kerem.kaya28@hotmail.com', 'Þanlýurfa', '2024-10-01'),
    ('Ahmet', 'Çetin', 'ahmet.cetin84@mail.com', 'Malatya', '2022-09-15'),
    ('Yusuf', 'Bulut', 'yusuf.bulut@gmail.com', 'Adana', '2022-09-28'),
    ('Emre', 'Öztürk', 'emre.ozturk98@outlook.com', 'Bursa', '2019-01-15'),
    ('Mert', 'Çelik', 'mert.celik@outlook.com', 'Batman', '2020-12-19'),
    ('Sinem', 'Kaya', 'sinem.kaya@protonmail.com', 'Bursa', '2022-03-31'),
    ('Ali', 'Çetin', 'ali.cetin81@protonmail.com', 'Gaziantep', '2024-06-22'),
    ('Ýbrahim', 'Kaplan', 'ibrahim.kaplan85@hotmail.com', 'Samsun', '2018-11-23'),
    ('Tolga', 'Aydýn', 'tolga.aydin@yahoo.com', 'Kayseri', '2023-02-01'),
    ('Melis', 'Güler', 'melis.guler@outlook.com', 'Gaziantep', '2020-05-08'),
    ('Deniz', 'Öztürk', 'deniz.ozturk@mail.com', 'Ýzmir', '2024-10-31'),
    ('Melis', 'Yýldýz', 'melis.yildiz@hotmail.com', 'Adana', '2023-03-09'),
    ('Can', 'Demir', 'can.demir@gmail.com', 'Ýstanbul', '2021-05-12'),
    ('Zeynep', 'Arslan', 'zeynep.arslan@outlook.com', 'Ankara', '2020-08-20'),
    ('Burak', 'Þahin', 'burak.sahin@mail.com', 'Ýzmir', '2023-11-05'),
    ('Ayþe', 'Yýlmaz', 'ayse.yilmaz@gmail.com', 'Bursa', '2019-03-18');

    
INSERT INTO urun (urunAdi, urunFiyat, urunStok, kategoriID, saticiID)
VALUES 
    -- Elektronik & Bilgisayar (Kategori 1,2,3)
    ('iPhone 15 Pro 256GB', 52999.00, 45, 2, 1),
    ('Samsung Galaxy S24 Ultra', 48999.00, 38, 2, 2),
    ('MacBook Air M2 13"', 42999.00, 22, 3, 1),
    ('Lenovo IdeaPad Gaming 3', 28999.00, 15, 3, 3),
    ('Apple Watch Series 9', 15999.00, 67, 1, 1),
    ('Sony WH-1000XM5 Kulaklýk', 12499.00, 89, 1, 2),
    ('iPad Air 11" 128GB', 24999.00, 31, 3, 1),
    ('Samsung 55" QLED TV', 32999.00, 18, 1, 3),
    ('Airpods Pro 2.Nesil', 8999.00, 120, 2, 1),
    ('Xiaomi Redmi Note 13 Pro', 11999.00, 95, 2, 2),
    
    -- Ev & Yaþam & Mobilya (Kategori 4,5,12)
    ('Koltuk Takýmý 3+2+1', 45999.00, 8, 5, 12),
    ('Bellona Yatak Odasý Takýmý', 67999.00, 5, 5, 12),
    ('Yemek Masasý 6 Kiþilik', 18999.00, 12, 5, 4),
    ('Philips Süpürge Robotu', 8999.00, 34, 12, 4),
    ('Arzum Çay Makinesi', 2499.00, 78, 12, 11),
    ('Karaca Tencere Seti 12 Parça', 3499.00, 56, 12, 11),
    ('Faber Ankastre Set', 24999.00, 9, 12, 4),
    ('Elektrikli Süpürge Bosch', 5999.00, 43, 12, 11),
    
    -- Moda & Giyim (Kategori 6,7)
    ('Levis 501 Kot Pantolon', 1899.00, 150, 6, 5),
    ('Nike Air Max Spor Ayakkabý', 4299.00, 85, 7, 8),
    ('Adidas Ultraboost 22', 5499.00, 67, 7, 8),
    ('Mavi Jeans Ceket', 2499.00, 92, 6, 5),
    ('LC Waikiki Sweatshirt', 599.00, 230, 6, 5),
    ('Puma Spor Çanta', 899.00, 145, 7, 6),
    ('Koton Elbise', 1299.00, 167, 6, 5),
    
    -- Kozmetik (Kategori 8)
    ('LOreal Paris Krem', 349.00, 234, 8, 7),
    ('Nivea Nemlendirici Set', 289.00, 345, 8, 7),
    ('Maybelline Maskara', 199.00, 456, 8, 7),
    ('Gillette Týraþ Býçaðý 8li', 249.00, 278, 8, 7),
    
    -- Spor (Kategori 9)
    ('Yoga Mat Premium', 449.00, 112, 9, 8),
    ('Decathlon Bisiklet', 8999.00, 15, 9, 8),
    ('Dambýl Seti 20KG', 1299.00, 45, 9, 8),
    
    -- Kitap (Kategori 10)
    ('Suç ve Ceza - Dostoyevski', 89.00, 234, 10, 9),
    ('1984 - George Orwell', 75.00, 345, 10, 9),
    ('Simyacý - Paulo Coelho', 65.00, 456, 10, 9),
    
    -- Oyuncak (Kategori 11)
    ('LEGO Star Wars Set', 2999.00, 34, 11, 10),
    ('Barbie Bebek Seti', 899.00, 78, 11, 10),
    ('Hot Wheels Araba Seti', 349.00, 156, 11, 10);

INSERT INTO siparis (musteriID, siparisTarihi, toplamTutar, odemeTuru)
VALUES 
    (1, '2024-01-15 10:23:00', 53499.00, 'Kredi Kartý'),
    (1, '2024-03-22 14:45:00', 16498.00, 'Kredi Kartý'),
    (2, '2024-02-10 09:15:00', 48999.00, 'Kredi Kartý'),
    (3, '2024-04-05 16:30:00', 8999.00, 'Kapýda Ödeme'),
    (4, '2024-05-12 11:20:00', 45999.00, 'Banka Kartý'),
    (5, '2024-06-18 13:40:00', 24999.00, 'Kredi Kartý'),
    (6, '2024-07-22 15:10:00', 67999.00, 'Havale'),
    (7, '2024-08-08 10:50:00', 1898.00, 'Kredi Kartý'),
    (8, '2024-08-15 12:25:00', 6098.00, 'Banka Kartý'),
    (9, '2024-09-01 14:35:00', 11999.00, 'Kredi Kartý'),
    (10, '2024-09-10 09:40:00', 8999.00, 'Kapýda Ödeme'),
    (1, '2024-09-18 16:20:00', 4299.00, 'Kredi Kartý'),
    (11, '2024-09-25 11:15:00', 2499.00, 'Banka Kartý'),
    (12, '2024-09-28 13:50:00', 18999.00, 'Kredi Kartý'),
    (13, '2024-09-29 10:30:00', 889.00, 'Kapýda Ödeme'),
    (2, '2024-09-30 15:45:00', 12499.00, 'Kredi Kartý'),
    (14, '2024-10-01 09:20:00', 32999.00, 'Havale'),
    (15, '2024-10-02 14:10:00', 5499.00, 'Kredi Kartý');

INSERT INTO siparisDetay (siparisID, urunID, adet, fiyat)
VALUES 
    -- Sipariþ 1 (Melis Çelik - iPhone)
    (1, 1, 1, 52999.00),
    (1, 9, 1, 500.00), -- Hediye kulaklýk indirimi
    
    -- Sipariþ 2 (Melis Çelik - Apple Watch + Kulaklýk)
    (2, 5, 1, 15999.00),
    (2, 9, 1, 499.00),
    
    -- Sipariþ 3 (Seda Çelik - Samsung S24)
    (3, 2, 1, 48999.00),
    
    -- Sipariþ 4 (Kerem Kaya - Decathlon Bisiklet)
    (4, 32, 1, 8999.00),
    
    -- Sipariþ 5 (Ahmet Çetin - Koltuk Takýmý)
    (5, 11, 1, 45999.00),
    
    -- Sipariþ 6 (Yusuf Bulut - iPad Air)
    (6, 7, 1, 24999.00),
    
    -- Sipariþ 7 (Emre Öztürk - Yatak Odasý)
    (7, 12, 1, 67999.00),
    
    -- Sipariþ 8 (Mert Çelik - Kot Pantolon)
    (8, 19, 1, 1899.00),
    
    -- Sipariþ 9 (Sinem Kaya - Spor Ayakkabý + Çanta)
    (9, 20, 1, 4299.00),
    (9, 24, 2, 899.00),
    
    -- Sipariþ 10 (Ali Çetin - Xiaomi Telefon)
    (10, 10, 1, 11999.00),
    
    -- Sipariþ 11 (Ýbrahim Kaplan - Decathlon Bisiklet)
    (11, 32, 1, 8999.00),
    
    -- Sipariþ 12 (Melis Çelik - Nike Ayakkabý)
    (12, 20, 1, 4299.00),
    
    -- Sipariþ 13 (Tolga Aydýn - Arzum Çay Makinesi)
    (13, 15, 1, 2499.00),
    
    -- Sipariþ 14 (Melis Güler - Yemek Masasý)
    (14, 13, 1, 18999.00),
    
    -- Sipariþ 15 (Deniz Öztürk - Kitaplar)
    (15, 34, 2, 89.00),
    (15, 35, 2, 75.00),
    (15, 36, 3, 65.00),
    (15, 39, 1, 349.00),
    
    -- Sipariþ 16 (Seda Çelik - Sony Kulaklýk)
    (16, 6, 1, 12499.00),
    
    -- Sipariþ 17 (Melis Yýldýz - Samsung TV)
    (17, 8, 1, 32999.00),
    
    -- Sipariþ 18 (Can Demir - Adidas Ayakkabý)
    (18, 21, 1, 5499.00);


-- 1: Sipariþ verildiðinde stok azaltma
UPDATE urun 
SET urunStok = urunStok - 1 
WHERE urunID = 1;

-- 2: Toplu fiyat güncelleme - Elektronik kategorisine %5 zam
UPDATE urun 
SET urunFiyat = urunFiyat * 1.05 
WHERE kategoriID IN (1, 2, 3);

-- 3: Müþteri bilgisi güncelleme
UPDATE musteri 
SET sehir = 'Ýstanbul' 
WHERE musteriID = 3;

-- 4: Sipariþ tutarýný güncelleme (detaylardan hesaplama)
UPDATE s
SET s.toplamTutar = (
    SELECT SUM(sd.adet * sd.fiyat)
    FROM siparisDetay sd
    WHERE sd.siparisID = s.siparisID
)
FROM siparis s;

-- 5: Kritik stok seviyesindeki ürünlerin fiyatýný artýr
UPDATE urun 
SET urunFiyat = urunFiyat * 1.10 
WHERE urunStok < 20;

-- 6: Ýptal edilen sipariþi silme
DELETE FROM siparisDetay WHERE siparisID = 18;
DELETE FROM siparis WHERE siparisID = 18;

-- 7: Stokta olmayan ürünleri silme
DELETE FROM urun WHERE urunStok = 0;

-- En çok sipariþ veren 5 müþteri
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

-- En çok satýlan ürünler (adet bazýnda)
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

-- En yüksek cirosu olan satýcýlar
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


-- Þehirlere göre müþteri sayýsý ve harcama istatistikleri
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

-- Kategori bazlý toplam satýþlar ve performans analizi
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

-- Aylara göre sipariþ sayýsý ve ciro trendi
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

-- Ödeme türüne göre analiz
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

-- Sipariþlerde tam detay bilgisi (Müþteri + Ürün + Satýcý + Kategori)
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

-- Hiç satýlmamýþ ürünler (Stokta bekleyen ürünler)
SELECT 
    u.urunID,
    u.urunAdi,
    u.urunFiyat,
    u.urunStok,
    k.kategoriAdi,
    sa.saticiAdi,
    u.urunFiyat * u.urunStok AS stokDegeri,
    DATEDIFF(DAY, GETDATE(), GETDATE()) AS gunSayisi -- Eklenme tarihi olsaydý kullanýlýrdý
FROM urun u
INNER JOIN kategori k ON u.kategoriID = k.kategoriID
INNER JOIN satici sa ON u.saticiID = sa.saticiID
LEFT JOIN siparisDetay sd ON u.urunID = sd.urunID
WHERE sd.urunID IS NULL
ORDER BY u.urunFiyat * u.urunStok DESC;

/*Not: Müþteriler, Kategoriler gibi baþlýklarda kiþi ve kategori adlarý yapay zekadan alýnmýþtýr.
Kiþiler gerçek kiþileri yansýtmamaktadýr. Fiyatlarýn ve saatlerin ayrýntýlý olmasýnýn sebebi de yapay zekadýr.
Ayrýca kodlarken hata aldýðým noktalar oldu bu hatalarý yapay zeka yardýmýyla düzelltim.*/
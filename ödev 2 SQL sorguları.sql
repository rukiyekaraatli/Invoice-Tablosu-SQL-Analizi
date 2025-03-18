--Öncelikle invoice tablosunun bütün kolonlarını inceleyelim.

SELECT * FROM invoice

--Soru 1: Tüm değerleri NULL olan kayıtları bulma
--1.YOL
--Bu sorgu, her sütunun NULL olduğu kayıtları sayar:

SELECT COUNT(*) 
FROM invoice
WHERE invoice_id IS NULL 
AND customer_id IS NULL 
AND invoice_date IS NULL 
AND billing_address IS NULL 
AND billing_city IS NULL 
AND billing_state IS NULL 
AND billing_country IS NULL 
AND billingpostal_code IS NULL 
AND total IS NULL;

--2.YOL
--Sütun isimlerini tek tek yazmaya gerek kalmadan bu ikinci yöntemi kullanabiliriz:
--Bu, PostgreSQL'in IS DISTINCT FROM NULL özelliğini kullanarak tüm kolonların NULL olduğu satırları sayar.

-- Avantajlar:
-- Daha kısa ve okunabilir bir sorgu.
-- Yeni sütunlar eklendiğinde otomatik çalışmaya devam eder.
-- PostgreSQL'in performans optimizasyonlarını daha iyi kullanır.

SELECT COUNT(*) 
FROM invoice
WHERE NOT(invoice IS DISTINCT FROM NULL);

--Soru 2: Total değerlerinin iki katını almak ve yeni total ile karşılaştırmak
--Bu sorgu, total değerini iki katına çıkarır ve büyükten küçüğe sıralar.

SELECT invoice_id, total AS eski_total, (total * 2) AS yeni_total
FROM invoice
ORDER BY yeni_total DESC;


--Soru 3: Adresi kolonunu değiştirme ve belirli tarihe göre filtreleme
--Bu sorgu:
-- Adresin sadece soldan 3 ve sağdan 4 karakterini alır.
-- 2013 yılı ve Ağustos ayına ait verileri filtreler.

SELECT 
    invoice_id, 
    customer_id, 
    billing_address, 
    LEFT(billing_address, 3) || '...' || RIGHT(billing_address, 4) AS "Açık Adres",
    invoice_date
FROM invoice
WHERE TO_CHAR(invoice_date, 'YYYY-MM') = '2013-08';


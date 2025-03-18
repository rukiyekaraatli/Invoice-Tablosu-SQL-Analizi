Invoice Tablosu SQL Analizi
Proje Açıklaması
Bu repo, PostgreSQL kullanılarak invoice tablosunda yapılan veri analizi sorgularını içermektedir. NULL değer analizi, matematiksel işlemler, adres kısaltma ve tarih bazlı filtreleme gibi işlemler gerçekleştirilmiştir.
Kullanılan Sorgular ve Açıklamalar
1.	NULL Kontrolü: Tüm sütunları kontrol eden ve PostgreSQL optimizasyonu ile çalışan sorgular.
2.	Matematiksel İşlem: total değerini iki katına çıkararak sıralama.
3.	Adres Kısaltma & Tarih Filtreleme: billing_address verisini kısaltarak 2013 Ağustos ayına ait verileri getirme.
Başlangıç
Projeyi çalıştırmak için PostgreSQL veya herhangi bir SQL destekleyen veritabanında aşağıdaki adımları uygulayabilirsiniz:
-- Tablonuzu oluşturun ve veri ekleyin
CREATE TABLE invoice (
    invoice_id SERIAL PRIMARY KEY,
    customer_id INT,
    invoice_date TIMESTAMP,
    billing_address TEXT,
    billing_city TEXT,
    billing_state TEXT,
    billing_country TEXT,
    billingpostal_code TEXT,
    total NUMERIC
);
Çalıştırma
SQL dosyasını çalıştırmak için:
1.	PostgreSQL veya destekleyen bir SQL ortamına giriş yapın.
2.	invoice_analysis.sql dosyasını içe aktarın: 
3.	psql -U username -d database_name -f invoice_analysis.sql
4.	Sorguları çalıştırarak analizleri gerçekleştirin.
   
Lisans
Bu proje MIT lisansı ile korunmaktadır. Kullanım serbesttir.
________________________________________
Bu doküman, SQL veri analizi projeleri için kapsamlı bir rehber niteliğindedir ve GitHub için README dosyası olarak kullanılabilir.


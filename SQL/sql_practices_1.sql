DROP TABLE IF EXISTS cars;

CREATE TABLE cars(
car_id serial PRIMARY KEY,
brand varchar(255) NOT NULL,
model varchar(255) NOT NULL,
years INT 
				 );
				 
				
SELECT *
FROM cars c 



-- Insert Data (Field'lara Değer Ekleme):

INSERT INTO cars (brand,model,years)
VALUES ('Ford','Mustang',1964);


INSERT INTO cars (brand,model,years)
VALUES
('Volvo', 'p1800', 1968),
('BMW',' M1', 1978),
('Toyota', 'Celica', 1975);



-- Return ALL Columns:

SELECT * FROM cars c


-- Specify Columns :

SELECT brand,years
FROM cars c ;



INSERT INTO cars()



INSERT INTO cars (brand,model)
VALUES
('BMW','M3'),
('Toyota','Corolla'),
('Ford','Focus');


SELECT brand,model FROM cars c 


SELECT DISTINCT brand FROM cars c -- brand değerlerini 'no duplicate' olarak; yani tekrarsız-unique- olarak return eder.


SELECT *
FROM cars c 





DROP TABLE IF EXISTS cars_seller;

CREATE TABLE cars_seller(
brand varchar(50) NOT NULL,
price int NOT NULL,
car_id SERIAL,
FOREIGN KEY (car_id) REFERENCES cars(car_id)
);

SELECT *
FROM cars_seller





-- ALIAS:

-- Eğer tablodaki field'lar orijinal isimlerinin dışında bir harf veya isimle görüntülenmek istenirse aşağıdaki şekilde işlem yapılabilir.



SELECT 
	brand AS b,
	model AS m,
	years AS y
FROM cars AS c 



-- Field'ları yeniden isimlendirirken büyük harfle isimlendirme yapacaksak eğer, aşağıdaki şekilde büyük harf veya kelime "" çift tırnak
-- içerisine alınmalıdır.


SELECT 
	brand AS "B",
	model AS "M",
	years AS "Y"
FROM cars AS "C"



-- ORDER BY :

-- Tablo içerisinde yer alan field'lara ait değerlerin sıralanması için kullanılan komuttur.




SELECT *
FROM cars c 
ORDER BY years ASC;  -- İfade içerisindeki sıralamanın küçükten büyüğe doğru olmasını istersek "ORDER BY field_name" ASC şeklinde yazılır.




SELECT 
	brand AS "BRAND",
	model AS "MODEL",
	years AS "YEARS"
FROM cars c 
ORDER BY years DESC 


SELECT 
	brand AS "BRAND",
	model AS "MODEL",
	years AS "YEARS"
FROM cars AS CARS
ORDER BY years DESC NULLS LAST -- NULL değerleri field'ın sonunda görmek istersek bu şekilde yazmalıyız.







SELECT 
	brand AS "BRAND",
	model AS "MODEL",
	years AS "YEARS"
FROM cars AS "CARS"
ORDER BY years ASC NULLS FIRST -- NULL değerleri field'ın başında görmek istersek bu şekilde yazmalıyız.





SELECT 
	brand AS "BRAND",
	model AS "MODEL",
	years AS "YEARS"
FROM cars c 
ORDER BY brand ASC,years DESC NULLS LAST



SELECT 
	brand AS "BRAND",
	model AS "MODEL",
	years AS "YEARS"
FROM cars c 
ORDER BY 1 ASC,3 DESC NULLS LAST -- Burada field isimleri yerine field'ların tablodaki sıra sayısını yazdık.
								 -- Bu şekilde de işlem yapılabileceğini görmüş olduk.
								 -- Ancak bu tür bir yazım tavsiye edilmez!




------------------------------          ------------------------------          ------------------------------

-- LIMIT VE OFFSET KULLANIMI :

-- LIMIT komutu, baştan sonra olmak üzere yanına yazdğımız sayı adedinde değeri return etmemizi sağlar.

-- OFFSET komutunun kullanıldığı durumlarda, LIMIT komutundan önce yazıılıp yanına yazılan sayı adedince değeri atlamamızı sağlar.


SELECT 
	brand AS "BRAND",
	model AS "MODEL",
	years AS "YEARS"
FROM cars AS "CARS"
ORDER BY years ASC NULLS FIRST
OFFSET 4 -- İlk 4 değeri atla.
LIMIT 3; -- Yukarıdaki koşuldan sonra (İlk 4 değeri atladıktan sonra) gelen ilk 3 değeri getir demiş olduk.




SELECT 
	brand,
	model
FROM cars
ORDER BY brand ASC, model DESC NULLS LAST
OFFSET 4
ROW FETCH NEXT 3 ROW ONLY; -- Bu yazım şekli de alternatif bir yazımdır.
						   -- Yukarıdaki koşuldan sonra (İlk 4 değeri atladıktan sonra) gelen ilk 3 değeri getir demiş olduk.



-- Randomly Olarak Değerleri Return Etme :


SELECT 
	brand AS "BRAND",
	model AS "MODEL",
	years AS "YEARS"
FROM cars AS "CARS"
ORDER BY random() -- Bu şekilde, random olarak sırala demiş olduk.
LIMIT 3;





------------------------------          ------------------------------          ------------------------------          ------------------------------




-- ORDER BY - LENGTH KULLANIMI :

-- Tablo içerisinde yer alan field'lardaki değerlerin karakter uzunluğuna göre sıralama yapmak için "ORDER BY length" komutunu kullanırız.




SELECT *
FROM cars c
ORDER BY length(brand)


SELECT concat(brand,' ' ,model)
FROM cars c 
ORDER BY length(brand) + length(model);




SELECT concat(brand,' ' ,model) AS "CAR MODEL"
FROM cars c 
ORDER BY length(brand) + length(model);




SELECT concat(brand,' ' ,model) AS "CAR MODEL"
FROM cars c 
ORDER BY length(concat(brand,' ' ,model)); -- Yukarıdaki kod yazımının alternatifi olarak kullanılabilir.





------------------------------          ------------------------------          ------------------------------          ------------------------------



-- WHERE KOMUTU:

-- Tablo üzerinde belirli koşullara bağlı olarak yapılacak filtreleme işlemleri
-- için WHERE komutu kullanılır.

-- Belirlenen koşulları karşılayan kayıtları return etmek için kullanılır.

-- SELECT, UPDATE, DELETE sorgularını yaparaken hangi satırların işleme alınacağı WHERE koşulu ile belirlenir.

-- WHERE komutu kullanılırken Comparison Operators ya da Logical Operators ifadeleri kullanılır.




/*
 
 
Operatör	Anlamı :
=	Eşittir
<> veya !=	Eşit değildir
>	Büyüktür
<	Küçüktür
>=	Büyük eşittir
<=	Küçük eşittir
BETWEEN	Bir aralık içindedir
IN	Liste içindeki değerler
LIKE	Kalıplara göre eşleşir
IS NULL	NULL olan kayıtları bulur


*/



SELECT brand AS "Car-Brand"
FROM cars 
WHERE brand = 'BMW'; -- brand field'ında 'BMW' olan brand değerlerini RETURN eder.


SELECT brand ,model
FROM cars c 
WHERE brand <> 'Toyota'; -- brand field'ında 'Toyota' olmayan değerleri RETURN eder.


SELECT *
FROM cars c 
WHERE c.years > 1975; -- years field'ında 1975 ten büyük olan değerleri RETURN eder.


SELECT *
FROM cars c
WHERE years < 1970; -- years field'ında 1970 ten küçük olan değerleri RETURN eder.


SELECT *
FROM cars 
WHERE years BETWEEN 1970 AND 1980; -- years field'ında, 1970 ile 1980 arasında yer alan değerleri RETURN eder.


SELECT *
FROM cars c 
WHERE years NOT BETWEEN 1970 AND 1980; -- years field'ında, 1970 ile 1980 arasında yer almayan değerleri RETURN eder.



-- SQL Code Practice-2:

CREATE TABLE Employees (
    EmployeeID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    HireDate DATE NOT NULL,
    JobTitle VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    IsActive BOOLEAN DEFAULT TRUE
);


INSERT INTO Employees (FirstName, LastName, Email, PhoneNumber, HireDate, JobTitle, Department, Salary)
VALUES
('Ahmet', 'Yılmaz', 'ahmet.yilmaz@example.com', '5551234567', '2018-05-15', 'Yazılım Mühendisi', 'Bilgi Teknolojileri', 12000.00),
('Ayşe', 'Kaya', 'ayse.kaya@example.com', '5559876543', '2020-03-20', 'Proje Yöneticisi', 'Yönetim', 15000.00),
('Mehmet', 'Demir', 'mehmet.demir@example.com', '5556543210', '2017-08-01', 'Sistem Yöneticisi', 'Bilgi Teknolojileri', 11000.00),
('Fatma', 'Çelik', 'fatma.celik@example.com', '5554321098', '2019-11-10', 'İş Analisti', 'Yönetim', 12500.00),
('Ali', 'Öztürk', 'ali.ozturk@example.com', '5553210987', '2021-06-25', 'Veri Analisti', 'Bilgi Teknolojileri', 10000.00);


SELECT
	*
FROM 
	employees e;



/*

Employees Tablosu ile İlgili Sorular:

1- Tüm çalışanların bilgilerini listeleyin.
2- Sadece aktif olan çalışanları (IsActive = TRUE) listeleyin.
3- Maaşı 12,000 TL'den fazla olan çalışanların isimlerini ve maaşlarını listeleyin.
4- Maaşı 10,000 TL ile 15,000 TL arasında olan çalışanları listeleyin.
5- Çalışanların maaşlarının toplamını hesaplayın.
6- Bilgi Teknolojileri departmanında çalışanların isimlerini ve pozisyonlarını listeleyin.
7- İşe alım tarihi en eski olan çalışanı listeleyin.
8- Maaşı en yüksek olan 3 çalışanı listeleyin.
9- Her departmandaki çalışan sayısını listeleyin.
10- İş unvanlarına göre maaşların ortalamasını hesaplayın.
11- İsmi "Ali" olan çalışanların tüm bilgilerini listeleyin.
12- IsActive değeri FALSE olan tüm çalışanların listesini oluşturun.
13- Çalışanların maaşlarına %10 zam yapın ve yeni maaşlarını gösterin.
14- 2020’den sonra işe alınan çalışanların adlarını ve işe alım tarihlerini listeleyin.
15- Maaşı 15,000 TL'den az olan çalışanları "Junior Employee" olarak sınıflandıran bir sorgu oluşturun.


*/


-- SORU 1: Tüm çalışanların bilgilerini listeleyin.

SELECT 
	*
FROM 
	employees e; 





-- SORU 2: Sadece aktif olan çalışanları (IsActive = TRUE) listeleyin.

SELECT 
	*
FROM 
	employees e 
WHERE 
	isactive = TRUE; 





-- SORU 3: Maaşı 12,000 TL'den fazla olan çalışanların isimlerini ve maaşlarını listeleyin.

SELECT 
	e.firstname,
	e.salary
FROM 
	employees e
WHERE 
	e.salary > 12000;





-- SORU 4: Maaşı 10,000 TL ile 15,000 TL arasında olan çalışanları listeleyin.

SELECT 
	*
FROM 
	employees e
WHERE 
	salary BETWEEN 10000 AND 15000;





-- SORU 5: Çalışanların maaşlarının toplamını hesaplayın.

SELECT 
	sum(salary) AS total_salary 
FROM 
	employees e;





-- SORU 6: Bilgi Teknolojileri departmanında çalışanların isimlerini ve pozisyonlarını listeleyin.

SELECT 
	firstname,
	department
FROM 
	employees e
WHERE 
	department = 'Bilgi Teknolojileri';





-- SORU 7: İşe alım tarihi en eski olan çalışanı listeleyin.

SELECT 
	*
FROM 
	employees e 
ORDER BY
	hiredate ASC 
LIMIT 
	1;





-- SORU 8: Maaşı en yüksek olan 3 çalışanı listeleyin.

SELECT 
	*
FROM 
	employees e 
ORDER BY
	salary DESC 
LIMIT 
	3;





-- SORU 9: Her departmandaki çalışan sayısını listeleyin.

SELECT 
	department,
	count(*) AS employees_counts
FROM 
	employees e 
GROUP BY
	department;





-- SORU 10: İş unvanlarına göre maaşların ortalamasını hesaplayın.

	SELECT 
		jobtitle,
		avg(salary) AS  average_salary
	FROM 
		employees e 
	GROUP BY 
		jobtitle;



	
	
-- SORU 11: İsmi "Ali" olan çalışanların tüm bilgilerini listeleyin.
	
SELECT 
	*
FROM 
	employees e 
WHERE 
	firstname = 'Ali';





-- SORU 12: IsActive değeri FALSE olan tüm çalışanların listesini oluşturun.

SELECT 
	*
FROM 
	employees e
WHERE 
	isactive = FALSE ;

	
	


-- SORU 13: Çalışanların maaşlarına %10 zam yapın ve yeni maaşlarını gösterin.

UPDATE 
	employees 
SET 
	salary = salary + salary * 0.1;



SELECT 
	*
FROM 
	employees e
ORDER BY
	salary ASC;





-- SORU 14: 2020’den sonra işe alınan çalışanların adlarını ve işe alım tarihlerini listeleyin.

SELECT 
	*
FROM 
	employees e; 
WHERE 
	hiredate > '2020-01-01';





-- SORU 15: Maaşı 15,000 TL'den az olan çalışanları "Junior Employee" olarak sınıflandıran bir sorgu oluşturun.


-- Çözüm Yöntemi-1:

SELECT
	concat(firstname,' ',lastname) AS "Junior Employee", --GROUP BY kullanırken, sorguda seçilen tüm sütunların ya GROUP BY içinde listelenmesi ya da bir toplama fonksiyonuyla (SUM, COUNT, vb.) kullanılmaları gerekir.
	salary
FROM 
	employees e 
GROUP BY
	salary,
	firstname, -- SELECT altına yazılan tüm ifadeler GROUP BY altında da mutlaka yazılmalıdır.
	lastname
HAVING 
	salary < 15000;
	


	CREATE TABLE "Junior Employees" AS
SELECT 
	concat(firstname, ' ',lastname) AS "Junior Employee",
	salary
FROM 
	employees e
GROUP BY
	salary,
	firstname,
	lastname
HAVING 
	salary < 15000;
	
	

	
	
-- Çözüm Yöntemi-2:

SELECT 
	concat(firstname,' ',lastname) AS "Junior Employee",
	salary
FROM
	employees e 
WHERE 
	salary < 15000;
	
	
	CREATE TABLE JuniorEmployee AS
SELECT 
	concat(firstname,' ',lastname) AS "Junior Employee",
	salary
FROM
	employees e 
WHERE 
	salary < 15000;
	
	
SELECT 
	*
FROM 
	JuniorEmployee;

	
	


-----------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE Projects (
    ProjectID SERIAL PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    Budget DECIMAL(15, 2)
);



INSERT INTO Projects (ProjectName, StartDate, EndDate, Budget)
VALUES
('E-Ticaret Platformu Geliştirme', '2023-01-01', '2023-12-31', 500000.00),
('İnsan Kaynakları Otomasyonu', '2022-06-01', '2023-06-30', 200000.00),
('Siber Güvenlik Denetimi', '2023-03-01', NULL, 150000.00);





/*
Projects Tablosu ile İlgili Sorular:

16- Tüm projeleri ve bütçelerini listeleyin.
17- Henüz tamamlanmamış (EndDate IS NULL) projeleri listeleyin.
18- 2023 yılında başlayan projeleri listeleyin.
19- Bütçesi 200,000 TL'den fazla olan projeleri listeleyin.
20- Başlangıç tarihi en erken olan projeyi bulun.
21- Proje bütçelerinin toplamını hesaplayın.
22- Her projenin bütçesini E-Ticaret Platformu Geliştirme projesinin bütçesiyle karşılaştıran bir sorgu yazın.
23- Projelerin başlangıç ve bitiş tarihleri arasındaki toplam süreyi (gün olarak) hesaplayın.
24- En yüksek bütçeye sahip projeyi listeleyin.
25- Proje isimlerini alfabetik olarak sıralayın.

*/






-- SORU 16: Tüm projeleri ve bütçelerini listeleyin.

SELECT 
	projectname,
	budget 
FROM 
	projects p;





-- SORU 17: Henüz tamamlanmamış (EndDate IS NULL) projeleri listeleyin.

SELECT *
FROM projects p ;


SELECT 
	*
FROM 
	projects p 
WHERE
	enddate IS NULL; -- IS NULL: Sütunun NULL değerlerini kontrol eder.
					 -- IS NOT NULL: Sütunun NULL olmayan değerlerini kontrol eder.



	

-- SORU 18: 2023 yılında başlayan projeleri listeleyin.

SELECT 
	*
FROM 
	projects p 
WHERE 
	startdate >= '2023-01-01' AND startdate < '2024-01-01';





-- SORU 19: 19- Bütçesi 200,000 TL'den fazla olan projeleri listeleyin.

SELECT 
	projectname,
	budget 
FROM 
	projects p 
WHERE 
	budget > 200000;





-- SORU 20: Başlangıç tarihi en erken olan projeyi bulun.

SELECT 
	*
FROM 
	projects p 
ORDER BY
	startdate ASC
LIMIT 
	1;





-- SORU 21: Proje bütçelerinin toplamını hesaplayın.
	
SELECT 
	sum(budget) AS total_budget 
FROM 
	projects p ;





-- SORU 22: Her projenin bütçesini E-Ticaret Platformu Geliştirme projesinin bütçesiyle karşılaştıran bir sorgu yazın.

SELECT 
	projectname ,budget 
FROM 
	projects p 
GROUP BY 
	projectname,budget
ORDER BY 
	budget DESC ;



SELECT 
    p1.projectname,
    p1.budget,
    p1.budget - p2.budget AS budget_difference
FROM 
    projects p1
JOIN 
    projects p2
ON 
    p2.projectname = 'E-Ticaret Platformu Geliştirme'
ORDER BY 
    budget_difference DESC;





-- SORU 23: Projelerin başlangıç ve bitiş tarihleri arasındaki toplam süreyi (gün olarak) hesaplayın.

-- Çözüm Yöntemi-1:
SELECT 
	projectname,
	(enddate - startdate) AS "Project_Duration"
FROM
	projects p 
GROUP BY 
	projectname,
	startdate,
	enddate
ORDER BY 
	(enddate - startdate) ASC ;


-- Çözüm Yöntemi-2:
-- Yukarıdaki çözüm yönteminden farklı olarak GROUP BY yapısını kullanmadık.Daha az kod yazarak aynı sonuca ulaşmış olduk.

SELECT
	projectname,
	(enddate - startdate) AS "Project_Duration"
FROM 
	projects p
ORDER BY 
	(enddate - startdate) ASC ;





-- SORU 24: En yüksek bütçeye sahip projeyi listeleyin.

SELECT 
	projectname,
	max(budget) AS maximum_badget_project
FROM 
	projects p
GROUP BY
	projectname 
LIMIT 
	1;





-- 25- Proje isimlerini alfabetik olarak sıralayın.

SELECT 
	*
FROM 
	projects p;



SELECT 
	projectname 
FROM 
	projects p
ORDER BY
	projectname ASC;





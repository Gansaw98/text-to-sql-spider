SELECT count(*) FROM singer	concert_singer
SELECT count(*) FROM singer	concert_singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC	concert_singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC	concert_singer
SELECT avg(Age), min(Age), max(Age) FROM singer WHERE Country = 'France'	concert_singer
SELECT avg(Age), min(Age), max(Age) FROM singer WHERE Country = 'France'	concert_singer
SELECT Song_Name, Song_release_year FROM singer ORDER BY Age ASC LIMIT 1	concert_singer
SELECT Song_Name, Song_release_year FROM singer WHERE Age = (SELECT MIN(Age) FROM singer)	concert_singer
SELECT DISTINCT Country FROM singer WHERE Age > 20	concert_singer
SELECT DISTINCT Country FROM singer WHERE Age > 20	concert_singer
SELECT Country, count(*) FROM singer GROUP BY Country	concert_singer
SELECT Country, count(*) FROM singer GROUP BY Country	concert_singer
SELECT Song_Name FROM singer WHERE Age > (SELECT avg(Age) FROM singer)	concert_singer
SELECT Song_Name FROM singer WHERE Age > (SELECT avg(Age) FROM singer)	concert_singer
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000	concert_singer
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000	concert_singer
SELECT max(Capacity), avg(Capacity) FROM stadium	concert_singer
SELECT avg(Capacity), max(Capacity) FROM stadium	concert_singer
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium)	concert_singer
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium)	concert_singer
SELECT COUNT(*) FROM concert WHERE Year = '2014' OR Year = '2015'	concert_singer
SELECT COUNT(*) FROM concert WHERE Year = '2014' OR Year = '2015'	concert_singer
SELECT s.Name, count(c.concert_ID) FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Name	concert_singer
SELECT Stadium_ID, count(concert_ID) FROM concert GROUP BY Stadium_ID	concert_singer
SELECT s.Name, s.Capacity  FROM stadium s  JOIN concert c ON s.Stadium_ID = c.Stadium_ID  WHERE c.Year >= '2014'  GROUP BY s.Name, s.Capacity  ORDER BY count(c.concert_ID) DESC  LIMIT 1	concert_singer
SELECT T1.Name, T1.Capacity  FROM stadium AS T1  JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID  WHERE T2.Year > '2013'  GROUP BY T1.Name, T1.Capacity  ORDER BY COUNT(T2.concert_ID) DESC  LIMIT 1	concert_singer
SELECT Year FROM concert GROUP BY Year ORDER BY count(*) DESC LIMIT 1	concert_singer
SELECT Year FROM concert GROUP BY Year ORDER BY count(*) DESC LIMIT 1	concert_singer
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)	concert_singer
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)	concert_singer
SELECT T1.Country FROM singer AS T1 WHERE T1.Age > 40 INTERSECT SELECT T1.Country FROM singer AS T1 WHERE T1.Age < 30	concert_singer
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')	concert_singer
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')	concert_singer
SELECT c.concert_Name, c.Theme, count(sic.Singer_ID)  FROM concert c  JOIN singer_in_concert sic ON c.concert_ID = sic.concert_ID  GROUP BY c.concert_Name, c.Theme	concert_singer
SELECT T1.concert_Name, T1.Theme, count(T2.Singer_ID)  FROM concert T1  JOIN singer_in_concert T2 ON T1.concert_ID = T2.concert_ID  GROUP BY T1.concert_Name, T1.Theme	concert_singer
SELECT s.Name, count(sic.concert_ID)  FROM singer s  JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID  GROUP BY s.Name	concert_singer
SELECT s.Name, count(sc.concert_ID)  FROM singer s  JOIN singer_in_concert sc ON s.Singer_ID = sc.Singer_ID  GROUP BY s.Name	concert_singer
SELECT T2.Name FROM concert AS T1 INNER JOIN singer_in_concert AS T3 ON T1.concert_ID = T3.concert_ID INNER JOIN singer AS T2 ON T3.Singer_ID = T2.Singer_ID WHERE T1.Year = '2014'	concert_singer
SELECT T1.Name FROM singer AS T1 INNER JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID INNER JOIN concert AS T3 ON T2.concert_ID = T3.concert_ID WHERE T3.Year = '2014'	concert_singer
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'	concert_singer
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'	concert_singer
SELECT T1.Name, T1.Location FROM stadium AS T1  JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID  WHERE T2.Year IN ('2014', '2015')  GROUP BY T1.Name, T1.Location  HAVING COUNT(DISTINCT T2.Year) = 2	concert_singer
SELECT T1.Name, T1.Location  FROM stadium AS T1  JOIN concert AS T2  ON T1.Stadium_ID = T2.Stadium_ID  WHERE T2.Year IN ('2014', '2015')  GROUP BY T1.Name, T1.Location  HAVING COUNT(DISTINCT T2.Year) = 2	concert_singer
SELECT count(T1.concert_ID) FROM concert AS T1 INNER JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID ORDER BY T2.Capacity DESC LIMIT 1	concert_singer
SELECT count(T1.concert_ID) FROM concert AS T1 INNER JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID ORDER BY T2.Capacity DESC LIMIT 1	concert_singer
SELECT count(*) FROM Pets WHERE weight > 10	pets_1
SELECT count(*) FROM Pets WHERE weight > 10	pets_1
SELECT weight FROM Pets WHERE PetType = 'dog' ORDER BY pet_age ASC LIMIT 1	pets_1
SELECT MIN(weight) FROM Pets WHERE PetType = 'dog'	pets_1
SELECT max(weight) as max_weight, PetType FROM Pets GROUP BY PetType	pets_1
SELECT PetType, max(weight) FROM Pets GROUP BY PetType	pets_1
SELECT COUNT(*) FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE Age > 20)	pets_1
SELECT COUNT(DISTINCT T2.PetID) FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.Age > 20	pets_1
SELECT COUNT(*)  FROM Student  JOIN Has_Pet ON Student.StuID = Has_Pet.StuID  JOIN Pets ON Has_Pet.PetID = Pets.PetID  WHERE Student.Sex = 'F' AND Pets.PetType = 'dog'	pets_1
SELECT COUNT(*)  FROM Student  JOIN Has_Pet ON Student.StuID = Has_Pet.StuID  JOIN Pets ON Has_Pet.PetID = Pets.PetID  WHERE Student.Sex = 'F' AND Pets.PetType = 'dog'	pets_1
SELECT count(DISTINCT PetType) FROM Pets	pets_1
SELECT count(DISTINCT PetType) FROM Pets	pets_1
SELECT DISTINCT S.Fname  FROM Student S  JOIN Has_Pet HP ON S.StuID = HP.StuID  JOIN Pets P ON HP.PetID = P.PetID  WHERE P.PetType = 'cat' OR P.PetType = 'dog'	pets_1
SELECT DISTINCT S.Fname  FROM Student S  JOIN Has_Pet HP ON S.StuID = HP.StuID  JOIN Pets P ON HP.PetID = P.PetID  WHERE P.PetType = 'cat' OR P.PetType = 'dog'	pets_1
SELECT S.Fname  FROM Student S  JOIN Has_Pet HP ON S.StuID = HP.StuID  JOIN Pets P ON HP.PetID = P.PetID  WHERE P.PetType IN ('cat', 'dog')  GROUP BY S.Fname  HAVING COUNT(DISTINCT P.PetType) = 2	pets_1
SELECT DISTINCT S.Fname  FROM Student S  JOIN Has_Pet HP ON S.StuID = HP.StuID  JOIN Pets P ON HP.PetID = P.PetID  WHERE P.PetType = 'cat'  OR P.PetType = 'dog'  AND S.StuID IN (   SELECT S.StuID    FROM Student S    JOIN Has_Pet HP ON S.StuID = HP.StuID    JOIN Pets P ON HP.PetID = P.PetID    WHERE P.PetType = 'cat'    AND S.StuID IN (     SELECT S.StuID      FROM Student S      JOIN Has_Pet HP ON S.StuID = HP.StuID      JOIN Pets P ON HP.PetID = P.PetID      WHERE P.PetType = 'dog'   ) )	pets_1
SELECT S.Major, S.Age  FROM Student S  WHERE S.StuID NOT IN (   SELECT H.StuID    FROM Has_Pet H    JOIN Pets P ON H.PetID = P.PetID    WHERE P.PetType = 'cat' )	pets_1
SELECT S.Major, S.Age  FROM Student S  WHERE S.StuID NOT IN (   SELECT H.StuID    FROM Has_Pet H    JOIN Pets P ON H.PetID = P.PetID    WHERE P.PetType = 'cat' )	pets_1
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT H.StuID FROM Has_Pet H JOIN Pets P ON H.PetID = P.PetID WHERE P.PetType = 'cat')	pets_1
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT H.StuID FROM Has_Pet H JOIN Pets P ON H.PetID = P.PetID WHERE P.PetType = 'cat')	pets_1
SELECT S.Fname, S.Age  FROM Student S  WHERE S.StuID IN (   SELECT H.StuID    FROM Has_Pet H    JOIN Pets P ON H.PetID = P.PetID    WHERE P.PetType = 'dog' ) AND S.StuID NOT IN (   SELECT H.StuID    FROM Has_Pet H    JOIN Pets P ON H.PetID = P.PetID    WHERE P.PetType = 'cat' )	pets_1
SELECT S.Fname  FROM Student S  WHERE S.StuID IN (   SELECT H.StuID    FROM Has_Pet H    JOIN Pets P ON H.PetID = P.PetID    WHERE P.PetType = 'dog' ) AND S.StuID NOT IN (   SELECT H.StuID    FROM Has_Pet H    JOIN Pets P ON H.PetID = P.PetID    WHERE P.PetType = 'cat' )	pets_1
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1	pets_1
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1	pets_1
SELECT PetID, weight FROM Pets WHERE pet_age > 1	pets_1
SELECT PetID, weight FROM Pets WHERE pet_age > 1	pets_1
SELECT PetType, avg(pet_age) as average_age, max(pet_age) as max_age FROM Pets GROUP BY PetType	pets_1
SELECT PetType, avg(pet_age) as average_age, max(pet_age) as max_age FROM Pets GROUP BY PetType	pets_1
SELECT PetType, avg(weight) FROM Pets GROUP BY PetType	pets_1
SELECT PetType, avg(weight) FROM Pets GROUP BY PetType	pets_1
SELECT S.Fname, S.Age FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID	pets_1
SELECT DISTINCT Fname, Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet)	pets_1
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'	pets_1
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'	pets_1
SELECT StuID, count(PetID) FROM Has_Pet GROUP BY StuID	pets_1
SELECT StuID, count(PetID) FROM Has_Pet GROUP BY StuID	pets_1
SELECT S.Fname, S.Sex FROM Student S WHERE S.StuID IN (SELECT H.StuID FROM Has_Pet H GROUP BY H.StuID HAVING count(H.PetID) > 1)	pets_1
SELECT S.Fname, S.Sex FROM Student S WHERE S.StuID IN (SELECT H.StuID FROM Has_Pet H GROUP BY H.StuID HAVING count(H.PetID) > 1)	pets_1
SELECT S.LName FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' AND P.pet_age = 3	pets_1
SELECT S.LName FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' AND P.pet_age = 3	pets_1
SELECT avg(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)	pets_1
SELECT avg(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)	pets_1
SELECT count(*) FROM continents	car_1
SELECT count(*) FROM continents	car_1
SELECT c.ContId, c.Continent, count(co.CountryId)  FROM continents c  LEFT JOIN countries co ON c.ContId = co.Continent  GROUP BY c.ContId, c.Continent	car_1
SELECT c.ContId, c.Continent, count(co.CountryId)  FROM continents c  LEFT JOIN countries co ON c.ContId = co.Continent  GROUP BY c.ContId, c.Continent	car_1
SELECT count(*) FROM countries	car_1
SELECT count(*) FROM countries	car_1
SELECT T1.FullName, T1.Id, count(T2.ModelId)  FROM car_makers AS T1  JOIN model_list AS T2  ON T1.Id = T2.Maker  GROUP BY T1.FullName, T1.Id	car_1
SELECT T1.Id, T1.FullName, COUNT(T2.ModelId)  FROM car_makers T1  LEFT JOIN model_list T2  ON T1.Id = T2.Maker  GROUP BY T1.Id, T1.FullName	car_1
SELECT T1.Model FROM model_list AS T1 INNER JOIN car_names AS T2 ON T1.ModelId = T2.MakeId INNER JOIN cars_data AS T3 ON T2.MakeId = T3.Id ORDER BY T3.Horsepower ASC LIMIT 1	car_1
SELECT T1.Model FROM model_list AS T1 INNER JOIN car_names AS T2 ON T1.ModelId = T2.MakeId INNER JOIN cars_data AS T3 ON T2.MakeId = T3.Id ORDER BY T3.Horsepower LIMIT 1	car_1
SELECT T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Weight < (SELECT avg(Weight) FROM cars_data)	car_1
SELECT T2.Model FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId WHERE T1.Weight < (SELECT avg(Weight) FROM cars_data)	car_1
SELECT DISTINCT T1.Maker  FROM car_makers AS T1  JOIN model_list AS T2 ON T1.Id = T2.Maker  JOIN car_names AS T3 ON T2.ModelId = T3.MakeId  JOIN cars_data AS T4 ON T3.MakeId = T4.Id  WHERE T4.Year = 1970	car_1
SELECT DISTINCT T1.Maker FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN car_names AS T3 ON T2.ModelId = T3.ModelId INNER JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T4.Year = 1970	car_1
SELECT T1.Make, T2.Year FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id ORDER BY T2.Year ASC LIMIT 1	car_1
SELECT T1.Maker, T3.Year FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN cars_data AS T3 ON T2.ModelId = T3.Id ORDER BY T3.Year ASC LIMIT 1	car_1
SELECT DISTINCT T1.Model FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.ModelId = T2.Id WHERE T2.Year > 1980	car_1
SELECT DISTINCT T1.Model FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.ModelId = T2.Id WHERE T2.Year > 1980	car_1
SELECT T1.Continent, count(T2.CountryName)  FROM continents T1  JOIN countries T2 ON T1.ContId = T2.Continent  JOIN car_makers T3 ON T2.CountryId = T3.Country  GROUP BY T1.Continent	car_1
SELECT c.Continent, COUNT(cm.Id)  FROM continents c  JOIN countries co ON c.ContId = co.Continent  JOIN car_makers cm ON co.CountryId = cm.Country  GROUP BY c.Continent	car_1
SELECT T1.CountryName  FROM countries AS T1  JOIN car_makers AS T2  ON T1.CountryId = T2.Country  GROUP BY T1.CountryName  ORDER BY count(T2.Id) DESC  LIMIT 1	car_1
SELECT T1.CountryName FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryName ORDER BY COUNT(T2.Id) DESC LIMIT 1	car_1
SELECT COUNT(DISTINCT T2.Model), T1.FullName  FROM car_makers AS T1  JOIN model_list AS T2  ON T1.Id = T2.Maker  GROUP BY T1.FullName	car_1
SELECT T1.Id, T1.FullName, COUNT(T2.ModelId)  FROM car_makers T1  JOIN model_list T2 ON T1.Id = T2.Maker  GROUP BY T1.Id, T1.FullName	car_1
SELECT T2.Accelerate FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'amc hornet sportabout (sw)'	car_1
SELECT T2.Accelerate FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'amc hornet sportabout (sw)'	car_1
SELECT COUNT(T2.Id) FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T1.CountryName = 'France'	car_1
SELECT COUNT(DISTINCT T1.Id)  FROM car_makers AS T1  INNER JOIN countries AS T2  ON T1.Country = T2.CountryId  WHERE T2.CountryName = 'France'	car_1
SELECT COUNT(DISTINCT T3.Model)  FROM countries AS T1  JOIN car_makers AS T2 ON T1.CountryId = T2.Country  JOIN model_list AS T3 ON T2.Id = T3.Maker  WHERE T1.CountryName = 'USA'	car_1
SELECT COUNT(T2.ModelId)  FROM countries AS T1  INNER JOIN car_makers AS T3 ON T1.CountryId = T3.Country  INNER JOIN model_list AS T2 ON T3.Id = T2.Maker  WHERE T1.CountryName = 'United States'	car_1
SELECT avg(MPG) FROM cars_data WHERE Cylinders = 4	car_1
SELECT avg(MPG) FROM cars_data WHERE Cylinders = 4	car_1
SELECT MIN(T1.Weight) FROM cars_data AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.ModelId INNER JOIN car_makers AS T3 ON T2.Maker = T3.Id WHERE T1.Year = 1974 AND T1.Cylinders = 8	car_1
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974	car_1
SELECT T1.Maker, T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker	car_1
SELECT T1.Maker, T2.Model FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker	car_1
SELECT T1.CountryName, T1.CountryId FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryName, T1.CountryId	car_1
SELECT T1.CountryName, T1.CountryId FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T2.Maker IS NOT NULL	car_1
SELECT COUNT(*) FROM cars_data WHERE Horsepower > '150'	car_1
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150	car_1
SELECT Year, avg(Weight) FROM cars_data GROUP BY Year	car_1
SELECT Year, avg(Weight) FROM cars_data GROUP BY Year	car_1
SELECT T2.CountryName  FROM car_makers AS T1  JOIN countries AS T2 ON T1.Country = T2.CountryId  JOIN continents AS T3 ON T2.Continent = T3.ContId  WHERE T3.Continent = 'Europe'  GROUP BY T2.CountryName  HAVING COUNT(T1.Id) >= 3	car_1
SELECT T1.CountryName  FROM countries AS T1  JOIN car_makers AS T2 ON T1.CountryId = T2.Country  JOIN continents AS T3 ON T1.Continent = T3.ContId  WHERE T3.Continent = 'Europe'  GROUP BY T1.CountryName  HAVING COUNT(DISTINCT T2.Maker) >= 3	car_1
SELECT T1.Model, T2.Make, T3.Horsepower  FROM model_list AS T1  JOIN car_names AS T2 ON T1.ModelId = T2.MakeId  JOIN cars_data AS T3 ON T2.MakeId = T3.Id  WHERE T3.Cylinders = 3  ORDER BY T3.Horsepower DESC  LIMIT 1	car_1
SELECT T2.Model, T2.Make, T1.Horsepower  FROM cars_data T1  JOIN car_names T2 ON T1.Id = T2.MakeId  JOIN model_list T3 ON T2.Model = T3.Model  WHERE T1.Cylinders = 3  ORDER BY T1.Horsepower DESC  LIMIT 1	car_1
SELECT T1.Model FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.ModelId = T2.Id ORDER BY T2.MPG DESC LIMIT 1	car_1
SELECT T1.Model FROM model_list AS T1 INNER JOIN car_names AS T2 ON T1.ModelId = T2.MakeId INNER JOIN cars_data AS T3 ON T2.MakeId = T3.Id ORDER BY T3.MPG DESC LIMIT 1	car_1
SELECT avg(Horsepower) FROM cars_data WHERE Year < 1980	car_1
SELECT avg(Horsepower) FROM cars_data WHERE Year < 1980	car_1
SELECT avg(T1.Edispl) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.ModelId INNER JOIN car_makers AS T4 ON T3.Maker = T4.Id WHERE T4.Maker = 'volvo'	car_1
SELECT avg(T1.Edispl) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.ModelId INNER JOIN car_makers AS T4 ON T3.Maker = T4.Id WHERE T4.Maker = 'Volvo'	car_1
SELECT Cylinders, max(Accelerate) FROM cars_data GROUP BY Cylinders	car_1
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders	car_1
SELECT Model, count(Make) FROM car_names GROUP BY Model ORDER BY count(Make) DESC LIMIT 1	car_1
SELECT Model, COUNT(DISTINCT Make) FROM car_names GROUP BY Model ORDER BY COUNT(DISTINCT Make) DESC LIMIT 1	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4	car_1
SELECT COUNT(*) FROM cars_data WHERE Year = 1980	car_1
SELECT COUNT(*) FROM cars_data WHERE Year = 1980	car_1
SELECT COUNT(ModelId) FROM model_list WHERE Maker = (SELECT Id FROM car_makers WHERE FullName = 'American Motor Company')	car_1
SELECT COUNT(ModelId) FROM model_list WHERE Maker = (SELECT Id FROM car_makers WHERE FullName = 'American Motor Company')	car_1
SELECT FullName, Id FROM car_makers WHERE Id IN (SELECT Maker FROM model_list GROUP BY Maker HAVING count(ModelId) > 3)	car_1
SELECT T1.Maker, T1.Id FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id, T1.Maker HAVING count(T2.ModelId) > 3	car_1
SELECT DISTINCT T1.Model  FROM model_list AS T1  INNER JOIN car_makers AS T2  ON T1.Maker = T2.Id  WHERE T2.FullName = 'General Motors'  UNION  SELECT DISTINCT T4.Model  FROM model_list AS T4  INNER JOIN car_names AS T5  ON T4.ModelId = T5.MakeId  INNER JOIN cars_data AS T6  ON T5.MakeId = T6.Id  WHERE T6.Weight > 3500	car_1
SELECT DISTINCT T1.Model FROM model_list AS T1  INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id  INNER JOIN car_names AS T3 ON T1.ModelId = T3.MakeId  INNER JOIN cars_data AS T4 ON T3.MakeId = T4.Id  WHERE T2.FullName = 'General Motors' OR T4.Weight > 3500	car_1
SELECT Year FROM cars_data WHERE Weight >= 3000 AND Weight <= 4000	car_1
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 AND Year IN (SELECT Year FROM cars_data WHERE Weight > 3000)	car_1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1	car_1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1	car_1
SELECT T1.Cylinders FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.ModelId INNER JOIN car_makers AS T4 ON T3.Maker = T4.Id WHERE T4.Maker = 'volvo' ORDER BY T1.Accelerate LIMIT 1	car_1
SELECT T1.Cylinders FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId INNER JOIN model_list AS T3 ON T2.Model = T3.ModelId INNER JOIN car_makers AS T4 ON T3.Maker = T4.Id WHERE T4.Maker = 'volvo' ORDER BY T1.Accelerate LIMIT 1	car_1
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Horsepower) FROM cars_data)	car_1
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Horsepower) FROM cars_data)	car_1
SELECT COUNT(DISTINCT T1.CountryName)  FROM countries AS T1  JOIN car_makers AS T2  ON T1.CountryId = T2.Country  GROUP BY T1.CountryName  HAVING COUNT(T2.Id) > 2	car_1
SELECT COUNT(DISTINCT T1.Country) FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId WHERE T2.CountryName IN (SELECT T2.CountryName FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName HAVING COUNT(T1.Id) > 2)	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6	car_1
SELECT T1.Model FROM model_list AS T1 INNER JOIN car_names AS T2 ON T1.ModelId = T2.MakeId INNER JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Cylinders = 4 ORDER BY T3.Horsepower DESC LIMIT 1	car_1
SELECT T1.Model, T2.Horsepower FROM model_list AS T1 INNER JOIN cars_data AS T2 ON T1.ModelId = T2.Id WHERE T2.Cylinders = 4 ORDER BY T2.Horsepower DESC LIMIT 1	car_1
SELECT T1.MakeId, T1.Make  FROM car_names AS T1  INNER JOIN cars_data AS T2  ON T1.MakeId = T2.Id  WHERE T2.Horsepower > (SELECT MIN(Horsepower) FROM cars_data)  AND T2.Cylinders <= 3	car_1
SELECT T1.MakeId, T1.Make  FROM car_names AS T1  INNER JOIN cars_data AS T2  ON T1.MakeId = T2.Id  WHERE T2.Cylinders < 4  AND T2.Horsepower NOT IN (SELECT MIN(Horsepower) FROM cars_data)	car_1
SELECT MAX MPG FROM cars_data WHERE Cylinders = 8 OR Year < 1980	car_1
SELECT MAX MPG FROM cars_data WHERE Cylinders = 8 OR Year < 1980	car_1
SELECT T3.Model  FROM car_makers AS T1  JOIN model_list AS T2 ON T1.Id = T2.Maker  JOIN car_names AS T3 ON T2.ModelId = T3.MakeId  JOIN cars_data AS T4 ON T3.MakeId = T4.Id  WHERE T4.Weight < 3500 AND T1.FullName != 'Ford Motor Company'	car_1
SELECT T1.Model FROM model_list AS T1  INNER JOIN car_names AS T2 ON T1.ModelId = T2.MakeId  INNER JOIN cars_data AS T3 ON T2.MakeId = T3.Id  INNER JOIN car_makers AS T4 ON T1.Maker = T4.Id  WHERE T3.Weight < 3500 AND T4.FullName != 'Ford Motor Company'	car_1
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)	car_1
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)	car_1
SELECT T1.Id, T1.Maker FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id, T1.Maker HAVING COUNT(T2.ModelId) > 1 AND T1.Id IN (SELECT Maker FROM model_list GROUP BY Maker HAVING COUNT(ModelId) > 3)	car_1
SELECT T1.Id, T1.Maker FROM car_makers AS T1  JOIN model_list AS T2 ON T1.Id = T2.Maker  JOIN car_names AS T3 ON T2.ModelId = T3.MakeId  JOIN cars_data AS T4 ON T3.MakeId = T4.Id  GROUP BY T1.Id, T1.Maker  HAVING COUNT(T2.ModelId) >= 2 AND COUNT(T4.Id) > 3	car_1
SELECT T1.CountryId, T1.CountryName  FROM countries AS T1  WHERE T1.CountryId IN (   SELECT T2.Country    FROM car_makers AS T2    GROUP BY T2.Country    HAVING COUNT(T2.Id) > 3 ) OR T1.CountryId IN (   SELECT T4.Country    FROM car_makers AS T3    JOIN model_list AS T4 ON T3.Id = T4.Maker    WHERE T4.Model = 'fiat' )	car_1
SELECT T1.CountryId, T1.CountryName  FROM countries AS T1  WHERE T1.CountryId IN (   SELECT T2.Country    FROM car_makers AS T2    GROUP BY T2.Country    HAVING COUNT(T2.Id) > 3 ) OR T1.CountryId IN (   SELECT T3.Country    FROM car_makers AS T3    JOIN model_list AS T4 ON T3.Id = T4.Maker    WHERE T4.Model = 'Fiat' )	car_1
SELECT Country FROM airlines WHERE Airline = "JetBlue Airways"	flight_2
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways'	flight_2
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'	flight_2
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'	flight_2
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'	flight_2
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'	flight_2
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'	flight_2
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'	flight_2
SELECT count(*) FROM airlines	flight_2
SELECT count(*) FROM airlines	flight_2
SELECT count(*) FROM airports	flight_2
SELECT count(*) FROM airports	flight_2
SELECT count(*) FROM flights	flight_2
SELECT count(*) FROM flights	flight_2
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'	flight_2
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'	flight_2
SELECT COUNT(uid) FROM airlines WHERE Country = 'USA'	flight_2
SELECT COUNT(uid) FROM airlines WHERE Country = 'USA'	flight_2
SELECT City, Country FROM airports WHERE AirportName = 'Alton'	flight_2
SELECT City, Country FROM airports WHERE AirportName = 'Alton'	flight_2
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'	flight_2
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'	flight_2
SELECT AirportName FROM airports WHERE City = 'Aberdeen'	flight_2
SELECT AirportName FROM airports WHERE City = 'Aberdeen'	flight_2
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'	flight_2
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'	flight_2
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'	flight_2
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'	flight_2
SELECT COUNT(*) FROM flights AS f JOIN airports AS a ON f.SourceAirport = a.AirportCode WHERE a.City = 'Aberdeen'	flight_2
SELECT COUNT(*) FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')	flight_2
SELECT COUNT(*) FROM flights AS f JOIN airports AS a ON f.DestAirport = a.AirportCode WHERE a.City = 'Aberdeen'	flight_2
SELECT COUNT(*) FROM flights WHERE DestAirport = (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')	flight_2
SELECT COUNT(*)  FROM flights  JOIN airports AS src ON flights.SourceAirport = src.AirportCode  JOIN airports AS dest ON flights.DestAirport = dest.AirportCode  WHERE src.City = 'Aberdeen' AND dest.City = 'Ashley'	flight_2
SELECT COUNT(*) FROM flights AS f  JOIN airports AS src ON f.SourceAirport = src.AirportCode  JOIN airports AS dest ON f.DestAirport = dest.AirportCode  WHERE src.City = 'Aberdeen' AND dest.City = 'Ashley'	flight_2
SELECT COUNT(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid WHERE a.Airline = 'JetBlue Airways'	flight_2
SELECT COUNT(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid WHERE a.Airline = 'JetBlue Airways'	flight_2
SELECT COUNT(*) FROM flights AS f  JOIN airlines AS a ON f.Airline = a.uid  WHERE a.Airline = 'United Airlines' AND f.DestAirport = 'ASY'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.uid  WHERE airlines.Airline = 'United Airlines' AND flights.DestAirport = 'ASY'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.uid  WHERE airlines.Airline = 'United Airlines'  AND flights.SourceAirport = 'AHD'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.uid  WHERE airlines.Airline = 'United Airlines' AND flights.SourceAirport = 'AHD'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.uid  JOIN airports AS dest ON flights.DestAirport = dest.AirportCode  WHERE airlines.Airline = 'United Airlines' AND dest.City = 'Aberdeen'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.uid  JOIN airports AS dest ON flights.DestAirport = dest.AirportCode  WHERE airlines.Airline = 'United Airlines' AND dest.City = 'Aberdeen'	flight_2
SELECT T1.City FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport GROUP BY T1.City ORDER BY COUNT(T2.DestAirport) DESC LIMIT 1	flight_2
SELECT T1.City FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport GROUP BY T1.City ORDER BY COUNT(T2.DestAirport) DESC LIMIT 1	flight_2
SELECT T1.City FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.City ORDER BY COUNT(T2.SourceAirport) DESC LIMIT 1	flight_2
SELECT T1.City FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.City ORDER BY COUNT(T1.City) DESC LIMIT 1	flight_2
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY count(*) DESC LIMIT 1	flight_2
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY count(*) DESC LIMIT 1	flight_2
SELECT AirportCode FROM airports  WHERE AirportCode NOT IN (SELECT DestAirport FROM flights)  OR AirportCode NOT IN (SELECT SourceAirport FROM flights)  OR AirportCode IN (   SELECT AirportCode    FROM (     SELECT SourceAirport AS AirportCode, COUNT(*) as num      FROM flights      GROUP BY SourceAirport      UNION ALL      SELECT DestAirport AS AirportCode, COUNT(*) as num      FROM flights      GROUP BY DestAirport   )    GROUP BY AirportCode    ORDER BY SUM(num)    LIMIT 1 )	flight_2
SELECT AirportCode FROM airports  WHERE AirportCode NOT IN (SELECT DestAirport FROM flights)  OR AirportCode NOT IN (SELECT SourceAirport FROM flights)   UNION   SELECT AirportCode FROM  (    SELECT SourceAirport, COUNT(*) as num    FROM flights    GROUP BY SourceAirport    UNION    SELECT DestAirport, COUNT(*) as num    FROM flights    GROUP BY DestAirport  )  WHERE num = (    SELECT MIN(num)    FROM (      SELECT SourceAirport, COUNT(*) as num      FROM flights      GROUP BY SourceAirport      UNION      SELECT DestAirport, COUNT(*) as num      FROM flights      GROUP BY DestAirport    )  )	flight_2
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY count(T2.FlightNo) DESC LIMIT 1	flight_2
SELECT T1.Airline, COUNT(*) FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(*) DESC LIMIT 1	flight_2
SELECT T1.Abbreviation, T1.Country  FROM airlines AS T1  JOIN flights AS T2  ON T1.uid = T2.Airline  GROUP BY T1.uid  ORDER BY count(T2.Airline)  LIMIT 1	flight_2
SELECT T1.Abbreviation, T1.Country  FROM airlines AS T1  JOIN flights AS T2 ON T1.uid = T2.Airline  GROUP BY T1.Abbreviation, T1.Country  ORDER BY COUNT(T2.Airline)  LIMIT 1	flight_2
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'	flight_2
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'	flight_2
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'	flight_2
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'	flight_2
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'APG' INTERSECT SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO'	flight_2
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'APG' INTERSECT SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO'	flight_2
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' AND T2.Airline NOT IN (SELECT Airline FROM flights WHERE SourceAirport = 'APG')	flight_2
SELECT T1.Airline FROM airlines AS T1  JOIN flights AS T2 ON T1.uid = T2.Airline  WHERE T2.SourceAirport = 'CVO'  AND T1.uid NOT IN (SELECT T3.Airline FROM flights AS T3 WHERE T3.SourceAirport = 'APG')	flight_2
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING count(T2.FlightNo) >= 10	flight_2
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING count(T2.FlightNo) >= 10	flight_2
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING count(T2.FlightNo) < 200	flight_2
SELECT T1.Airline FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING count(T2.FlightNo) < 200	flight_2
SELECT T2.FlightNo FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'United Airlines'	flight_2
SELECT T2.FlightNo FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'United Airlines'	flight_2
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'	flight_2
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'	flight_2
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'	flight_2
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'	flight_2
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen'	flight_2
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen'	flight_2
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen'	flight_2
SELECT T2.FlightNo FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen'	flight_2
SELECT COUNT(*) FROM flights  JOIN airports AS dest ON flights.DestAirport = dest.AirportCode  WHERE dest.City = 'Aberdeen' OR dest.City = 'Abilene'	flight_2
SELECT COUNT(*) FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen' OR City = 'Abilene')	flight_2
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)	flight_2
SELECT AirportCode FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights)	flight_2
SELECT count(*) FROM employee	employee_hire_evaluation
SELECT count(*) FROM employee	employee_hire_evaluation
SELECT Name FROM employee ORDER BY Age ASC	employee_hire_evaluation
SELECT Name FROM employee ORDER BY Age ASC	employee_hire_evaluation
SELECT City, count(Employee_ID) FROM employee GROUP BY City	employee_hire_evaluation
SELECT City, count(Employee_ID) FROM employee GROUP BY City	employee_hire_evaluation
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING count(Employee_ID) > 1	employee_hire_evaluation
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING count(*) > 1	employee_hire_evaluation
SELECT Location, count(Shop_ID) FROM shop GROUP BY Location	employee_hire_evaluation
SELECT Location, count(Shop_ID) FROM shop GROUP BY Location	employee_hire_evaluation
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1	employee_hire_evaluation
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1	employee_hire_evaluation
SELECT min(Number_products), max(Number_products) FROM shop	employee_hire_evaluation
SELECT min(Number_products), max(Number_products) FROM shop	employee_hire_evaluation
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC	employee_hire_evaluation
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC	employee_hire_evaluation
SELECT Name FROM shop WHERE Number_products > (SELECT avg(Number_products) FROM shop)	employee_hire_evaluation
SELECT Name FROM shop WHERE Number_products > (SELECT avg(Number_products) FROM shop)	employee_hire_evaluation
SELECT T1.Name FROM employee AS T1 INNER JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Name ORDER BY COUNT(T2.Year_awarded) DESC LIMIT 1	employee_hire_evaluation
SELECT T1.Name FROM employee AS T1 INNER JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Name ORDER BY count(T2.Year_awarded) DESC LIMIT 1	employee_hire_evaluation
SELECT T1.Name FROM employee AS T1 INNER JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T2.Bonus DESC LIMIT 1	employee_hire_evaluation
SELECT T1.Name FROM employee AS T1 INNER JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T2.Bonus DESC LIMIT 1	employee_hire_evaluation
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)	employee_hire_evaluation
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)	employee_hire_evaluation
SELECT T1.Name FROM shop AS T1 INNER JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Name ORDER BY COUNT(T2.Employee_ID) DESC LIMIT 1	employee_hire_evaluation
SELECT T2.Name FROM hiring AS T1 INNER JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T2.Name ORDER BY count(T1.Employee_ID) DESC LIMIT 1	employee_hire_evaluation
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)	employee_hire_evaluation
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)	employee_hire_evaluation
SELECT T1.Name, count(T2.Employee_ID) FROM shop AS T1 INNER JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Name	employee_hire_evaluation
SELECT T1.Name, count(T2.Employee_ID) FROM shop AS T1 INNER JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Name	employee_hire_evaluation
SELECT sum(Bonus) FROM evaluation	employee_hire_evaluation
SELECT sum(Bonus) FROM evaluation	employee_hire_evaluation
SELECT * FROM hiring	employee_hire_evaluation
SELECT * FROM hiring	employee_hire_evaluation
SELECT District FROM shop WHERE Number_products < 3000  INTERSECT  SELECT District FROM shop WHERE Number_products > 10000	employee_hire_evaluation
SELECT District FROM shop WHERE Number_products < 3000 AND District IN (SELECT District FROM shop WHERE Number_products > 10000)	employee_hire_evaluation
SELECT count(DISTINCT Location) FROM shop	employee_hire_evaluation
SELECT count(DISTINCT Location) FROM shop	employee_hire_evaluation
SELECT count(*) FROM Documents	cre_Doc_Template_Mgt
SELECT count(*) FROM Documents	cre_Doc_Template_Mgt
SELECT Document_ID, Document_Name, Document_Description FROM Documents	cre_Doc_Template_Mgt
SELECT Document_ID, Document_Name, Document_Description FROM Documents	cre_Doc_Template_Mgt
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'	cre_Doc_Template_Mgt
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'	cre_Doc_Template_Mgt
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'	cre_Doc_Template_Mgt
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'	cre_Doc_Template_Mgt
SELECT count(DISTINCT Template_ID) FROM Documents	cre_Doc_Template_Mgt
SELECT count(DISTINCT Template_ID) FROM Documents	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID WHERE T.Template_Type_Code = 'PPT'	cre_Doc_Template_Mgt
SELECT COUNT(DISTINCT T1.Document_ID)  FROM Documents AS T1  INNER JOIN Templates AS T2  ON T1.Template_ID = T2.Template_ID  INNER JOIN Ref_Template_Types AS T3  ON T2.Template_Type_Code = T3.Template_Type_Code  WHERE T3.Template_Type_Code = 'PPT'	cre_Doc_Template_Mgt
SELECT Template_ID, count(*) FROM Documents GROUP BY Template_ID	cre_Doc_Template_Mgt
SELECT Template_ID, count(*) FROM Documents GROUP BY Template_ID	cre_Doc_Template_Mgt
SELECT Template_ID, Template_Type_Code FROM Templates WHERE Template_ID = (SELECT Template_ID FROM Documents GROUP BY Template_ID ORDER BY COUNT(*) DESC LIMIT 1)	cre_Doc_Template_Mgt
SELECT Template_ID, Template_Type_Code FROM Templates WHERE Template_ID = (SELECT Template_ID FROM Documents GROUP BY Template_ID ORDER BY count(*) DESC LIMIT 1)	cre_Doc_Template_Mgt
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING count(Document_ID) > 1	cre_Doc_Template_Mgt
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING count(Document_ID) > 1	cre_Doc_Template_Mgt
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)	cre_Doc_Template_Mgt
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)	cre_Doc_Template_Mgt
SELECT count(Template_ID) FROM Templates	cre_Doc_Template_Mgt
SELECT count(*) FROM Templates	cre_Doc_Template_Mgt
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates	cre_Doc_Template_Mgt
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates	cre_Doc_Template_Mgt
SELECT DISTINCT Template_Type_Code FROM Templates	cre_Doc_Template_Mgt
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')	cre_Doc_Template_Mgt
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')	cre_Doc_Template_Mgt
SELECT COUNT(Template_ID) FROM Templates WHERE Template_Type_Code = 'CV'	cre_Doc_Template_Mgt
SELECT COUNT(Template_ID) FROM Templates WHERE Template_Type_Code = 'CV'	cre_Doc_Template_Mgt
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5	cre_Doc_Template_Mgt
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5	cre_Doc_Template_Mgt
SELECT Template_Type_Code, count(Template_ID) FROM Templates GROUP BY Template_Type_Code	cre_Doc_Template_Mgt
SELECT Template_Type_Code, count(*) FROM Templates GROUP BY Template_Type_Code	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY count(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY count(Template_ID) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING count(Template_ID) < 3	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING count(Template_ID) < 3	cre_Doc_Template_Mgt
SELECT Template_Type_Code, MIN(Version_Number) FROM Templates GROUP BY Template_Type_Code ORDER BY MIN(Version_Number) LIMIT 1	cre_Doc_Template_Mgt
SELECT Template_Type_Code, MIN(Version_Number) FROM Templates GROUP BY Template_Type_Code	cre_Doc_Template_Mgt
SELECT T.Template_Type_Code FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID WHERE D.Document_Name = 'Data base'	cre_Doc_Template_Mgt
SELECT T.Template_Type_Code FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID WHERE D.Document_Name = 'Data base'	cre_Doc_Template_Mgt
SELECT T2.Document_Name FROM Templates AS T1 INNER JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Template_Type_Code = 'BK'	cre_Doc_Template_Mgt
SELECT T2.Document_Name FROM Templates AS T1 INNER JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Template_Type_Code = 'BK'	cre_Doc_Template_Mgt
SELECT T.Template_Type_Code, count(D.Document_ID)  FROM Ref_Template_Types T  LEFT JOIN Templates Te ON T.Template_Type_Code = Te.Template_Type_Code  LEFT JOIN Documents D ON Te.Template_ID = D.Template_ID  GROUP BY T.Template_Type_Code	cre_Doc_Template_Mgt
SELECT T.Template_Type_Code, count(D.Document_ID)  FROM Templates T  JOIN Documents D ON T.Template_ID = D.Template_ID  GROUP BY T.Template_Type_Code	cre_Doc_Template_Mgt
SELECT T.Template_Type_Code FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_Type_Code ORDER BY COUNT(D.Document_ID) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY count(Template_ID) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Ref_Template_Types  WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates                                   WHERE Template_ID IN (SELECT Template_ID FROM Documents))	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Ref_Template_Types  WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates)	cre_Doc_Template_Mgt
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'	cre_Doc_Template_Mgt
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'	cre_Doc_Template_Mgt
SELECT DISTINCT T2.Template_Type_Description  FROM Templates AS T1  INNER JOIN Ref_Template_Types AS T2  ON T1.Template_Type_Code = T2.Template_Type_Code  WHERE T1.Template_ID IN (SELECT Template_ID FROM Documents)	cre_Doc_Template_Mgt
SELECT DISTINCT T.Template_Details  FROM Templates T  JOIN Documents D ON T.Template_ID = D.Template_ID	cre_Doc_Template_Mgt
SELECT T.Template_ID  FROM Templates T  JOIN Ref_Template_Types R  ON T.Template_Type_Code = R.Template_Type_Code  WHERE R.Template_Type_Description = 'Presentation'	cre_Doc_Template_Mgt
SELECT T.Template_ID FROM Templates T JOIN Ref_Template_Types R ON T.Template_Type_Code = R.Template_Type_Code WHERE R.Template_Type_Description = 'Presentation'	cre_Doc_Template_Mgt
SELECT count(*) FROM Paragraphs	cre_Doc_Template_Mgt
SELECT count(*) FROM Paragraphs	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name = 'Summer Show')	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name = 'Summer Show')	cre_Doc_Template_Mgt
SELECT * FROM Paragraphs WHERE Paragraph_Text = 'Korea '	cre_Doc_Template_Mgt
SELECT Other_Details FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea %'	cre_Doc_Template_Mgt
SELECT P.Paragraph_ID, P.Paragraph_Text  FROM Paragraphs P  JOIN Documents D ON P.Document_ID = D.Document_ID  WHERE D.Document_Name = 'Welcome to NY'	cre_Doc_Template_Mgt
SELECT p.Paragraph_ID, p.Paragraph_Text  FROM Paragraphs p  JOIN Documents d ON p.Document_ID = d.Document_ID  WHERE d.Document_Name = 'Welcome to NY'	cre_Doc_Template_Mgt
SELECT T3.Paragraph_Text FROM Documents AS T1 INNER JOIN Paragraphs AS T3 ON T1.Document_ID = T3.Document_ID WHERE T1.Document_Name = 'Customer reviews'	cre_Doc_Template_Mgt
SELECT T3.Paragraph_Text FROM Documents AS T1 INNER JOIN Paragraphs AS T3 ON T1.Document_ID = T3.Document_ID WHERE T1.Document_Name = 'Customer reviews'	cre_Doc_Template_Mgt
SELECT Document_ID, count(Paragraph_ID) FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID	cre_Doc_Template_Mgt
SELECT Document_ID, count(Paragraph_ID) FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID	cre_Doc_Template_Mgt
SELECT d.Document_ID, d.Document_Name, count(p.Paragraph_ID)  FROM Documents d  LEFT JOIN Paragraphs p ON d.Document_ID = p.Document_ID  GROUP BY d.Document_ID, d.Document_Name	cre_Doc_Template_Mgt
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID)  FROM Documents D  LEFT JOIN Paragraphs P ON D.Document_ID = P.Document_ID  GROUP BY D.Document_ID, D.Document_Name	cre_Doc_Template_Mgt
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING count(Paragraph_ID) >= 2	cre_Doc_Template_Mgt
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING count(Paragraph_ID) >= 2	cre_Doc_Template_Mgt
SELECT Document_ID, Document_Name FROM Documents WHERE Document_ID = (SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) DESC LIMIT 1)	cre_Doc_Template_Mgt
SELECT Document_ID, Document_Name FROM Documents WHERE Document_ID = (SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY count(*) DESC LIMIT 1)	cre_Doc_Template_Mgt
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY count(Paragraph_ID) ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY count(Paragraph_ID) ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING count(Paragraph_ID) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING count(Paragraph_ID) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Brazil'  UNION  SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Ireland'	cre_Doc_Template_Mgt
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%Brazil%' AND Document_ID IN (SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%Ireland%')	cre_Doc_Template_Mgt
SELECT count(*) FROM teacher	course_teach
SELECT count(*) FROM teacher	course_teach
SELECT Name FROM teacher ORDER BY Age ASC	course_teach
SELECT Name FROM teacher ORDER BY Age ASC	course_teach
SELECT Age, Hometown FROM teacher	course_teach
SELECT Age, Hometown FROM teacher	course_teach
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'	course_teach
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'	course_teach
SELECT Name FROM teacher WHERE Age = '32' OR Age = '33'	course_teach
SELECT Name FROM teacher WHERE Age = '32' OR Age = '33'	course_teach
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1	course_teach
SELECT Hometown FROM teacher ORDER BY Age LIMIT 1	course_teach
SELECT Hometown, count(*) FROM teacher GROUP BY Hometown	course_teach
SELECT Hometown, count(Teacher_ID) FROM teacher GROUP BY Hometown	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(Hometown) DESC LIMIT 1	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(Hometown) DESC LIMIT 1	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown HAVING count(Teacher_ID) > 1	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown HAVING count(Teacher_ID) >= 2	course_teach
SELECT t.Name, c.Course  FROM teacher t  JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID  JOIN course c ON ca.Course_ID = c.Course_ID	course_teach
SELECT T.Name, C.Course  FROM teacher T  JOIN course_arrange CA ON T.Teacher_ID = CA.Teacher_ID  JOIN course C ON CA.Course_ID = C.Course_ID	course_teach
SELECT t.Name, c.Course  FROM teacher t  JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID  JOIN course c ON ca.Course_ID = c.Course_ID  ORDER BY t.Name ASC	course_teach
SELECT t.Name, c.Course  FROM teacher t  JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID  JOIN course c ON ca.Course_ID = c.Course_ID  ORDER BY t.Name ASC	course_teach
SELECT T.Name FROM teacher T JOIN course_arrange CA ON T.Teacher_ID = CA.Teacher_ID JOIN course C ON CA.Course_ID = C.Course_ID WHERE C.Course = 'math'	course_teach
SELECT T2.Name FROM course AS T1 INNER JOIN course_arrange AS T3 ON T1.Course_ID = T3.Course_ID INNER JOIN teacher AS T2 ON T3.Teacher_ID = T2.Teacher_ID WHERE T1.Course = 'Math'	course_teach
SELECT T.Name, count(CA.Course_ID) FROM teacher T JOIN course_arrange CA ON T.Teacher_ID = CA.Teacher_ID GROUP BY T.Name	course_teach
SELECT T.Name, count(CA.Course_ID) FROM teacher T JOIN course_arrange CA ON T.Teacher_ID = CA.Teacher_ID GROUP BY T.Name	course_teach
SELECT T2.Name FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name HAVING count(T1.Course_ID) >= 2	course_teach
SELECT T2.Name FROM course_arrange AS T1 INNER JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name HAVING count(T1.Course_ID) >= 2	course_teach
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)	course_teach
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)	course_teach
SELECT COUNT(*) FROM visitor WHERE Age < 30	museum_visit
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC	museum_visit
SELECT avg(Age) FROM visitor WHERE Level_of_membership <= 4	museum_visit
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC	museum_visit
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1	museum_visit
SELECT avg(Num_of_Staff) FROM museum WHERE Open_Year < '2009'	museum_visit
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'	museum_visit
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > '2010')	museum_visit
SELECT DISTINCT v.ID, v.Name, v.Age  FROM visitor v  JOIN visit t ON v.ID = t.visitor_ID  GROUP BY v.ID, v.Name, v.Age  HAVING count(t.Museum_ID) > 1	museum_visit
SELECT v.ID, v.Name, v.Level_of_membership  FROM visitor v  JOIN visit t ON v.ID = t.visitor_ID  ORDER BY t.Total_spent DESC  LIMIT 1	museum_visit
SELECT T1.Museum_ID, T1.Name FROM museum T1 INNER JOIN visit T2 ON T1.Museum_ID = T2.Museum_ID GROUP BY T1.Museum_ID ORDER BY count(T2.Museum_ID) DESC LIMIT 1	museum_visit
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)	museum_visit
SELECT v.Name, v.Age FROM visitor v JOIN visit vi ON v.ID = vi.visitor_ID ORDER BY vi.Num_of_Ticket DESC LIMIT 1	museum_visit
SELECT avg(Num_of_Ticket), max(Num_of_Ticket) FROM visit	museum_visit
SELECT SUM(T2.Num_of_Ticket) FROM visitor AS T1 INNER JOIN visit AS T2 ON T1.ID = T2.visitor_ID WHERE T1.Level_of_membership = 1	museum_visit
SELECT v.Name  FROM visitor v  JOIN visit vi ON v.ID = vi.visitor_ID  JOIN museum m ON vi.Museum_ID = m.Museum_ID  WHERE m.Open_Year < '2009'  INTERSECT  SELECT v.Name  FROM visitor v  JOIN visit vi ON v.ID = vi.visitor_ID  JOIN museum m ON vi.Museum_ID = m.Museum_ID  WHERE m.Open_Year > '2011'	museum_visit
SELECT COUNT(DISTINCT v.ID)  FROM visitor v  WHERE v.ID NOT IN (   SELECT vi.visitor_ID    FROM visit vi    JOIN museum m ON vi.Museum_ID = m.Museum_ID    WHERE m.Open_Year > '2010' )	museum_visit
SELECT COUNT(Museum_ID) FROM museum WHERE Open_Year > '2013' OR Open_Year < '2008'	museum_visit
SELECT count(player_id) FROM players	wta_1
SELECT count(*) FROM players	wta_1
SELECT count(*) FROM matches	wta_1
SELECT count(*) FROM matches	wta_1
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'	wta_1
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'	wta_1
SELECT avg(loser_age) AS avg_loser_age, avg(winner_age) AS avg_winner_age FROM matches	wta_1
SELECT avg(loser_age) AS average_loser_age, avg(winner_age) AS average_winner_age FROM matches	wta_1
SELECT avg(winner_rank) FROM matches	wta_1
SELECT avg(winner_rank) FROM matches	wta_1
SELECT min(loser_rank) FROM matches	wta_1
SELECT min(loser_rank) FROM matches	wta_1
SELECT count(DISTINCT country_code) FROM players	wta_1
SELECT count(DISTINCT country_code) FROM players	wta_1
SELECT count(DISTINCT loser_name) FROM matches	wta_1
SELECT count(DISTINCT loser_name) FROM matches	wta_1
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(tourney_name) > 10	wta_1
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(match_num) > 10	wta_1
SELECT DISTINCT T1.first_name, T1.last_name  FROM players AS T1  JOIN matches AS T2  ON T1.player_id = T2.winner_id  WHERE T2.year = 2013  INTERSECT  SELECT DISTINCT T1.first_name, T1.last_name  FROM players AS T1  JOIN matches AS T2  ON T1.player_id = T2.winner_id  WHERE T2.year = 2016	wta_1
SELECT DISTINCT T1.first_name, T1.last_name  FROM players AS T1  JOIN matches AS T2  ON T1.player_id = T2.winner_id  WHERE T2.year = 2013  INTERSECT  SELECT DISTINCT T1.first_name, T1.last_name  FROM players AS T1  JOIN matches AS T2  ON T1.player_id = T2.winner_id  WHERE T2.year = 2016	wta_1
SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016	wta_1
SELECT count(*) FROM matches WHERE year = 2013 OR year = 2016	wta_1
SELECT T1.country_code, T1.first_name  FROM players AS T1  JOIN matches AS T2  ON T1.player_id = T2.winner_id  WHERE T2.tourney_name = 'WTA Championships'  INTERSECT  SELECT T1.country_code, T1.first_name  FROM players AS T1  JOIN matches AS T2  ON T1.player_id = T2.winner_id  WHERE T2.tourney_name = 'Australian Open'	wta_1
SELECT T1.first_name, T1.country_code FROM players AS T1  JOIN matches AS T2 ON T1.player_id = T2.winner_id  WHERE T2.tourney_name = 'Australian Open'  AND T1.player_id IN (SELECT winner_id FROM matches WHERE tourney_name = 'WTA Championships')	wta_1
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1	wta_1
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1	wta_1
SELECT first_name, last_name FROM players ORDER BY birth_date	wta_1
SELECT first_name, last_name FROM players ORDER BY birth_date	wta_1
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date	wta_1
SELECT first_name, last_name FROM players WHERE hand = 'left' ORDER BY birth_date	wta_1
SELECT T1.first_name, T1.country_code FROM players AS T1 INNER JOIN rankings AS T2 ON T1.player_id = T2.player_id ORDER BY T2.tours DESC LIMIT 1	wta_1
SELECT T1.first_name, T1.country_code FROM players AS T1 INNER JOIN rankings AS T2 ON T1.player_id = T2.player_id ORDER BY T2.tours DESC LIMIT 1	wta_1
SELECT year FROM matches GROUP BY year ORDER BY count(*) DESC LIMIT 1	wta_1
SELECT year FROM matches GROUP BY year ORDER BY count(*) DESC LIMIT 1	wta_1
SELECT T1.first_name, T1.last_name, T2.winner_rank_points  FROM players AS T1  INNER JOIN matches AS T2  ON T1.player_id = T2.winner_id  GROUP BY T1.first_name, T1.last_name, T2.winner_rank_points  ORDER BY COUNT(T2.winner_id) DESC  LIMIT 1	wta_1
SELECT T1.first_name, T1.last_name, T3.ranking_points  FROM players AS T1  INNER JOIN matches AS T2 ON T1.player_id = T2.winner_id  INNER JOIN rankings AS T3 ON T1.player_id = T3.player_id  GROUP BY T1.first_name, T1.last_name, T3.ranking_points  ORDER BY COUNT(T2.winner_id) DESC  LIMIT 1	wta_1
SELECT T1.first_name, T1.last_name  FROM players AS T1  INNER JOIN matches AS T2  ON T1.player_id = T2.winner_id  WHERE T2.tourney_name = 'Australian Open'  AND T2.winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches WHERE tourney_name = 'Australian Open')	wta_1
SELECT T1.first_name, T1.last_name  FROM players AS T1  INNER JOIN matches AS T2  ON T1.player_id = T2.winner_id  WHERE T2.tourney_name = 'Australian Open'  ORDER BY T2.winner_rank_points DESC  LIMIT 1	wta_1
SELECT T1.loser_name, T1.winner_name FROM matches T1 INNER JOIN (SELECT loser_name, winner_name, minutes, rowid FROM matches ORDER BY minutes DESC LIMIT 1) T2 ON T1.loser_name = T2.loser_name AND T1.winner_name = T2.winner_name AND T1.minutes = T2.minutes	wta_1
SELECT T1.winner_name, T1.loser_name FROM matches T1 INNER JOIN (SELECT winner_id, loser_id, MAX(minutes) as max_minutes FROM matches GROUP BY winner_id, loser_id) T2 ON T1.winner_id = T2.winner_id AND T1.loser_id = T2.loser_id ORDER BY T1.minutes DESC LIMIT 1	wta_1
SELECT T1.first_name, avg(T2.ranking) FROM players AS T1 INNER JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.first_name	wta_1
SELECT T1.first_name, avg(T2.ranking) FROM players AS T1 INNER JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.first_name	wta_1
SELECT T1.first_name, sum(T2.ranking_points) FROM players AS T1 INNER JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.first_name	wta_1
SELECT T1.first_name, sum(T2.ranking_points) FROM players AS T1 INNER JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.first_name	wta_1
SELECT country_code, count(player_id) FROM players GROUP BY country_code	wta_1
SELECT country_code, count(player_id) FROM players GROUP BY country_code	wta_1
SELECT country_code FROM players GROUP BY country_code ORDER BY count(player_id) DESC LIMIT 1	wta_1
SELECT country_code FROM players GROUP BY country_code ORDER BY count(player_id) DESC LIMIT 1	wta_1
SELECT country_code FROM players GROUP BY country_code HAVING count(player_id) > 50	wta_1
SELECT country_code FROM players GROUP BY country_code HAVING count(player_id) > 50	wta_1
SELECT ranking_date, sum(tours) FROM rankings GROUP BY ranking_date	wta_1
SELECT ranking_date, SUM(tours) FROM rankings GROUP BY ranking_date	wta_1
SELECT year, count(*) FROM matches GROUP BY year	wta_1
SELECT year, count(*) FROM matches GROUP BY year	wta_1
SELECT T1.first_name, T1.last_name, T2.winner_rank  FROM players AS T1  JOIN matches AS T2  ON T1.player_id = T2.winner_id  ORDER BY T2.winner_age  LIMIT 3	wta_1
SELECT T1.first_name, T1.last_name, T2.winner_rank  FROM players AS T1  JOIN matches AS T2  ON T1.player_id = T2.winner_id  ORDER BY T2.winner_age  LIMIT 3	wta_1
SELECT COUNT(DISTINCT T1.winner_id) FROM matches AS T1 INNER JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T2.hand = 'left' AND T1.tourney_name = 'WTA Championships'	wta_1
SELECT count(DISTINCT T1.player_id)  FROM players AS T1  INNER JOIN matches AS T2  ON T1.player_id = T2.winner_id  WHERE T1.hand = 'left' AND T2.tourney_name = 'WTA Championships'	wta_1
SELECT T1.first_name, T1.country_code, T1.birth_date  FROM players AS T1  INNER JOIN matches AS T2  ON T1.player_id = T2.winner_id  ORDER BY T2.winner_rank_points DESC  LIMIT 1	wta_1
SELECT T1.first_name, T1.country_code, T1.birth_date  FROM players AS T1  JOIN matches AS T2  ON T1.player_id = T2.winner_id  ORDER BY T2.winner_rank_points DESC  LIMIT 1	wta_1
SELECT hand, count(*) FROM players GROUP BY hand	wta_1
SELECT hand, count(*) FROM players GROUP BY hand	wta_1
SELECT count(*) FROM ship WHERE disposition_of_ship = 'Captured'	battle_death
SELECT name, tonnage FROM ship ORDER BY name DESC	battle_death
SELECT name, date, result FROM battle	battle_death
SELECT max(killed), min(killed) FROM death	battle_death
SELECT avg(injured) FROM death	battle_death
SELECT T2.killed, T2.injured FROM ship AS T1 INNER JOIN death AS T2 ON T1.id = T2.caused_by_ship_id WHERE T1.tonnage = 't'	battle_death
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril'	battle_death
SELECT DISTINCT T1.id, T1.name FROM battle AS T1 INNER JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.ship_type = 'Brig'	battle_death
SELECT T1.id, T1.name FROM battle AS T1 INNER JOIN ship AS T2 ON T1.id = T2.lost_in_battle INNER JOIN death AS T3 ON T2.id = T3.caused_by_ship_id GROUP BY T1.id, T1.name HAVING SUM(T3.killed) > 10	battle_death
SELECT T1.id, T1.name FROM ship AS T1 INNER JOIN death AS T2 ON T1.id = T2.caused_by_ship_id ORDER BY T2.injured DESC LIMIT 1	battle_death
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'	battle_death
SELECT count(DISTINCT result) FROM battle	battle_death
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = '225')	battle_death
SELECT T1.name, T1.date FROM battle AS T1 INNER JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.name IN ('Lettice', 'HMS Atalanta')	battle_death
SELECT T1.name, T1.result, T1.bulgarian_commander  FROM battle AS T1  JOIN ship AS T2  ON T1.id = T2.lost_in_battle  WHERE T2.location != 'English Channel'  OR T2.location IS NULL	battle_death
SELECT note FROM death WHERE note LIKE '%East%'	battle_death
SELECT line_1, line_2 FROM Addresses	student_transcripts_tracking
SELECT line_1, line_2 FROM Addresses	student_transcripts_tracking
SELECT count(*) FROM Courses	student_transcripts_tracking
SELECT count(*) FROM Courses	student_transcripts_tracking
SELECT course_description FROM Courses WHERE course_name = 'Math'	student_transcripts_tracking
SELECT course_description FROM Courses WHERE course_name LIKE '%Math%'	student_transcripts_tracking
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'	student_transcripts_tracking
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'	student_transcripts_tracking
SELECT T1.department_name, T1.department_id FROM Departments AS T1  JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id  GROUP BY T1.department_id, T1.department_name  ORDER BY COUNT(T2.degree_program_id) DESC  LIMIT 1	student_transcripts_tracking
SELECT T1.department_name, T1.department_id FROM Departments AS T1  JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id  GROUP BY T1.department_id  ORDER BY COUNT(T2.degree_program_id) DESC  LIMIT 1	student_transcripts_tracking
SELECT count(DISTINCT department_id) FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs	student_transcripts_tracking
SELECT count(DISTINCT degree_summary_name) FROM Degree_Programs	student_transcripts_tracking
SELECT count(DISTINCT degree_summary_name) FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'Engineering')	student_transcripts_tracking
SELECT COUNT(DISTINCT degree_program_id)  FROM Degree_Programs  WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'Engineering')	student_transcripts_tracking
SELECT section_name, section_description FROM Sections	student_transcripts_tracking
SELECT section_name, section_description FROM Sections	student_transcripts_tracking
SELECT T1.course_name, T1.course_id FROM Courses AS T1 WHERE T1.course_id IN (SELECT T2.course_id FROM Sections AS T2 GROUP BY T2.course_id HAVING COUNT(T2.section_id) <= 2)	student_transcripts_tracking
SELECT T1.course_id, T1.course_name  FROM Courses T1  WHERE T1.course_id IN (   SELECT T2.course_id    FROM Sections T2    GROUP BY T2.course_id    HAVING COUNT(T2.section_id) < 2 )	student_transcripts_tracking
SELECT section_name FROM Sections ORDER BY section_name DESC	student_transcripts_tracking
SELECT section_name FROM Sections ORDER BY section_name DESC	student_transcripts_tracking
SELECT semester_name, semester_id FROM Semesters WHERE semester_id = (SELECT semester_id FROM Student_Enrolment GROUP BY semester_id ORDER BY COUNT(student_id) DESC LIMIT 1)	student_transcripts_tracking
SELECT S.semester_name, S.semester_id  FROM Semesters S  JOIN Student_Enrolment SE ON S.semester_id = SE.semester_id  GROUP BY S.semester_name, S.semester_id  ORDER BY COUNT(SE.student_id) DESC  LIMIT 1	student_transcripts_tracking
SELECT department_description FROM Departments WHERE department_name LIKE '%the computer%'	student_transcripts_tracking
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'	student_transcripts_tracking
SELECT S.first_name, S.middle_name, S.last_name, S.student_id  FROM Students S  JOIN Student_Enrolment SE ON S.student_id = SE.student_id  WHERE SE.semester_id IN (   SELECT semester_id    FROM Student_Enrolment    GROUP BY semester_id, student_id    HAVING COUNT(degree_program_id) = 2 )	student_transcripts_tracking
SELECT T1.student_id, T1.first_name, T1.middle_name, T1.last_name  FROM Students AS T1  JOIN Student_Enrolment AS T2  ON T1.student_id = T2.student_id  WHERE T2.semester_id IN (   SELECT semester_id    FROM Student_Enrolment    GROUP BY semester_id, student_id    HAVING COUNT(degree_program_id) = 2 )	student_transcripts_tracking
SELECT T1.first_name, T1.middle_name, T1.last_name  FROM Students AS T1  INNER JOIN Student_Enrolment AS T2  ON T1.student_id = T2.student_id  INNER JOIN Degree_Programs AS T3  ON T2.degree_program_id = T3.degree_program_id  WHERE T3.degree_summary_name LIKE '%Bachelor%'	student_transcripts_tracking
SELECT T1.first_name, T1.middle_name, T1.last_name  FROM Students AS T1  JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id  JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id  WHERE T3.degree_summary_name LIKE '%Bachelors%'	student_transcripts_tracking
SELECT T1.degree_summary_name FROM Degree_Programs AS T1  JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id  GROUP BY T1.degree_summary_name  ORDER BY COUNT(T2.student_id) DESC  LIMIT 1	student_transcripts_tracking
SELECT T1.degree_summary_name  FROM Degree_Programs AS T1  JOIN Student_Enrolment AS T2  ON T1.degree_program_id = T2.degree_program_id  GROUP BY T1.degree_summary_name  ORDER BY COUNT(T2.student_id) DESC  LIMIT 1	student_transcripts_tracking
SELECT degree_program_id, degree_summary_name FROM Degree_Programs WHERE degree_program_id = (SELECT degree_program_id FROM Student_Enrolment GROUP BY degree_program_id ORDER BY COUNT(student_id) DESC LIMIT 1)	student_transcripts_tracking
SELECT T1.degree_program_id, T1.degree_summary_name  FROM Degree_Programs T1  JOIN Student_Enrolment T2 ON T1.degree_program_id = T2.degree_program_id  GROUP BY T1.degree_program_id, T1.degree_summary_name  ORDER BY COUNT(T2.student_id) DESC  LIMIT 1	student_transcripts_tracking
SELECT T1.student_id, T1.first_name, T1.middle_name, T1.last_name, COUNT(T2.student_enrolment_id) AS num_enrollments, T1.student_id  FROM Students T1  JOIN Student_Enrolment T2 ON T1.student_id = T2.student_id  GROUP BY T1.student_id, T1.first_name, T1.middle_name, T1.last_name  ORDER BY num_enrollments DESC  LIMIT 1	student_transcripts_tracking
SELECT S.first_name, S.middle_name, S.last_name, S.student_id, COUNT(SE.student_enrolment_id)  FROM Students S  JOIN Student_Enrolment SE ON S.student_id = SE.student_id  GROUP BY S.first_name, S.middle_name, S.last_name, S.student_id  ORDER BY COUNT(SE.student_enrolment_id) DESC  LIMIT 1	student_transcripts_tracking
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)	student_transcripts_tracking
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)	student_transcripts_tracking
SELECT DISTINCT T1.course_name FROM Courses AS T1 INNER JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id	student_transcripts_tracking
SELECT DISTINCT T1.course_name FROM Courses AS T1 INNER JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id	student_transcripts_tracking
SELECT T1.course_name FROM Courses AS T1 INNER JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_name ORDER BY COUNT(T2.student_course_id) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.course_name FROM Courses AS T1 INNER JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_name ORDER BY COUNT(T2.student_course_id) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.last_name FROM Students AS T1  JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id  WHERE T2.state_province_county = 'North Carolina'  AND T1.student_id NOT IN (SELECT student_id FROM Student_Enrolment)	student_transcripts_tracking
SELECT T1.last_name FROM Students AS T1  JOIN Addresses AS T2 ON T1.permanent_address_id = T2.address_id  WHERE T2.state_province_county = 'North Carolina'  AND T1.student_id NOT IN (SELECT student_id FROM Student_Enrolment)	student_transcripts_tracking
SELECT T.transcript_date, T.transcript_id FROM Transcripts T JOIN Transcript_Contents TC ON T.transcript_id = TC.transcript_id GROUP BY T.transcript_id, T.transcript_date HAVING count(TC.student_course_id) >= 2	student_transcripts_tracking
SELECT T.transcript_id, T.transcript_date  FROM Transcripts T  JOIN Transcript_Contents TC ON T.transcript_id = TC.transcript_id  GROUP BY T.transcript_id, T.transcript_date  HAVING COUNT(TC.student_course_id) >= 2	student_transcripts_tracking
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'	student_transcripts_tracking
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1	student_transcripts_tracking
SELECT T1.first_name, T1.middle_name, T1.last_name  FROM Students T1  WHERE T1.date_left IS NOT NULL  ORDER BY T1.date_left  LIMIT 1	student_transcripts_tracking
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC LIMIT 1	student_transcripts_tracking
SELECT first_name FROM Students WHERE permanent_address_id != current_address_id	student_transcripts_tracking
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id	student_transcripts_tracking
SELECT address_id, line_1, line_2, line_3 FROM Addresses WHERE address_id IN (SELECT current_address_id FROM Students) GROUP BY address_id, line_1, line_2, line_3 ORDER BY COUNT(*) DESC LIMIT 1	student_transcripts_tracking
SELECT address_id, line_1, line_2 FROM Addresses WHERE address_id = (SELECT current_address_id FROM Students GROUP BY current_address_id ORDER BY COUNT(*) DESC LIMIT 1)	student_transcripts_tracking
SELECT AVG(STRFTIME('%J', transcript_date)) FROM Transcripts	student_transcripts_tracking
SELECT AVG(strftime('%J', transcript_date)) FROM Transcripts	student_transcripts_tracking
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1	student_transcripts_tracking
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1	student_transcripts_tracking
SELECT count(*) FROM Transcripts	student_transcripts_tracking
SELECT count(*) FROM Transcripts	student_transcripts_tracking
SELECT MAX(transcript_date) FROM Transcripts	student_transcripts_tracking
SELECT MAX(transcript_date) FROM Transcripts	student_transcripts_tracking
SELECT student_course_id, count(transcript_id) as count FROM Transcript_Contents GROUP BY student_course_id ORDER BY count DESC LIMIT 1	student_transcripts_tracking
SELECT student_course_id, count(*) as count  FROM Transcript_Contents  GROUP BY student_course_id  ORDER BY count DESC  LIMIT 1	student_transcripts_tracking
SELECT transcript_id, transcript_date FROM Transcripts WHERE transcript_id IN (SELECT transcript_id FROM Transcript_Contents GROUP BY transcript_id ORDER BY COUNT(student_course_id) LIMIT 1)	student_transcripts_tracking
SELECT transcript_id, transcript_date FROM Transcripts WHERE transcript_id IN (SELECT transcript_id FROM Transcript_Contents GROUP BY transcript_id ORDER BY COUNT(student_course_id) ASC LIMIT 1)	student_transcripts_tracking
SELECT T1.semester_id FROM Student_Enrolment AS T1  INNER JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id  WHERE T2.degree_summary_name IN ('Master', 'Bachelor')  GROUP BY T1.semester_id  HAVING COUNT(DISTINCT T2.degree_summary_name) = 2	student_transcripts_tracking
SELECT semester_id FROM Student_Enrolment  WHERE degree_program_id IN (   SELECT degree_program_id FROM Degree_Programs    WHERE degree_summary_name LIKE '%Masters%'    INTERSECT    SELECT degree_program_id FROM Degree_Programs    WHERE degree_summary_name LIKE '%Bachelors%' )	student_transcripts_tracking
SELECT count(DISTINCT current_address_id) FROM Students	student_transcripts_tracking
SELECT DISTINCT T1.line_1, T1.line_2, T1.line_3, T1.city, T1.zip_postcode, T1.state_province_county, T1.country  FROM Addresses AS T1  WHERE T1.address_id IN (SELECT current_address_id FROM Students) OR T1.address_id IN (SELECT permanent_address_id FROM Students)	student_transcripts_tracking
SELECT * FROM Students ORDER BY last_name DESC	student_transcripts_tracking
SELECT other_student_details FROM Students ORDER BY last_name DESC	student_transcripts_tracking
SELECT section_name, section_description, other_details FROM Sections WHERE section_name = 'h'	student_transcripts_tracking
SELECT section_description FROM Sections WHERE section_name = 'h'	student_transcripts_tracking
SELECT T1.first_name  FROM Students AS T1  INNER JOIN Addresses AS T2  ON T1.permanent_address_id = T2.address_id  WHERE T2.country = 'Haiti'  UNION  SELECT first_name  FROM Students  WHERE cell_mobile_number = '09700166582'	student_transcripts_tracking
SELECT T1.first_name FROM Students AS T1  INNER JOIN Addresses AS T2 ON T1.permanent_address_id = T2.address_id  WHERE T2.country = 'Haiti'  UNION  SELECT first_name FROM Students  WHERE cell_mobile_number = '09700166582'	student_transcripts_tracking
SELECT Title FROM Cartoon ORDER BY Title ASC	tvshow
SELECT Title FROM Cartoon ORDER BY Title ASC	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'	tvshow
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'	tvshow
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'	tvshow
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date	tvshow
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'	tvshow
SELECT Country, count(id) FROM TV_Channel GROUP BY Country ORDER BY count(id) DESC LIMIT 1	tvshow
SELECT Country, count(id) FROM TV_Channel GROUP BY Country ORDER BY count(id) DESC LIMIT 1	tvshow
SELECT count(DISTINCT series_name), count(DISTINCT Content) FROM TV_Channel	tvshow
SELECT count(DISTINCT series_name), count(DISTINCT Content) FROM TV_Channel	tvshow
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT COUNT(id) FROM TV_Channel WHERE Language = 'English'	tvshow
SELECT COUNT(id) FROM TV_Channel WHERE Language = 'English'	tvshow
SELECT Language, count(id) FROM TV_Channel GROUP BY Language ORDER BY count(id) ASC LIMIT 1	tvshow
SELECT Language, count(id) FROM TV_Channel GROUP BY Language ORDER BY count(id) ASC LIMIT 1	tvshow
SELECT Language, count(id) FROM TV_Channel GROUP BY Language	tvshow
SELECT Language, count(id) FROM TV_Channel GROUP BY Language	tvshow
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!'	tvshow
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle'	tvshow
SELECT T1.Title FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'	tvshow
SELECT T2.Title FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'	tvshow
SELECT Episode FROM TV_series ORDER BY Rating	tvshow
SELECT Episode FROM TV_series ORDER BY Viewers_m DESC	tvshow
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3	tvshow
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3	tvshow
SELECT min(Share), max(Share) FROM TV_series	tvshow
SELECT max(Share), min(Share) FROM TV_series	tvshow
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'	tvshow
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'	tvshow
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'	tvshow
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'	tvshow
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = 'A Love of a Lifetime'	tvshow
SELECT series_name FROM TV_Channel WHERE id IN (SELECT Channel FROM TV_series WHERE Episode = 'A Love of a Lifetime')	tvshow
SELECT T2.Episode FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'	tvshow
SELECT T1.Episode FROM TV_series AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'	tvshow
SELECT Directed_by, count(*) FROM Cartoon GROUP BY Directed_by	tvshow
SELECT Directed_by, count(*) FROM Cartoon GROUP BY Directed_by	tvshow
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1	tvshow
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1	tvshow
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'Yes'	tvshow
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'Yes'	tvshow
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'	tvshow
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'	tvshow
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT T1.id FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey')	tvshow
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT T1.Channel FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id INNER JOIN TV_series AS T3 ON T2.id = T3.Channel WHERE T1.Written_by = 'Todd Casey')	tvshow
SELECT T1.series_name, T1.Country  FROM TV_Channel T1  JOIN Cartoon T2 ON T1.id = T2.Channel  WHERE T2.Directed_by = 'Ben Jones and Michael Chang'	tvshow
SELECT T1.series_name, T1.Country  FROM TV_Channel T1  WHERE T1.id IN (   SELECT T2.Channel    FROM Cartoon T2    WHERE T2.Directed_by = 'Ben Jones'    OR T2.Directed_by = 'Michael Chang' )	tvshow
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'	tvshow
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'	tvshow
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING count(id) > 2)	tvshow
SELECT Channel FROM TV_series GROUP BY Channel HAVING count(Channel) > 2	tvshow
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')	tvshow
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')	tvshow
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')	tvshow
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')	tvshow
SELECT count(*) FROM poker_player	poker_player
SELECT count(*) FROM poker_player	poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC	poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC	poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player	poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player	poker_player
SELECT avg(Earnings) FROM poker_player	poker_player
SELECT avg(Earnings) FROM poker_player	poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1	poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1	poker_player
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000	poker_player
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000	poker_player
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID	poker_player
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID	poker_player
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings > 300000	poker_player
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings > 300000	poker_player
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC	poker_player
SELECT p.Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID ORDER BY pp.Final_Table_Made ASC	poker_player
SELECT T2.Birth_Date FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings ASC LIMIT 1	poker_player
SELECT T2.Birth_Date FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings ASC LIMIT 1	poker_player
SELECT p.Money_Rank FROM poker_player p INNER JOIN people pe ON p.People_ID = pe.People_ID ORDER BY pe.Height DESC LIMIT 1	poker_player
SELECT T1.Money_Rank FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1	poker_player
SELECT avg(T1.Earnings) FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height > 200	poker_player
SELECT avg(T1.Earnings) FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height > 200	poker_player
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC	poker_player
SELECT T2.Name FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC	poker_player
SELECT Nationality, count(People_ID) FROM people GROUP BY Nationality	poker_player
SELECT Nationality, count(*) FROM people GROUP BY Nationality	poker_player
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1	poker_player
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1	poker_player
SELECT Nationality FROM people GROUP BY Nationality HAVING count(People_ID) > 1	poker_player
SELECT Nationality FROM people GROUP BY Nationality HAVING count(People_ID) >= 2	poker_player
SELECT Name, Birth_Date FROM people ORDER BY Name ASC	poker_player
SELECT Name, Birth_Date FROM people ORDER BY Name ASC	poker_player
SELECT Name FROM people WHERE Nationality != 'Russia'	poker_player
SELECT Name FROM people WHERE Nationality != 'Russia'	poker_player
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)	poker_player
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)	poker_player
SELECT count(DISTINCT Nationality) FROM people	poker_player
SELECT count(DISTINCT Nationality) FROM people	poker_player
SELECT count(DISTINCT state) FROM AREA_CODE_STATE	voter_1
SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC	voter_1
SELECT vote_id, phone_number, state FROM VOTES	voter_1
SELECT max(area_code), min(area_code) FROM AREA_CODE_STATE	voter_1
SELECT MAX(created) FROM VOTES WHERE state = 'CA'	voter_1
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'	voter_1
SELECT DISTINCT state, created FROM VOTES	voter_1
SELECT T1.contestant_number, T1.contestant_name  FROM CONTESTANTS T1  WHERE T1.contestant_number IN (   SELECT T2.contestant_number    FROM VOTES T2    GROUP BY T2.contestant_number    HAVING count(T2.vote_id) >= 2 )	voter_1
SELECT T1.contestant_number, T1.contestant_name  FROM CONTESTANTS T1  JOIN VOTES T2 ON T1.contestant_number = T2.contestant_number  GROUP BY T1.contestant_number, T1.contestant_name  ORDER BY count(T2.vote_id)  LIMIT 1	voter_1
SELECT COUNT(*) FROM VOTES WHERE state = 'NY' OR state = 'CA'	voter_1
SELECT COUNT(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES)	voter_1
SELECT area_code FROM AREA_CODE_STATE WHERE state = (SELECT state FROM VOTES GROUP BY state ORDER BY count(*) DESC LIMIT 1)	voter_1
SELECT V.created, V.state, V.phone_number  FROM VOTES V  JOIN CONTESTANTS C ON V.contestant_number = C.contestant_number  WHERE C.contestant_name = 'Tabatha Gehling'	voter_1
SELECT DISTINCT T1.area_code  FROM AREA_CODE_STATE T1  JOIN VOTES T2 ON T1.state = T2.state  JOIN CONTESTANTS T3 ON T2.contestant_number = T3.contestant_number  WHERE T3.contestant_name IN ('Tabatha Gehling', 'Kelly Clauss')  AND T1.area_code IN (   SELECT T1.area_code    FROM AREA_CODE_STATE T1    JOIN VOTES T2 ON T1.state = T2.state    JOIN CONTESTANTS T3 ON T2.contestant_number = T3.contestant_number    WHERE T3.contestant_name = 'Tabatha Gehling'   INTERSECT   SELECT T1.area_code    FROM AREA_CODE_STATE T1    JOIN VOTES T2 ON T1.state = T2.state    JOIN CONTESTANTS T3 ON T2.contestant_number = T3.contestant_number    WHERE T3.contestant_name = 'Kelly Clauss' )	voter_1
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'	voter_1
SELECT Name FROM country WHERE IndepYear > 1950	world_1
SELECT Name FROM country WHERE IndepYear > 1950	world_1
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'	world_1
SELECT COUNT(*) FROM country WHERE GovernmentForm LIKE '%Republic%'	world_1
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'	world_1
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'	world_1
SELECT Continent FROM country WHERE Code = (SELECT CountryCode FROM city WHERE Name = 'Anguilla')	world_1
SELECT T1.Continent FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T2.Name = 'Anguilla'	world_1
SELECT T2.Region FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Kabul'	world_1
SELECT T2.Region FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Kabul'	world_1
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Aruba' ORDER BY T2.Percentage DESC LIMIT 1	world_1
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Aruba' ORDER BY T2.Percentage DESC LIMIT 1	world_1
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'	world_1
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'	world_1
SELECT Region, Population FROM country WHERE Name = 'Angola'	world_1
SELECT Region, Population FROM country WHERE Name = 'Angola'	world_1
SELECT avg(LifeExpectancy) FROM country WHERE Region = 'Central Africa'	world_1
SELECT avg(LifeExpectancy) FROM country WHERE Region = 'Central Africa'	world_1
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1	world_1
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1	world_1
SELECT sum(Population), max(GNP) FROM country WHERE Continent = 'Asia'	world_1
SELECT SUM(Population), MAX(GNP) FROM country WHERE Continent = 'Asia'	world_1
SELECT avg(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'	world_1
SELECT avg(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'	world_1
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')	world_1
SELECT SUM(SurfaceArea) FROM country WHERE Continent = 'Asia' OR Continent = 'Europe'	world_1
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'	world_1
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'	world_1
SELECT avg(GNP), sum(Population) FROM country WHERE GovernmentForm = 'US territory'	world_1
SELECT avg(GNP), sum(Population) FROM country WHERE Name = 'United States'	world_1
SELECT count(DISTINCT Language) FROM countrylanguage	world_1
SELECT count(DISTINCT Language) FROM countrylanguage	world_1
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'	world_1
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'	world_1
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba')	world_1
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba')	world_1
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Afghanistan') AND IsOfficial = 'T'	world_1
SELECT COUNT(Language) FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Afghanistan') AND IsOfficial = 'T'	world_1
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY count(DISTINCT T2.Language) DESC LIMIT 1	world_1
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY count(DISTINCT T2.Language) DESC LIMIT 1	world_1
SELECT T1.Continent FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Continent ORDER BY COUNT(DISTINCT T2.Language) DESC LIMIT 1	world_1
SELECT T1.Continent FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Continent ORDER BY COUNT(DISTINCT T2.Language) DESC LIMIT 1	world_1
SELECT COUNT(DISTINCT T1.CountryCode)  FROM countrylanguage AS T1  WHERE T1.Language = 'English'  AND T1.CountryCode IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'Dutch')	world_1
SELECT COUNT(DISTINCT CountryCode) FROM countrylanguage WHERE Language = 'English' AND CountryCode IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'Dutch')	world_1
SELECT T1.Name  FROM country AS T1  WHERE T1.Code IN (   SELECT T2.CountryCode    FROM countrylanguage AS T2    WHERE T2.Language = 'English'    AND T2.CountryCode IN (     SELECT T3.CountryCode      FROM countrylanguage AS T3      WHERE T3.Language = 'French'   ) )	world_1
SELECT T1.Name  FROM country AS T1  WHERE T1.Code IN (   SELECT T2.CountryCode    FROM countrylanguage AS T2    WHERE T2.Language = 'English'   AND T2.CountryCode IN (     SELECT T3.CountryCode      FROM countrylanguage AS T3      WHERE T3.Language = 'French'   ) )	world_1
SELECT T1.Name  FROM country AS T1  WHERE T1.Code IN (   SELECT T2.CountryCode    FROM countrylanguage AS T2    WHERE T2.Language = 'English' AND T2.IsOfficial = 'T' )  AND T1.Code IN (   SELECT T3.CountryCode    FROM countrylanguage AS T3    WHERE T3.Language = 'French' AND T3.IsOfficial = 'T' )	world_1
SELECT T1.Name  FROM country AS T1  WHERE T1.Code IN (   SELECT T2.CountryCode    FROM countrylanguage AS T2    WHERE T2.Language = 'English' AND T2.IsOfficial = 'T'   INTERSECT   SELECT T2.CountryCode    FROM countrylanguage AS T2    WHERE T2.Language = 'French' AND T2.IsOfficial = 'T' )	world_1
SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'	world_1
SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'	world_1
SELECT T1.Region FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' OR T2.Language = 'Dutch'	world_1
SELECT T1.Region FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Dutch' OR T2.Language = 'English'	world_1
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'T' OR T2.Language = 'Dutch' AND T2.IsOfficial = 'T'	world_1
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.IsOfficial = 'T' AND (T2.Language = 'English' OR T2.Language = 'Dutch')	world_1
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' GROUP BY T2.Language ORDER BY SUM(T2.Percentage) DESC LIMIT 1	world_1
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' GROUP BY T2.Language ORDER BY COUNT(DISTINCT T1.Code) DESC LIMIT 1	world_1
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.GovernmentForm = 'Republic' GROUP BY T2.Language HAVING COUNT(T2.CountryCode) = 1	world_1
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.GovernmentForm = 'Republic' GROUP BY T2.Language HAVING COUNT(T2.CountryCode) = 1	world_1
SELECT c.Name, c.Population FROM city c JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode WHERE cl.Language = 'English' ORDER BY c.Population DESC LIMIT 1	world_1
SELECT c.Name, c.Population FROM city c JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode WHERE cl.Language = 'English' ORDER BY c.Population DESC LIMIT 1	world_1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' AND SurfaceArea = (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Asia')	world_1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1	world_1
SELECT avg(T1.LifeExpectancy) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'F'	world_1
SELECT avg(T1.LifeExpectancy) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'F'	world_1
SELECT SUM(c.Population) FROM country c WHERE c.Code NOT IN (SELECT cl.CountryCode FROM countrylanguage cl WHERE cl.Language = 'English')	world_1
SELECT SUM(c.Population) FROM country c WHERE c.Code NOT IN (SELECT cl.CountryCode FROM countrylanguage cl WHERE cl.Language = 'English')	world_1
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T'	world_1
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T'	world_1
SELECT COUNT(DISTINCT T2.Language) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930 AND T2.IsOfficial = 'T'	world_1
SELECT COUNT(DISTINCT T2.Language)  FROM country AS T1  INNER JOIN countrylanguage AS T2  ON T1.Code = T2.CountryCode  WHERE T1.IndepYear < 1930 AND T2.IsOfficial = 'T'	world_1
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')	world_1
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')	world_1
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia')	world_1
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia')	world_1
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa')	world_1
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa')	world_1
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')	world_1
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')	world_1
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'	world_1
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'	world_1
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm != 'Republic'	world_1
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm != 'Republic'	world_1
SELECT T1.Name  FROM city AS T1  JOIN country AS T2  ON T1.CountryCode = T2.Code  WHERE T2.Continent = 'Europe'  AND T1.CountryCode NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')	world_1
SELECT T1.Name  FROM city AS T1  JOIN country AS T2  ON T1.CountryCode = T2.Code  WHERE T2.Continent = 'Europe'  AND T1.CountryCode NOT IN (SELECT T3.CountryCode                              FROM countrylanguage AS T3                              WHERE T3.Language = 'English'                              AND T3.IsOfficial = 'T')	world_1
SELECT DISTINCT T1.Name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code INNER JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T'	world_1
SELECT DISTINCT T1.Name  FROM city AS T1  JOIN country AS T2 ON T1.CountryCode = T2.Code  JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode  WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T'	world_1
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1	world_1
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1	world_1
SELECT T1.Population, T1.Name, T1.HeadOfState FROM country T1 ORDER BY T1.SurfaceArea DESC LIMIT 1	world_1
SELECT Name, Population, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1	world_1
SELECT T1.Name, count(T2.Language)  FROM country AS T1  JOIN countrylanguage AS T2  ON T1.Code = T2.CountryCode  GROUP BY T1.Name  HAVING count(T2.Language) >= 3	world_1
SELECT T1.Name, count(T2.Language)  FROM country AS T1  JOIN countrylanguage AS T2  ON T1.Code = T2.CountryCode  GROUP BY T1.Name  HAVING count(T2.Language) > 2	world_1
SELECT District, count(*) FROM city WHERE Population > (SELECT avg(Population) FROM city) GROUP BY District	world_1
SELECT District, count(*) FROM city WHERE Population > (SELECT avg(Population) FROM city) GROUP BY District	world_1
SELECT GovernmentForm, sum(Population) FROM country WHERE LifeExpectancy > 72 GROUP BY GovernmentForm	world_1
SELECT GovernmentForm, SUM(Population)  FROM country  WHERE Code IN (   SELECT Code    FROM country    GROUP BY Code, GovernmentForm    HAVING AVG(LifeExpectancy) > 72 ) GROUP BY GovernmentForm	world_1
SELECT Continent, avg(LifeExpectancy) AS avg_life_expectancy, sum(Population) AS total_population  FROM country  WHERE Continent IS NOT NULL  GROUP BY Continent  HAVING avg(LifeExpectancy) < 72	world_1
SELECT Continent, sum(Population), avg(LifeExpectancy) FROM country WHERE Continent IN (SELECT Continent FROM country GROUP BY Continent HAVING avg(LifeExpectancy) < 72) GROUP BY Continent	world_1
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5	world_1
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5	world_1
SELECT Name FROM country ORDER BY Population DESC LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population DESC LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population ASC LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population ASC LIMIT 3	world_1
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'	world_1
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'	world_1
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000	world_1
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000	world_1
SELECT sum(Population), avg(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000	world_1
SELECT sum(Population), avg(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000	world_1
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000	world_1
SELECT Name FROM city WHERE Population > 160000 AND Population < 900000	world_1
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY count(DISTINCT CountryCode) DESC LIMIT 1	world_1
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY count(CountryCode) DESC LIMIT 1	world_1
SELECT CountryCode, Language, MAX(Percentage)  FROM countrylanguage  GROUP BY CountryCode	world_1
SELECT T1.Code, T2.Language  FROM country AS T1  JOIN countrylanguage AS T2  ON T1.Code = T2.CountryCode  WHERE T2.Percentage = (    SELECT MAX(Percentage)    FROM countrylanguage AS T3    WHERE T3.CountryCode = T1.Code  )	world_1
SELECT COUNT(*) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = ( SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish' )	world_1
SELECT COUNT(DISTINCT T1.Code) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Spanish' AND T2.Percentage = (SELECT MAX(Percentage) FROM countrylanguage AS T3 WHERE T3.CountryCode = T1.Code)	world_1
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish')	world_1
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish')	world_1
SELECT count(*) FROM conductor	orchestra
SELECT count(*) FROM conductor	orchestra
SELECT Name FROM conductor ORDER BY Age ASC	orchestra
SELECT Name FROM conductor ORDER BY Age	orchestra
SELECT Name FROM conductor WHERE Nationality != 'USA'	orchestra
SELECT Name FROM conductor WHERE Nationality != 'USA'	orchestra
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC	orchestra
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC	orchestra
SELECT avg(Attendance) FROM show	orchestra
SELECT avg(Attendance) FROM show	orchestra
SELECT max(Share), min(Share) FROM performance WHERE Type != 'Live final'	orchestra
SELECT max(Share), min(Share) FROM performance WHERE Type != 'Live final'	orchestra
SELECT count(DISTINCT Nationality) FROM conductor	orchestra
SELECT count(DISTINCT Nationality) FROM conductor	orchestra
SELECT Name FROM conductor ORDER BY Year_of_Work DESC	orchestra
SELECT Name FROM conductor ORDER BY Year_of_Work DESC	orchestra
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1	orchestra
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1	orchestra
SELECT c.Name, o.Orchestra  FROM conductor c  JOIN orchestra o  ON c.Conductor_ID = o.Conductor_ID	orchestra
SELECT c.Name, o.Orchestra  FROM conductor c  JOIN orchestra o  ON c.Conductor_ID = o.Conductor_ID	orchestra
SELECT T1.Name FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name HAVING count(DISTINCT T2.Orchestra_ID) > 1	orchestra
SELECT T1.Name FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name HAVING count(DISTINCT T2.Orchestra_ID) > 1	orchestra
SELECT T1.Name FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name ORDER BY COUNT(DISTINCT T2.Orchestra_ID) DESC LIMIT 1	orchestra
SELECT T1.Name FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name ORDER BY COUNT(DISTINCT T2.Orchestra_ID) DESC LIMIT 1	orchestra
SELECT T1.Name FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008	orchestra
SELECT T1.Name FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008	orchestra
SELECT Record_Company, count(Orchestra_ID) FROM orchestra GROUP BY Record_Company	orchestra
SELECT Record_Company, count(Orchestra_ID) FROM orchestra GROUP BY Record_Company	orchestra
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(Major_Record_Format) ASC	orchestra
SELECT Major_Record_Format, COUNT(*) as frequency FROM orchestra GROUP BY Major_Record_Format ORDER BY frequency DESC	orchestra
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(Orchestra_ID) DESC LIMIT 1	orchestra
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(Orchestra_ID) DESC LIMIT 1	orchestra
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)	orchestra
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)	orchestra
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003	orchestra
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003	orchestra
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format = 'CD' OR Major_Record_Format = 'DVD'	orchestra
SELECT COUNT(Orchestra_ID) FROM orchestra WHERE Major_Record_Format = 'CD' OR Major_Record_Format = 'DVD'	orchestra
SELECT T1.Year_of_Founded FROM orchestra AS T1 INNER JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T1.Year_of_Founded HAVING count(T2.Performance_ID) > 1	orchestra
SELECT T1.Year_of_Founded FROM orchestra AS T1 INNER JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T1.Orchestra_ID, T1.Year_of_Founded HAVING count(T2.Performance_ID) > 1	orchestra
SELECT count(*) FROM Highschooler	network_1
SELECT count(*) FROM Highschooler	network_1
SELECT name, grade FROM Highschooler	network_1
SELECT name, grade FROM Highschooler	network_1
SELECT grade FROM Highschooler	network_1
SELECT name, grade FROM Highschooler	network_1
SELECT grade FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT grade FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT name FROM Highschooler WHERE grade = 10	network_1
SELECT name FROM Highschooler WHERE grade = 10	network_1
SELECT ID FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT ID FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT count(*) FROM Highschooler WHERE grade = 9 OR grade = 10	network_1
SELECT count(*) FROM Highschooler WHERE grade = 9 OR grade = 10	network_1
SELECT grade, count(*) FROM Highschooler GROUP BY grade	network_1
SELECT grade, count(*) FROM Highschooler GROUP BY grade	network_1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY count(*) DESC LIMIT 1	network_1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1	network_1
SELECT grade FROM Highschooler GROUP BY grade HAVING count(ID) >= 4	network_1
SELECT grade FROM Highschooler GROUP BY grade HAVING count(*) >= 4	network_1
SELECT student_id, count(friend_id) FROM Friend GROUP BY student_id	network_1
SELECT student_id, count(friend_id) FROM Friend GROUP BY student_id	network_1
SELECT H1.name, COUNT(F1.friend_id)  FROM Highschooler H1  LEFT JOIN Friend F1 ON H1.ID = F1.student_id  GROUP BY H1.name	network_1
SELECT H1.name, count(F1.student_id)  FROM Highschooler H1  LEFT JOIN Friend F1 ON H1.ID = F1.student_id  GROUP BY H1.name  UNION  SELECT H2.name, count(F2.friend_id)  FROM Highschooler H2  LEFT JOIN Friend F2 ON H2.ID = F2.friend_id  GROUP BY H2.name	network_1
SELECT H1.name FROM Highschooler H1 INNER JOIN Friend F ON H1.ID = F.student_id GROUP BY H1.name ORDER BY count(F.friend_id) DESC LIMIT 1	network_1
SELECT H1.name FROM Highschooler H1 INNER JOIN Friend F ON H1.ID = F.student_id GROUP BY H1.name ORDER BY count(F.friend_id) DESC LIMIT 1	network_1
SELECT H1.name FROM Highschooler H1 WHERE H1.ID IN (SELECT F1.student_id FROM Friend F1 GROUP BY F1.student_id HAVING count(F1.friend_id) >= 3)	network_1
SELECT H.name FROM Highschooler H JOIN Friend F ON H.ID = F.student_id GROUP BY H.name HAVING count(F.friend_id) >= 3	network_1
SELECT H2.name FROM Highschooler H1 INNER JOIN Friend F ON H1.ID = F.student_id INNER JOIN Highschooler H2 ON F.friend_id = H2.ID WHERE H1.name = 'Kyle'	network_1
SELECT H2.name FROM Highschooler H1 INNER JOIN Friend F ON H1.ID = F.student_id INNER JOIN Highschooler H2 ON F.friend_id = H2.ID WHERE H1.name = 'Kyle'	network_1
SELECT count(friend_id) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')	network_1
SELECT count(friend_id) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')	network_1
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)	network_1
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)	network_1
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)	network_1
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)	network_1
SELECT H1.ID FROM Highschooler H1  JOIN Friend F ON H1.ID = F.student_id  JOIN Likes L ON H1.ID = L.liked_id	network_1
SELECT ID FROM Highschooler  WHERE ID IN (SELECT student_id FROM Friend)  AND ID IN (SELECT liked_id FROM Likes)	network_1
SELECT H1.name FROM Highschooler H1  WHERE H1.ID IN (SELECT student_id FROM Friend)  AND H1.ID IN (SELECT liked_id FROM Likes)	network_1
SELECT H1.name FROM Highschooler H1  WHERE H1.ID IN (SELECT student_id FROM Friend)  AND H1.ID IN (SELECT liked_id FROM Likes)	network_1
SELECT student_id, count(liked_id) FROM Likes GROUP BY student_id	network_1
SELECT student_id, count(liked_id) FROM Likes GROUP BY student_id	network_1
SELECT H1.name, count(L.liked_id) FROM Highschooler H1 INNER JOIN Likes L ON H1.ID = L.student_id GROUP BY H1.name	network_1
SELECT H1.name, count(L.liked_id)  FROM Highschooler H1  JOIN Likes L ON H1.ID = L.student_id  GROUP BY H1.name	network_1
SELECT H.name FROM Highschooler H JOIN Likes L ON H.ID = L.liked_id GROUP BY H.name ORDER BY count(L.student_id) DESC LIMIT 1	network_1
SELECT H1.name FROM Highschooler H1 INNER JOIN Likes L ON H1.ID = L.liked_id GROUP BY H1.name ORDER BY count(L.student_id) DESC LIMIT 1	network_1
SELECT H1.name FROM Highschooler H1 WHERE H1.ID IN (SELECT L1.liked_id FROM Likes L1 GROUP BY L1.liked_id HAVING count(L1.liked_id) >= 2)	network_1
SELECT H.name FROM Highschooler H JOIN Likes L ON H.ID = L.liked_id GROUP BY H.name HAVING count(L.student_id) >= 2	network_1
SELECT H1.name  FROM Highschooler H1  WHERE H1.grade > 5  AND H1.ID IN (   SELECT F1.student_id    FROM Friend F1    GROUP BY F1.student_id    HAVING count(F1.friend_id) >= 2 )	network_1
SELECT H.name FROM Highschooler H  JOIN Friend F ON H.ID = F.student_id  GROUP BY H.name  HAVING H.grade > 5 AND count(F.friend_id) >= 2	network_1
SELECT COUNT(liked_id) FROM Likes WHERE liked_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')	network_1
SELECT COUNT(liked_id) FROM Likes WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')	network_1
SELECT avg(T1.grade) FROM Highschooler AS T1 INNER JOIN Friend AS T2 ON T1.ID = T2.student_id	network_1
SELECT avg(T1.grade) FROM Highschooler AS T1 INNER JOIN Friend AS T2 ON T1.ID = T2.student_id	network_1
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)	network_1
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)	network_1
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals	dog_kennels
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals	dog_kennels
SELECT avg(T1.age) FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id	dog_kennels
SELECT avg(T1.age) FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id	dog_kennels
SELECT T1.professional_id, T1.last_name, T1.cell_number  FROM Professionals AS T1  WHERE T1.state = 'Indiana'  UNION  SELECT T1.professional_id, T1.last_name, T1.cell_number  FROM Professionals AS T1  JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id  GROUP BY T1.professional_id, T1.last_name, T1.cell_number  HAVING COUNT(T2.treatment_id) > 2	dog_kennels
SELECT T1.professional_id, T1.last_name, T1.cell_number  FROM Professionals T1  WHERE T1.state = 'Indiana'  OR T1.professional_id IN (   SELECT T2.professional_id    FROM Treatments T2    GROUP BY T2.professional_id    HAVING COUNT(T2.treatment_id) > 2 )	dog_kennels
SELECT D.name  FROM Dogs D  WHERE D.dog_id NOT IN (   SELECT T.dog_id    FROM Treatments T    GROUP BY T.dog_id    HAVING SUM(T.cost_of_treatment) > 1000 )	dog_kennels
SELECT D.name  FROM Dogs D  WHERE D.dog_id NOT IN (   SELECT T.dog_id    FROM Treatments T    GROUP BY T.dog_id    HAVING SUM(T.cost_of_treatment) > 1000 )	dog_kennels
SELECT first_name FROM Owners  WHERE first_name NOT IN (SELECT name FROM Dogs) UNION SELECT first_name FROM Professionals  WHERE first_name NOT IN (SELECT name FROM Dogs)	dog_kennels
SELECT first_name FROM Owners  EXCEPT  SELECT name FROM Dogs  UNION  SELECT first_name FROM Professionals  EXCEPT  SELECT name FROM Dogs	dog_kennels
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)	dog_kennels
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)	dog_kennels
SELECT T1.owner_id, T1.first_name, T1.last_name  FROM Owners AS T1  JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id  GROUP BY T1.owner_id, T1.first_name, T1.last_name  ORDER BY COUNT(T2.dog_id) DESC  LIMIT 1	dog_kennels
SELECT owner_id, first_name, last_name FROM Owners WHERE owner_id = (SELECT owner_id FROM Dogs GROUP BY owner_id ORDER BY COUNT(dog_id) DESC LIMIT 1)	dog_kennels
SELECT T1.professional_id, T1.role_code, T1.first_name  FROM Professionals T1  JOIN Treatments T2 ON T1.professional_id = T2.professional_id  GROUP BY T1.professional_id, T1.role_code, T1.first_name  HAVING count(T2.treatment_id) >= 2	dog_kennels
SELECT T1.professional_id, T1.role_code, T1.first_name  FROM Professionals T1  JOIN Treatments T2 ON T1.professional_id = T2.professional_id  GROUP BY T1.professional_id, T1.role_code, T1.first_name  HAVING COUNT(T2.treatment_id) >= 2	dog_kennels
SELECT T1.breed_name FROM Breeds T1 INNER JOIN Dogs T2 ON T1.breed_code = T2.breed_code GROUP BY T1.breed_name ORDER BY COUNT(T2.dog_id) DESC LIMIT 1	dog_kennels
SELECT B.breed_name FROM Breeds B JOIN Dogs D ON B.breed_code = D.breed_code GROUP BY B.breed_name ORDER BY COUNT(D.dog_id) DESC LIMIT 1	dog_kennels
SELECT T1.owner_id, T1.last_name  FROM Owners AS T1  JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id  JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id  GROUP BY T1.owner_id, T1.last_name  ORDER BY COUNT(T3.treatment_id) DESC  LIMIT 1	dog_kennels
SELECT T1.owner_id, T1.last_name  FROM Owners AS T1  JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id  JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id  GROUP BY T1.owner_id, T1.last_name  ORDER BY SUM(T3.cost_of_treatment) DESC  LIMIT 1	dog_kennels
SELECT T2.treatment_type_description  FROM Treatments AS T1  INNER JOIN Treatment_Types AS T2  ON T1.treatment_type_code = T2.treatment_type_code  GROUP BY T2.treatment_type_description  ORDER BY SUM(T1.cost_of_treatment)  LIMIT 1	dog_kennels
SELECT T2.treatment_type_description  FROM Treatments AS T1  INNER JOIN Treatment_Types AS T2  ON T1.treatment_type_code = T2.treatment_type_code  GROUP BY T2.treatment_type_description  ORDER BY SUM(T1.cost_of_treatment)  LIMIT 1	dog_kennels
SELECT T1.owner_id, T1.zip_code  FROM Owners AS T1  JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id  JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id  GROUP BY T1.owner_id, T1.zip_code  ORDER BY SUM(T3.cost_of_treatment) DESC  LIMIT 1	dog_kennels
SELECT T1.owner_id, T1.zip_code  FROM Owners AS T1  JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id  JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id  GROUP BY T1.owner_id, T1.zip_code  ORDER BY SUM(T3.cost_of_treatment) DESC  LIMIT 1	dog_kennels
SELECT T1.professional_id, T1.cell_number  FROM Professionals T1  JOIN Treatments T2 ON T1.professional_id = T2.professional_id  JOIN Treatment_Types T3 ON T2.treatment_type_code = T3.treatment_type_code  GROUP BY T1.professional_id, T1.cell_number  HAVING COUNT(DISTINCT T3.treatment_type_code) >= 2	dog_kennels
SELECT professional_id, cell_number  FROM Professionals  WHERE professional_id IN (   SELECT professional_id    FROM Treatments    GROUP BY professional_id    HAVING COUNT(DISTINCT treatment_type_code) >= 2 )	dog_kennels
SELECT T1.first_name, T1.last_name  FROM Professionals AS T1  JOIN Treatments AS T2  ON T1.professional_id = T2.professional_id  WHERE T2.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)	dog_kennels
SELECT DISTINCT T1.first_name, T1.last_name  FROM Professionals T1  JOIN Treatments T2 ON T1.professional_id = T2.professional_id  WHERE T2.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)	dog_kennels
SELECT T.date_of_treatment, P.first_name  FROM Treatments T  JOIN Professionals P ON T.professional_id = P.professional_id	dog_kennels
SELECT T.date_of_treatment, P.first_name  FROM Treatments T  JOIN Professionals P ON T.professional_id = P.professional_id	dog_kennels
SELECT T1.cost_of_treatment, T2.treatment_type_description  FROM Treatments T1  INNER JOIN Treatment_Types T2  ON T1.treatment_type_code = T2.treatment_type_code	dog_kennels
SELECT T.cost_of_treatment, TT.treatment_type_description  FROM Treatments T  JOIN Treatment_Types TT ON T.treatment_type_code = TT.treatment_type_code	dog_kennels
SELECT O.first_name, O.last_name, S.size_description  FROM Owners O  JOIN Dogs D ON O.owner_id = D.owner_id  JOIN Sizes S ON D.size_code = S.size_code	dog_kennels
SELECT O.first_name, O.last_name, S.size_description  FROM Owners O  JOIN Dogs D ON O.owner_id = D.owner_id  JOIN Sizes S ON D.size_code = S.size_code	dog_kennels
SELECT O.first_name, D.name FROM Owners O INNER JOIN Dogs D ON O.owner_id = D.owner_id	dog_kennels
SELECT O.first_name, D.name  FROM Owners O  JOIN Dogs D ON O.owner_id = D.owner_id	dog_kennels
SELECT D.name, T.date_of_treatment  FROM Dogs D  JOIN Treatments T ON D.dog_id = T.dog_id  JOIN Breeds B ON D.breed_code = B.breed_code  WHERE B.breed_name = (    SELECT breed_name    FROM Breeds    GROUP BY breed_name    ORDER BY COUNT(breed_name)    LIMIT 1  )	dog_kennels
SELECT D.name, T.date_of_treatment  FROM Dogs D  JOIN Breeds B ON D.breed_code = B.breed_code  JOIN Treatments T ON D.dog_id = T.dog_id  WHERE B.breed_code = (    SELECT breed_code    FROM Dogs    GROUP BY breed_code    ORDER BY COUNT(*) ASC    LIMIT 1  )	dog_kennels
SELECT T1.first_name, T2.name FROM Owners AS T1 INNER JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id WHERE T1.state = 'VA'	dog_kennels
SELECT T1.first_name, T2.name FROM Owners AS T1 INNER JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id WHERE T1.state = 'Virginia'	dog_kennels
SELECT T1.date_arrived, T1.date_departed FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id	dog_kennels
SELECT T1.date_arrived, T1.date_departed FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id	dog_kennels
SELECT T2.last_name FROM Dogs AS T1 INNER JOIN Owners AS T2 ON T1.owner_id = T2.owner_id ORDER BY T1.age ASC LIMIT 1	dog_kennels
SELECT T2.last_name FROM Dogs AS T1 INNER JOIN Owners AS T2 ON T1.owner_id = T2.owner_id ORDER BY T1.age ASC LIMIT 1	dog_kennels
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'	dog_kennels
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'	dog_kennels
SELECT date_arrived, date_departed FROM Dogs	dog_kennels
SELECT date_arrived, date_departed FROM Dogs	dog_kennels
SELECT COUNT(DISTINCT dog_id) FROM Treatments	dog_kennels
SELECT COUNT(DISTINCT dog_id) FROM Treatments	dog_kennels
SELECT count(DISTINCT professional_id) FROM Treatments	dog_kennels
SELECT COUNT(DISTINCT professional_id) FROM Treatments	dog_kennels
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'	dog_kennels
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'	dog_kennels
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'	dog_kennels
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'	dog_kennels
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)	dog_kennels
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)	dog_kennels
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1	dog_kennels
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1	dog_kennels
SELECT count(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)	dog_kennels
SELECT count(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)	dog_kennels
SELECT COUNT(owner_id) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs WHERE abandoned_yn = 'N' AND date_adopted IS NULL AND date_departed IS NULL)	dog_kennels
SELECT COUNT(owner_id) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs WHERE date_adopted IS NULL AND date_arrived IS NOT NULL)	dog_kennels
SELECT count(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)	dog_kennels
SELECT count(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)	dog_kennels
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'	dog_kennels
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'	dog_kennels
SELECT avg(age) FROM Dogs	dog_kennels
SELECT avg(age) FROM Dogs	dog_kennels
SELECT age FROM Dogs ORDER BY age DESC LIMIT 1	dog_kennels
SELECT age FROM Dogs ORDER BY age DESC LIMIT 1	dog_kennels
SELECT charge_type, charge_amount FROM Charges	dog_kennels
SELECT charge_type, charge_amount FROM Charges	dog_kennels
SELECT MAX(charge_amount) FROM Charges	dog_kennels
SELECT charge_amount FROM Charges ORDER BY charge_amount DESC LIMIT 1	dog_kennels
SELECT email_address, cell_number, home_phone FROM Professionals	dog_kennels
SELECT email_address, cell_number, home_phone FROM Professionals	dog_kennels
SELECT DISTINCT breed_code, size_code FROM Dogs	dog_kennels
SELECT DISTINCT breed_code, size_code FROM Dogs	dog_kennels
SELECT P.first_name, TTD.treatment_type_description  FROM Professionals P  JOIN Treatments T ON P.professional_id = T.professional_id  JOIN Treatment_Types TTD ON T.treatment_type_code = TTD.treatment_type_code	dog_kennels
SELECT P.first_name, T_T.treatment_type_description  FROM Professionals P  JOIN Treatments T ON P.professional_id = T.professional_id  JOIN Treatment_Types T_T ON T.treatment_type_code = T_T.treatment_type_code	dog_kennels
SELECT count(*) FROM singer	singer
SELECT count(*) FROM singer	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC	singer
SELECT Birth_Year, Citizenship FROM singer	singer
SELECT Birth_Year, Citizenship FROM singer	singer
SELECT Name FROM singer WHERE Citizenship != 'France'	singer
SELECT Name FROM singer WHERE Citizenship != 'French'	singer
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949	singer
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1	singer
SELECT Citizenship, count(*) FROM singer GROUP BY Citizenship	singer
SELECT Citizenship, count(*) FROM singer GROUP BY Citizenship	singer
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1	singer
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1	singer
SELECT Citizenship, max(Net_Worth_Millions) FROM singer GROUP BY Citizenship	singer
SELECT Citizenship, max(Net_Worth_Millions) FROM singer GROUP BY Citizenship	singer
SELECT s.Title, si.Name FROM song s JOIN singer si ON s.Singer_ID = si.Singer_ID	singer
SELECT T1.Title, T2.Name FROM song AS T1 INNER JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID	singer
SELECT DISTINCT T1.Name FROM singer T1 INNER JOIN song T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000	singer
SELECT DISTINCT T1.Name FROM singer AS T1 INNER JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000	singer
SELECT T1.Name FROM singer AS T1 INNER JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID HAVING count(T2.Song_ID) > 1	singer
SELECT T1.Name FROM singer AS T1 INNER JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID HAVING count(T2.Song_ID) > 1	singer
SELECT s.Name, sum(so.Sales) FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name	singer
SELECT s.Name, SUM(so.Sales) FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name	singer
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)	singer
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)	singer
SELECT Citizenship FROM singer WHERE Birth_Year < 1945  INTERSECT  SELECT Citizenship FROM singer WHERE Birth_Year > 1955	singer
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955	singer
SELECT count(*) FROM Other_Available_Features	real_estate_properties
SELECT T1.feature_type_name FROM Ref_Feature_Types AS T1 INNER JOIN Other_Available_Features AS T2 ON T1.feature_type_code = T2.feature_type_code WHERE T2.feature_name = 'AirCon'	real_estate_properties
SELECT T1.property_type_description FROM Ref_Property_Types AS T1 INNER JOIN Properties AS T2 ON T1.property_type_code = T2.property_type_code	real_estate_properties
SELECT property_name FROM Properties WHERE (property_type_code = 'HSE' OR property_type_code = 'APT') AND room_count > 1	real_estate_properties

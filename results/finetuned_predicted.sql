SELECT count(*) FROM singer	concert_singer
SELECT count(*) FROM singer	concert_singer
SELECT name ,  country ,  age FROM singer ORDER BY age DESC	concert_singer
SELECT name ,  country ,  age FROM singer ORDER BY age DESC	concert_singer
SELECT avg(age) ,  min(age) ,  max(age) FROM singer WHERE country  =  'France'	concert_singer
SELECT avg(age) ,  min(age) ,  max(age) FROM singer WHERE country  =  'France'	concert_singer
SELECT Song_Name ,  Song_release_year FROM singer ORDER BY Age ASC LIMIT 1	concert_singer
SELECT Song_Name ,  Song_release_year FROM singer ORDER BY Age ASC LIMIT 1	concert_singer
SELECT DISTINCT country FROM singer WHERE age  >  20	concert_singer
SELECT DISTINCT country FROM singer WHERE age  >  20	concert_singer
SELECT Country ,  COUNT(*) FROM singer GROUP BY Country	concert_singer
SELECT count(*) ,  country FROM singer GROUP BY country	concert_singer
SELECT Song_Name FROM singer WHERE Age  >  (SELECT avg(Age) FROM singer)	concert_singer
SELECT Song_Name FROM singer WHERE age  >  (SELECT avg(age) FROM singer)	concert_singer
SELECT LOCATION ,  name FROM stadium WHERE capacity BETWEEN 5000 AND 10000	concert_singer
SELECT LOCATION ,  name FROM stadium WHERE capacity BETWEEN 5000 AND 10000	concert_singer
SELECT max(capacity) ,  avg(capacity) FROM stadium	concert_singer
SELECT avg(capacity) ,  max(capacity) FROM stadium	concert_singer
SELECT name ,  capacity FROM stadium ORDER BY average DESC LIMIT 1	concert_singer
SELECT name ,  capacity FROM stadium ORDER BY average DESC LIMIT 1	concert_singer
SELECT count(*) FROM concert WHERE YEAR  =  2014 OR YEAR  =  2015	concert_singer
SELECT count(*) FROM concert WHERE YEAR  =  2014 OR YEAR  =  2015	concert_singer
SELECT T2.name ,  count(*) FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id GROUP BY T1.stadium_id	concert_singer
SELECT T2.name ,  count(*) FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id GROUP BY T1.stadium_id	concert_singer
SELECT T3.name ,  T3.capacity FROM concert AS T1 JOIN stadium AS T3 ON T1.stadium_id  =  T3.stadium_id WHERE T1.year  >=  2014 GROUP BY T1.stadium_id ORDER BY count(*) DESC LIMIT 1	concert_singer
SELECT T1.name ,  T1.capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE T2.year  >  2013 GROUP BY T1.stadium_id ORDER BY count(*) DESC LIMIT 1	concert_singer
SELECT YEAR FROM concert GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1	concert_singer
SELECT YEAR FROM concert GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1	concert_singer
SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)	concert_singer
SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)	concert_singer
SELECT DISTINCT country FROM singer WHERE age  >  40 INTERSECT SELECT DISTINCT country FROM singer WHERE age  <  30	concert_singer
SELECT name FROM stadium EXCEPT SELECT T1.name FROM stadium AS T1 JOIN concert AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE T2.year  =  2014	concert_singer
SELECT name FROM stadium EXCEPT SELECT T1.name FROM stadium AS T1 JOIN concert AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE YEAR  =  2014	concert_singer
SELECT T1.concert_name ,  T1.theme ,  count(*) FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_id  =  T2.concert_id GROUP BY T1.concert_id	concert_singer
SELECT T1.concert_name ,  T1.theme ,  count(*) FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_id  =  T2.concert_id GROUP BY T1.concert_id	concert_singer
SELECT T2.Name ,  COUNT(*) FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T2.Name	concert_singer
SELECT T2.Name ,  COUNT(*) FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.singer_id  =  T2.singer_id GROUP BY T2.Name	concert_singer
SELECT T3.Name FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_id  =  T2.concert_id JOIN singer AS T3 ON T2.singer_id  =  T3.singer_id WHERE T1.Year  =  "2014"	concert_singer
SELECT T3.Name FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_ID  =  T2.concert_ID JOIN singer AS T3 ON T2.Singer_ID  =  T3.Singer_ID WHERE T1.Year  =  "2014"	concert_singer
SELECT Name ,  Country FROM singer WHERE Song_Name LIKE '%Hey%'	concert_singer
SELECT name ,  country FROM singer WHERE Song_Name LIKE '%Hey%'	concert_singer
SELECT T3.name ,  T3.location FROM concert AS T1 JOIN stadium AS T3 ON T1.stadium_id  =  T3.stadium_id WHERE T1.year  =  2014 INTERSECT SELECT T3.name ,  T3.location FROM concert AS T1 JOIN stadium AS T3 ON T1.stadium_id  =  T3.stadium_id WHERE T1.year  =  2015	concert_singer
SELECT T3.name ,  T3.location FROM concert AS T1 JOIN stadium AS T3 ON T1.stadium_id  =  T3.stadium_id WHERE T1.year  =  2014 INTERSECT SELECT T3.name ,  T3.location FROM concert AS T1 JOIN stadium AS T3 ON T1.stadium_id  =  T3.stadium_id WHERE T1.year  =  2015	concert_singer
SELECT count(*) FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE T2.capacity  =  ( SELECT max(capacity) FROM stadium )	concert_singer
SELECT count(*) FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE T2.capacity  =  ( SELECT max(capacity) FROM stadium )	concert_singer
SELECT count(*) FROM Pets WHERE weight  >  10	pets_1
SELECT count(*) FROM PETS WHERE weight  >  10	pets_1
SELECT weight FROM Pets WHERE pet_age  =  (SELECT min(pet_age) FROM pets WHERE pettype  =  "dog")	pets_1
SELECT weight FROM Pets WHERE pet_age  =  (SELECT min(pet_age) FROM pets WHERE pettype  =  "dog")	pets_1
SELECT max(weight) ,  pet_type FROM pets GROUP BY pet_type	pets_1
SELECT max(weight) ,  pettype FROM pets GROUP BY pettype	pets_1
SELECT count(*) FROM has_pet AS T1 JOIN student AS T2 ON T1.stuid  =  T2.stuid WHERE T2.age  >  20	pets_1
SELECT count(*) FROM has_pet AS T1 JOIN student AS T2 ON T1.stuid  =  T2.stuid WHERE T2.age  >  20	pets_1
SELECT count(*) FROM has_pet AS T1 JOIN student AS T2 ON T1.stuid  =  T2.stuid JOIN pets AS T3 ON T1.petid  =  T3.petid WHERE T2.sex  =  'F' AND T3.PetType  =  "Dog"	pets_1
SELECT count(*) FROM has_pet AS T1 JOIN student AS T2 ON T1.stuid  =  T2.stuid JOIN pets AS T3 ON T1.petid  =  T3.petid WHERE T2.sex  =  'F' AND T3.PetType  =  "Dog"	pets_1
SELECT count(DISTINCT pettype) FROM pets	pets_1
SELECT count(DISTINCT pettype) FROM pets	pets_1
SELECT DISTINCT T1.fname FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid  =  T2.stuid JOIN pets AS T3 ON T2.petid  =  T3.petid WHERE T3.pettype  =  "cat" OR T3.pettype  =  "dog"	pets_1
SELECT DISTINCT T3.fname FROM pets AS T1 JOIN has_pet AS T2 ON T1.petid  =  T2.petid JOIN student AS T3 ON T2.stuid  =  T3.stuid WHERE T1.pettype  =  "cat" OR T1.pettype  =  "dog"	pets_1
SELECT T1.fname FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid  =  T2.stuid JOIN pets AS T3 ON T2.petid  =  T3.petid WHERE T3.pettype  =  'cat' INTERSECT SELECT T1.fname FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid  =  T2.stuid JOIN pets AS T3 ON T2.petid  =  T3.petid WHERE T3.pettype  =  'dog'	pets_1
SELECT T1.fname FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid  =  T2.stuid JOIN pets AS T3 ON T2.petid  =  T3.petid WHERE T3.pettype  =  'cat' INTERSECT SELECT T1.fname FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid  =  T2.stuid JOIN pets AS T3 ON T2.petid  =  T3.petid WHERE T3.pettype  =  'dog'	pets_1
SELECT major ,  age FROM student WHERE StuID NOT IN (SELECT T1.StuID FROM Has_Pet AS T1 JOIN Pets AS T2 ON T1.PetID  =  T2.PetID WHERE T2.pet_type  =  "cat")	pets_1
SELECT major ,  age FROM student WHERE StuID NOT IN (SELECT T1.StuID FROM Has_Pet AS T1 JOIN Pets AS T2 ON T1.PetID  =  T2.PetID WHERE T2.pet_type  =  "cat")	pets_1
SELECT StuID FROM Student EXCEPT SELECT T1.StuID FROM Has_Pet AS T1 JOIN Pets AS T2 ON T1.PetID  =  T2.PetID WHERE T2.pet_type  =  "cat"	pets_1
SELECT StuID FROM Has_Pet EXCEPT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType  =  "cat")	pets_1
SELECT T1.fname ,  T1.age FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid  =  T2.stuid JOIN pets AS T3 ON T2.petid  =  T3.petid WHERE T3.pettype  =  'dog' EXCEPT SELECT T1.fname ,   T1.age FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid  =  T2.stuid JOIN pets AS T3 ON T2.petid  =  T3.petid WHERE T3.pettype  =  'cat'	pets_1
SELECT T1.fname FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid  =  T2.stuid JOIN pets AS T3 ON T2.petid  =  T3.petid WHERE T3.pettype  =  'dog' EXCEPT SELECT T1.fname FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid  =  T2.stuid JOIN pets AS T3 ON T2.petid  =  T3.petid WHERE T3.pettype  =  'cat'	pets_1
SELECT pet_type ,  weight FROM pets ORDER BY pet_age LIMIT 1	pets_1
SELECT pet_type ,  weight FROM pets ORDER BY pet_age LIMIT 1	pets_1
SELECT petid ,  weight FROM Pets WHERE pet_age  >  1	pets_1
SELECT petid ,  weight FROM pets WHERE pet_age  >  1	pets_1
SELECT avg(pet_age) ,  max(pet_age) ,  pettype FROM pets GROUP BY pettype	pets_1
SELECT avg(pet_age) ,  max(pet_age) ,  pettype FROM pets GROUP BY pettype	pets_1
SELECT avg(weight) ,  pet_type FROM pets GROUP BY pet_type	pets_1
SELECT avg(weight) ,  pettype FROM pets GROUP BY pettype	pets_1
SELECT DISTINCT T1.fname ,  T1.age FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid  =  T2.stuid	pets_1
SELECT DISTINCT T1.fname ,  T1.age FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid  =  T2.stuid	pets_1
SELECT T2.PetID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID  =  T2.StuID WHERE T1.LName  =  'Smith'	pets_1
SELECT T2.PetID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID  =  T2.StuID WHERE T1.LName  =  "Smith"	pets_1
SELECT count(*) ,  T1.StuID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID  =  T2.StuID GROUP BY T1.StuID	pets_1
SELECT Stuid ,  count(*) FROM Has_pet GROUP BY Stuid	pets_1
SELECT T1.fname ,  T1.sex FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.stuid  =  T2.stuid GROUP BY T1.stuid HAVING count(*)  >  1	pets_1
SELECT T1.fname ,  T1.sex FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid  =  T2.stuid GROUP BY T2.stuid HAVING count(*)  >  1	pets_1
SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID  =  T2.StuID JOIN Pets AS T3 ON T2.PetID  =  T3.PetID WHERE T3.Pet_Age  =  3 AND T3.Pettype  =  "Cat"	pets_1
SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID  =  T2.StuID JOIN Pets AS T3 ON T2.PetID  =  T3.PetID WHERE T3.PetAge  =  3 AND T3.PetType  =  "cat"	pets_1
SELECT avg(age) FROM student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)	pets_1
SELECT avg(age) FROM student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)	pets_1
SELECT count(*) FROM continents	car_1
SELECT count(*) FROM continents	car_1
SELECT T1.ContId ,  T1.Continent ,  COUNT(*) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId  =  T2.Continent GROUP BY T1.ContId	car_1
SELECT T1.ContId ,  T1.Continent ,  COUNT(*) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId  =  T2.Continent GROUP BY T1.ContId	car_1
SELECT count(*) FROM countries	car_1
SELECT count(*) FROM countries	car_1
SELECT T1.FullName ,  T2.id ,  count(*) FROM car_makers AS T1 JOIN model_list AS T2 ON T1.id  =  T2.Maker GROUP BY T2.id	car_1
SELECT T1.id ,  T1.FullName ,  count(*) FROM car_makers AS T1 JOIN model_list AS T2 ON T1.id  =  T2.Maker GROUP BY T1.id	car_1
SELECT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.ModelID  =  T2.Model ORDER BY T2.Horsepower LIMIT 1	car_1
SELECT T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId  =  T2.id ORDER BY T2.Horsepower LIMIT 1	car_1
SELECT T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId  =  T2.id WHERE T2.Weight  <  (SELECT avg(Weight) FROM cars_data)	car_1
SELECT T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId  =  T2.id WHERE T2.Weight  <  (SELECT avg(Weight) FROM cars_data)	car_1
SELECT DISTINCT T2.maker FROM cars_data AS T1 JOIN car_names AS T2 ON T1.id  =  T2.makeid WHERE T1.year  =  1970	car_1
SELECT DISTINCT T2.maker FROM car_names AS T1 JOIN car_makers AS T2 ON T1.make = T2.id JOIN cars_data AS T3 ON T1.makeid  =  T3.id WHERE T3.year  =  1970	car_1
SELECT T1.Make ,  T2.Year FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId  =  T2.Id ORDER BY T2.Year ASC LIMIT 1	car_1
SELECT T1.maker ,  T2.year FROM model_list AS T1 JOIN cars_data AS T2 ON T1.modelid  =  T2.id ORDER BY T2.year LIMIT 1	car_1
SELECT DISTINCT T2.Model FROM cars_data AS T1 JOIN car_names AS T2 ON T1.id  =  T2.makeid WHERE T1.year  >  1980	car_1
SELECT DISTINCT T2.Model FROM cars_data AS T1 JOIN car_names AS T2 ON T1.id  =  T2.makeid WHERE T1.year  >  1980	car_1
SELECT T1.Continent ,  COUNT(*) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId  =  T2.Continent JOIN car_makers AS T3 ON T2.CountryId  =  T3.Country GROUP BY T1.Continent	car_1
SELECT T1.continent ,  count(*) FROM continents AS T1 JOIN car_makers AS T2 ON T1.ContId  =  T2.Country GROUP BY T1.ContId	car_1
SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId  =  T2.Country GROUP BY T1.CountryName ORDER BY COUNT(*) DESC LIMIT 1	car_1
SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId  =  T2.Country GROUP BY T1.CountryName ORDER BY COUNT(*) DESC LIMIT 1	car_1
SELECT count(*) ,  T1.FullName FROM car_makers AS T1 JOIN model_list AS T2 ON T1.id  =  T2.Maker GROUP BY T1.FullName	car_1
SELECT count(*) ,  T1.id ,  T1.fullname FROM car_makers AS T1 JOIN model_list AS T2 ON T1.id  =  T2.Maker GROUP BY T1.id	car_1
SELECT T1.accelerate FROM cars_data AS T1 JOIN car_names AS T2 ON T1.id  =  T2.makeid WHERE T2.model  =  "amc hornet sportabout (sw)"	car_1
SELECT T1.accelerate FROM cars_data AS T1 JOIN car_names AS T2 ON T1.id  =  T2.makeid WHERE T2.model  =  "amc hornet sportabout (sw)"	car_1
SELECT count(*) FROM car_makers WHERE country  =  'France'	car_1
SELECT count(*) FROM car_makers WHERE country  =  'France'	car_1
SELECT count(*) FROM car_makers WHERE country  =  'usa'	car_1
SELECT count(*) FROM car_makers WHERE country  =  'United States'	car_1
SELECT avg(MPG) FROM cars_data WHERE Cylinders  =  "4"	car_1
SELECT avg(MPG) FROM cars_data WHERE Cylinders  =  "4"	car_1
SELECT min(weight) FROM cars_data WHERE Cylinders  =  8 AND YEAR  =  1974	car_1
SELECT min(weight) FROM cars_data WHERE YEAR  =  1974 AND Cylinders  =  8	car_1
SELECT maker ,  model FROM model_list	car_1
SELECT T1.Maker ,  T2.Model FROM car_makers AS T1 JOIN model_list AS T2 ON T1.id = T2.Maker	car_1
SELECT T1.countryname ,  T1.countryid FROM countries AS T1 JOIN car_makers AS T2 ON T1.countryid  =  T2.country GROUP BY T1.countryid HAVING count(*)  >=  1	car_1
SELECT T1.CountryName ,  T1.CountryId FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId  =  T2.Country GROUP BY T1.CountryId HAVING count(*)  >=  1	car_1
SELECT count(*) FROM cars_data WHERE horsepower  >  150	car_1
SELECT count(*) FROM cars_data WHERE horsepower  >  150	car_1
SELECT YEAR ,  avg(Weight) FROM cars_data GROUP BY YEAR	car_1
SELECT avg(weight) ,  YEAR FROM cars_data GROUP BY YEAR	car_1
SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId  =  T2.Country WHERE T1.continent  =  'Europe' GROUP BY T1.CountryName HAVING COUNT(*)  >=  3	car_1
SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId  =  T2.Country GROUP BY T1.CountryName HAVING COUNT(*)  >=  3	car_1
SELECT max(T1.Horsepower) ,  T2.Make FROM cars_data AS T1 JOIN car_names AS T2 ON T1.id  =  T2.MakeId WHERE T1.Cylinders  =  "3"	car_1
SELECT T1.Make ,  max(T1.Horsepower) FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId  =  T2.Id WHERE T2.Cylinders  =  "3"	car_1
SELECT T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId  =  T2.Id ORDER BY T2.MPG DESC LIMIT 1	car_1
SELECT T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId  =  T2.Id ORDER BY T2.MPG DESC LIMIT 1	car_1
SELECT avg(horsepower) FROM cars_data WHERE YEAR  <  1980	car_1
SELECT avg(horsepower) FROM cars_data WHERE YEAR  <  1980	car_1
SELECT avg(T1.Edispl) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.id  =  T2.makeid WHERE T2.model  =  'volvo'	car_1
SELECT avg(T1.Edispl) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.id  =  T2.makeid WHERE T2.Make  =  "VOLVO"	car_1
SELECT max(Accelerate) ,  Cylinders FROM cars_data GROUP BY Cylinders	car_1
SELECT max(Accelerate) ,  Cylinders FROM cars_data GROUP BY Cylinders	car_1
SELECT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.ModelID  =  T2.Model GROUP BY T1.Model ORDER BY count(*) DESC LIMIT 1	car_1
SELECT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.ModelID  =  T2.Model GROUP BY T1.Model ORDER BY count(*) DESC LIMIT 1	car_1
SELECT count(*) FROM cars_data WHERE Cylinders  >  4	car_1
SELECT count(*) FROM cars_data WHERE Cylinders  >  4	car_1
SELECT count(*) FROM cars_data WHERE YEAR  =  "1980"	car_1
SELECT count(*) FROM cars_data WHERE YEAR  =  "1980"	car_1
SELECT count(*) FROM car_makers AS T1 JOIN model_list AS T2 ON T1.id = T2.Maker WHERE T1.FullName = "American Motor Company"	car_1
SELECT count(*) FROM car_makers AS T1 JOIN model_list AS T2 ON T1.id = T2.Maker WHERE T1.maker = 'American Motor Company'	car_1
SELECT T1.FullName ,  T1.id FROM car_makers AS T1 JOIN model_list AS T2 ON T1.id  =  T2.Maker GROUP BY T1.id HAVING count(*)  >  3	car_1
SELECT T1.maker ,  T2.Modelid FROM car_makers AS T1 JOIN model_list AS T2 ON T1.id  =  T2.Maker GROUP BY T1.id HAVING count(*)  >  3	car_1
SELECT DISTINCT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model  =  T2.Model WHERE T2.Make  =  "General Motors" OR T2.Weight  >  3500	car_1
SELECT DISTINCT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model  =  T2.Model WHERE T2.Make  =  "General Motors" UNION SELECT DISTINCT T2.Model FROM cars_data AS T1 JOIN car_names AS T2 ON T1.id  =  T2.MakeId WHERE T1.Weight  >  3500	car_1
SELECT DISTINCT YEAR FROM cars_data WHERE weight BETWEEN 3000 AND 4000	car_1
SELECT DISTINCT YEAR FROM cars_data WHERE weight  <  4000 INTERSECT SELECT DISTINCT YEAR FROM cars_data WHERE weight  >  3000	car_1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1	car_1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1	car_1
SELECT T1.Cylinders FROM cars_data AS T1 JOIN car_names AS T2 ON T1.id  =  T2.makeid WHERE T2.model  =  'volvo' ORDER BY T1.accelerate LIMIT 1	car_1
SELECT T1.Cylinders FROM cars_data AS T1 JOIN car_names AS T2 ON T1.id  =  T2.makeid WHERE T2.model  =  'volvo' ORDER BY T1.accelerate LIMIT 1	car_1
SELECT count(*) FROM cars_data WHERE accelerate  >  (SELECT max(horsepower) FROM cars_data)	car_1
SELECT count(*) FROM cars_data WHERE accelerate  >  (SELECT max(horsepower) FROM cars_data)	car_1
SELECT count(*) FROM (SELECT T1.Continent ,  T2.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId  =  T2.Country GROUP BY T2.CountryName HAVING count(*)  >  2)	car_1
SELECT count(*) FROM (SELECT T1.Continent ,  T2.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId  =  T2.Country GROUP BY T1.Continent HAVING count(*)  >  2)	car_1
SELECT count(*) FROM cars_data WHERE Cylinders  >  6	car_1
SELECT count(*) FROM cars_data WHERE Cylinders  >  6	car_1
SELECT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model  =  T2.Model WHERE T2.Cylinders  =  4 ORDER BY T2.Horsepower DESC LIMIT 1	car_1
SELECT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model  =  T2.Model WHERE T2.Cylinders  =  4 ORDER BY T2.Horsepower DESC LIMIT 1	car_1
SELECT T1.makeid ,  T2.Make FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId  =  T2.id WHERE T2.Horsepower  >  (SELECT min(Horsepower) FROM cars_data) AND T2.Cylinders  <  4	car_1
SELECT T1.MakeId ,  T2.Make FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId  =  T2.Id WHERE T2.Horsepower != min(Horsepower) AND T2.Cylinders  <  4	car_1
SELECT max(MPG) FROM cars_data WHERE Cylinders  =  8 OR YEAR  <  1980	car_1
SELECT max(MPG) FROM cars_data WHERE Cylinders  =  8 OR YEAR  <  1980	car_1
SELECT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model  =  T2.Model WHERE T2.Make != 'Ford Motor Company' INTERSECT SELECT Model FROM cars_data WHERE Weight  <  3500	car_1
SELECT DISTINCT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model  =  T2.Model WHERE T2.Make != "Ford" AND T2.Weight < 3500	car_1
SELECT countryname FROM countries WHERE countryid NOT IN (SELECT country FROM car_makers)	car_1
SELECT CountryName FROM countries WHERE CountryID NOT IN (SELECT Country FROM car_makers)	car_1
SELECT maker ,  id FROM model_list GROUP BY maker HAVING count(*)  >=  2 INTERSECT SELECT maker ,  id FROM model_list GROUP BY maker HAVING count(*)  >  3	car_1
SELECT T1.id ,  T1.maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.id  =  T2.Maker GROUP BY T1.id HAVING count(*)  >=  2 INTERSECT SELECT maker ,  count(*) FROM car_names GROUP BY maker HAVING count(*)  >  3	car_1
SELECT T1.countryid ,  T1.countryname FROM countries AS T1 JOIN car_makers AS T2 ON T1.countryid  =  T2.country GROUP BY T1.countryid HAVING count(*)  >  3 UNION SELECT T1.countryid ,  T1.countryname FROM countries AS T1 JOIN car_makers AS T2 ON T1.countryid  =  T2.country JOIN model_list AS T3 ON T2.id  =  T3.maker WHERE T3.model  =  'fiat'	car_1
SELECT T1.Countryid ,  T1.countryname FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryID  =  T2.Country GROUP BY T1.Countryid HAVING count(*)  >  3 UNION SELECT T1.Countryid ,  T1.countryname FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryID  =  T2.Country JOIN model_list AS T3 ON T2.id  =  T3.Maker WHERE T3.model  =  'Fiat'	car_1
SELECT Country FROM airlines WHERE Airline  =  "JetBlue Airways"	flight_2
SELECT Country FROM airlines WHERE Airline  =  'JetBlue Airways'	flight_2
SELECT Abbreviation FROM airlines WHERE Airline  =  "JetBlue Airways"	flight_2
SELECT Abbreviation FROM airlines WHERE Airline  =  'JetBlue Airways'	flight_2
SELECT Airline ,  Abbreviation FROM airlines WHERE Country  =  'USA'	flight_2
SELECT Airline ,  Abbreviation FROM airlines WHERE Country  =  'USA'	flight_2
SELECT AirportCode ,  AirportName FROM airports WHERE City  =  'Anthony'	flight_2
SELECT AirportCode ,  AirportName FROM airports WHERE City  =  'Anthony'	flight_2
SELECT count(*) FROM airlines	flight_2
SELECT count(*) FROM airlines	flight_2
SELECT count(*) FROM airports	flight_2
SELECT count(*) FROM airports	flight_2
SELECT count(*) FROM flights	flight_2
SELECT count(*) FROM flights	flight_2
SELECT Airline FROM airlines WHERE Abbreviation  =  'UAL'	flight_2
SELECT Airline FROM airlines WHERE Abbreviation  =  'UAL'	flight_2
SELECT count(*) FROM airlines WHERE country  =  'USA'	flight_2
SELECT count(*) FROM airlines WHERE country  =  'USA'	flight_2
SELECT city ,  country FROM airports WHERE airportname  =  'Alton'	flight_2
SELECT city ,  country FROM airports WHERE airportname  =  'Alton'	flight_2
SELECT AirportName FROM airports WHERE AirportCode  =  'AKO'	flight_2
SELECT AirportName FROM airports WHERE AirportCode  =  'AKO'	flight_2
SELECT AirportName FROM airports WHERE City  =  'Aberdeen'	flight_2
SELECT AirportName FROM airports WHERE City  =  'Aberdeen'	flight_2
SELECT count(*) FROM flights WHERE SourceAirport  =  'APG'	flight_2
SELECT count(*) FROM flights WHERE sourceairport  =  'APG'	flight_2
SELECT count(*) FROM flights WHERE DestAirport  =  "ATO"	flight_2
SELECT count(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport  =  T2.AirportCode WHERE T2.AirportName  =  "ATO"	flight_2
SELECT count(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.SourceAirport WHERE T1.City  =  'Aberdeen'	flight_2
SELECT count(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.SourceAirport WHERE T1.City  =  'Aberdeen'	flight_2
SELECT count(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.DestAirport WHERE T1.City  =  'Aberdeen'	flight_2
SELECT count(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.DestAirport WHERE T1.City  =  'Aberdeen'	flight_2
SELECT count(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport  =  T2.AirportCode JOIN airports AS T3 ON T1.DestAirport  =  T3.AirportCode WHERE T2.City  =  'Aberdeen' AND T3.City  =  'Ashley'	flight_2
SELECT count(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport  =  T2.AirportCode WHERE T2.City  =  "Aberdeen" INTERSECT SELECT count(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport  =  T2.AirportCode WHERE T2.City  =  "Ashley"	flight_2
SELECT count(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid WHERE T2.Airline  =  'JetBlue Airways'	flight_2
SELECT count(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid WHERE T2.Airline  =  'JetBlue Airways'	flight_2
SELECT count(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid WHERE T1.DestAirport  =  'ASY' AND T2.Airline  =  'United Airlines'	flight_2
SELECT count(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport  =  T2.AirportCode JOIN airlines AS T3 ON T1.Airline  =  T3.uid WHERE T2.AirportCode  =  'ASY' AND T3.Airline  =  'United Airlines'	flight_2
SELECT count(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid WHERE T1.SourceAirport  =  'AHD' AND T2.Airline  =  'United Airlines'	flight_2
SELECT count(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport  =  T2.AirportCode JOIN airlines AS T3 ON T1.Airline  =  T3.uid WHERE T2.AirportName  =  "AHD Airport" AND T3.Airline  =  "United Airlines"	flight_2
SELECT count(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport  =  T2.AirportCode JOIN airlines AS T3 ON T1.Airline  =  T3.uid WHERE T2.City  =  'Aberdeen' AND T3.Airline  =  'United Airlines'	flight_2
SELECT count(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport  =  T2.AirportCode JOIN airlines AS T3 ON T1.Airline  =  T3.uid WHERE T2.City  =  'Aberdeen' AND T3.Airline  =  'United Airlines'	flight_2
SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.DestAirport GROUP BY T1.City ORDER BY count(*) DESC LIMIT 1	flight_2
SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.DestAirport GROUP BY T1.City ORDER BY count(*) DESC LIMIT 1	flight_2
SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.SourceAirport GROUP BY T1.City ORDER BY count(*) DESC LIMIT 1	flight_2
SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.SourceAirport GROUP BY T1.City ORDER BY count(*) DESC LIMIT 1	flight_2
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY count(*) DESC LIMIT 1	flight_2
SELECT sourceairport FROM flights GROUP BY sourceairport ORDER BY count(*) DESC LIMIT 1	flight_2
SELECT sourceairport FROM flights GROUP BY sourceairport ORDER BY count(*) LIMIT 1	flight_2
SELECT sourceairport FROM flights GROUP BY sourceairport ORDER BY count(*) LIMIT 1	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline GROUP BY T2.Airline ORDER BY count(*) DESC LIMIT 1	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline GROUP BY T1.Airline ORDER BY count(*) DESC LIMIT 1	flight_2
SELECT T1.Abbreviation ,  T1.Country FROM airlines AS T1 JOIN flights AS t2 ON T1.uid  =  T2.Airline GROUP BY T2.Airline ORDER BY count(*) LIMIT 1	flight_2
SELECT T1.Abbreviation ,  T1.Country FROM airlines AS T1 JOIN flights AS t2 ON T1.uid  =  T2.Airline GROUP BY T2.Airline ORDER BY count(*) LIMIT 1	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T2.SourceAirport  =  'AHD'	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T2.SourceAirport  =  "AHD"	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T2.DestAirport  =  'AHD'	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE DestAirport  =  "AHD"	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T2.SourceAirport  =  'APG' INTERSECT SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T2.SourceAirport  =  'CVO'	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T2.SourceAirport  =  'APG' INTERSECT SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T2.SourceAirport  =  'CVO'	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T2.SourceAirport  =  'CVO' EXCEPT SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T2.SourceAirport  =  'APG'	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline JOIN airports AS T3 ON T2.SourceAirport  =  T3.AirportCode WHERE T3.AirportCode  =  'CVO' EXCEPT SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline JOIN airports AS T3 ON T2.SourceAirport  =  T3.AirportCode WHERE T3.AirportCode  =  'APG'	flight_2
SELECT T2.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid GROUP BY T1.Airline HAVING count(*)  >=  10	flight_2
SELECT T2.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid GROUP BY T1.Airline HAVING count(*)  >=  10	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline GROUP BY T2.Airline HAVING count(*)  <  200	flight_2
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline GROUP BY T2.Airline HAVING count(*)  <  200	flight_2
SELECT T1.FlightNo FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid WHERE T2.Airline  =  "United Airlines"	flight_2
SELECT T1.FlightNo FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid WHERE T2.Airline  =  'United Airlines'	flight_2
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport  =  T2.AirportCode WHERE T2.AirportName  =  "APG"	flight_2
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport  =  T2.AirportCode WHERE T2.AirportName  =  'APG'	flight_2
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport  =  T2.AirportCode WHERE T2.AirportName  =  "APG"	flight_2
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport  =  T2.AirportCode WHERE T2.AirportName  =  'APG'	flight_2
SELECT T2.FlightNo FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.SourceAirport WHERE T1.City  =  "Aberdeen"	flight_2
SELECT T2.FlightNo FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.SourceAirport WHERE T1.City  =  'Aberdeen'	flight_2
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport  =  T2.AirportCode WHERE T2.City  =  "Aberdeen"	flight_2
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport  =  T2.AirportCode WHERE T2.City  =  'Aberdeen'	flight_2
SELECT count(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.DestAirport WHERE T1.City  =  'Aberdeen' OR T1.City  =  'Abilene'	flight_2
SELECT count(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.DestAirport WHERE T1.City  =  'Aberdeen' OR T1.City  =  'Abilene'	flight_2
SELECT airportname FROM airports WHERE airportcode NOT IN ( SELECT sourceairport FROM flights ) AND airportcode NOT IN ( SELECT destairport FROM flights )	flight_2
SELECT airportname FROM airports WHERE airportcode NOT IN (SELECT sourceairport FROM flights) AND airportcode NOT IN (SELECT destairport FROM flights)	flight_2
SELECT count(*) FROM employee	employee_hire_evaluation
SELECT count(*) FROM employee	employee_hire_evaluation
SELECT name FROM employee ORDER BY age ASC	employee_hire_evaluation
SELECT name FROM employee ORDER BY age ASC	employee_hire_evaluation
SELECT count(*) ,  city FROM employee GROUP BY city	employee_hire_evaluation
SELECT count(*) ,  city FROM employee GROUP BY city	employee_hire_evaluation
SELECT city FROM employee WHERE age  <  30 GROUP BY city HAVING count(*)  >  1	employee_hire_evaluation
SELECT city FROM employee WHERE age  <  30 GROUP BY city HAVING count(*)  >  1	employee_hire_evaluation
SELECT LOCATION ,  count(*) FROM shop GROUP BY LOCATION	employee_hire_evaluation
SELECT LOCATION ,  count(*) FROM shop GROUP BY LOCATION	employee_hire_evaluation
SELECT manager_name ,  district FROM shop ORDER BY number_products DESC LIMIT 1	employee_hire_evaluation
SELECT manager_name ,  district FROM shop ORDER BY number_products DESC LIMIT 1	employee_hire_evaluation
SELECT min(Number_products) ,  max(Number_products) FROM shop	employee_hire_evaluation
SELECT min(Number_products) ,  max(Number_products) FROM shop	employee_hire_evaluation
SELECT name ,  LOCATION ,  district FROM shop ORDER BY Number_products DESC	employee_hire_evaluation
SELECT name ,  LOCATION ,  district FROM shop ORDER BY Number_products DESC	employee_hire_evaluation
SELECT name FROM shop WHERE number_products  >  (SELECT avg(number_products) FROM shop)	employee_hire_evaluation
SELECT name FROM shop WHERE number_products  >  (SELECT avg(number_products) FROM shop)	employee_hire_evaluation
SELECT T1.name FROM employee AS T1 JOIN evaluation AS T2 ON T1.employee_id  =  T2.employee_id GROUP BY T2.employee_id ORDER BY count(*) DESC LIMIT 1	employee_hire_evaluation
SELECT T1.name FROM employee AS T1 JOIN evaluation AS T2 ON T1.employee_id  =  T2.employee_id GROUP BY T2.employee_id ORDER BY count(*) DESC LIMIT 1	employee_hire_evaluation
SELECT T1.name FROM employee AS T1 JOIN evaluation AS T2 ON T1.employee_id  =  T2.employee_id ORDER BY T2.bonus DESC LIMIT 1	employee_hire_evaluation
SELECT T1.name FROM employee AS T1 JOIN evaluation AS T2 ON T1.employee_id  =  T2.employee_id ORDER BY T2.bonus DESC LIMIT 1	employee_hire_evaluation
SELECT name FROM employee EXCEPT SELECT T1.name FROM employee AS T1 JOIN evaluation AS T2 ON T1.employee_id  =  T2.employee_id	employee_hire_evaluation
SELECT name FROM employee WHERE employee_id NOT IN (SELECT employee_id FROM evaluation)	employee_hire_evaluation
SELECT T2.name FROM hiring AS T1 JOIN shop AS T2 ON T1.shop_id  =  T2.shop_id GROUP BY T1.shop_id ORDER BY count(*) DESC LIMIT 1	employee_hire_evaluation
SELECT T2.name FROM hiring AS T1 JOIN shop AS T2 ON T1.shop_id  =  T2.shop_id GROUP BY T1.shop_id ORDER BY count(*) DESC LIMIT 1	employee_hire_evaluation
SELECT name FROM shop WHERE shop_id NOT IN (SELECT shop_id FROM hiring)	employee_hire_evaluation
SELECT name FROM shop WHERE shop_id NOT IN (SELECT shop_id FROM hiring)	employee_hire_evaluation
SELECT count(*) ,  T1.name FROM shop AS T1 JOIN hiring AS T2 ON T1.shop_id  =  T2.shop_id GROUP BY T2.shop_id	employee_hire_evaluation
SELECT count(*) ,  T1.name FROM shop AS T1 JOIN hiring AS T2 ON T1.shop_id  =  T2.shop_id GROUP BY T1.shop_id	employee_hire_evaluation
SELECT sum(bonus) FROM evaluation	employee_hire_evaluation
SELECT sum(bonus) FROM evaluation	employee_hire_evaluation
SELECT * FROM hiring	employee_hire_evaluation
SELECT * FROM hiring	employee_hire_evaluation
SELECT district FROM shop WHERE number_products  <  3000 INTERSECT SELECT district FROM shop WHERE number_products  >  10000	employee_hire_evaluation
SELECT district FROM shop WHERE number_products  <  3000 INTERSECT SELECT district FROM shop WHERE number_products  >  10000	employee_hire_evaluation
SELECT count(DISTINCT LOCATION) FROM shop	employee_hire_evaluation
SELECT count(DISTINCT LOCATION) FROM shop	employee_hire_evaluation
SELECT count(*) FROM Documents	cre_Doc_Template_Mgt
SELECT count(*) FROM Documents	cre_Doc_Template_Mgt
SELECT document_id ,  document_name ,  document_description FROM Documents	cre_Doc_Template_Mgt
SELECT document_id ,  document_name ,  document_description FROM Documents	cre_Doc_Template_Mgt
SELECT document_name ,  template_id FROM documents WHERE document_description LIKE "%w%"	cre_Doc_Template_Mgt
SELECT document_name ,  template_id FROM Documents WHERE document_description LIKE "%w%"	cre_Doc_Template_Mgt
SELECT document_id ,  template_id ,  document_description FROM documents WHERE document_name  =  "Robbin CV"	cre_Doc_Template_Mgt
SELECT document_id ,  template_id ,  document_description FROM Documents WHERE document_name  =  "Robbin CV"	cre_Doc_Template_Mgt
SELECT count(DISTINCT template_id) FROM documents	cre_Doc_Template_Mgt
SELECT count(DISTINCT template_id) FROM Documents	cre_Doc_Template_Mgt
SELECT count(*) FROM templates AS t JOIN documents AS d ON t.template_id  =  d.template_id WHERE t.template_type_code  =  "PPT"	cre_Doc_Template_Mgt
SELECT count(*) FROM templates AS t1 JOIN documents AS t2 ON t1.template_id  =  t2.template_id WHERE t1.template_type_code  =  "PPT"	cre_Doc_Template_Mgt
SELECT template_id ,  count(*) FROM Documents GROUP BY template_id	cre_Doc_Template_Mgt
SELECT template_id ,  count(*) FROM Documents GROUP BY template_id	cre_Doc_Template_Mgt
SELECT T1.template_id ,  T1.template_type_code FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id  =  T2.template_id GROUP BY T1.template_id ORDER BY count(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT T1.template_id ,  T1.template_type_code FROM Templates AS T1 JOIN Documents AS T2 ON T1.template_id  =  T2.template_id GROUP BY T1.template_id ORDER BY count(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT T1.template_id FROM documents AS T1 JOIN paragraphs AS T2 ON T1.document_id  =  T2.document_id GROUP BY T1.template_id HAVING count(*)  >  1	cre_Doc_Template_Mgt
SELECT T1.template_id FROM documents AS T1 JOIN paragraphs AS T2 ON T1.document_id  =  T2.document_id GROUP BY T1.template_id HAVING count(*)  >  1	cre_Doc_Template_Mgt
SELECT template_id FROM templates EXCEPT SELECT template_id FROM documents	cre_Doc_Template_Mgt
SELECT template_id FROM templates EXCEPT SELECT template_id FROM Documents	cre_Doc_Template_Mgt
SELECT count(*) FROM Templates	cre_Doc_Template_Mgt
SELECT count(*) FROM Templates	cre_Doc_Template_Mgt
SELECT template_id ,  version_number ,  template_type_code FROM Templates	cre_Doc_Template_Mgt
SELECT template_id ,  version_number ,  template_type_code FROM templates	cre_Doc_Template_Mgt
SELECT DISTINCT Template_Type_Code FROM Templates	cre_Doc_Template_Mgt
SELECT DISTINCT template_type_code FROM templates	cre_Doc_Template_Mgt
SELECT template_id FROM templates WHERE template_type_code  =  "PP" OR template_type_code  =  "PPT"	cre_Doc_Template_Mgt
SELECT template_id FROM templates WHERE template_type_code  =  "PP" OR template_type_code  =  "PPT"	cre_Doc_Template_Mgt
SELECT count(*) FROM Templates WHERE Template_Type_Code  =  "CV"	cre_Doc_Template_Mgt
SELECT count(*) FROM Templates WHERE template_type_code  =  "CV"	cre_Doc_Template_Mgt
SELECT version_number ,  template_type_code FROM Templates WHERE version_number  >  5	cre_Doc_Template_Mgt
SELECT version_number ,  template_type_code FROM Templates WHERE version_number  >  5	cre_Doc_Template_Mgt
SELECT template_type_code ,  count(*) FROM Templates GROUP BY template_type_code	cre_Doc_Template_Mgt
SELECT template_type_code ,  count(*) FROM Templates GROUP BY template_type_code	cre_Doc_Template_Mgt
SELECT template_type_code FROM Templates GROUP BY template_type_code ORDER BY count(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT template_type_code FROM templates GROUP BY template_type_code ORDER BY count(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT template_type_code FROM templates GROUP BY template_type_code HAVING count(*)  <  3	cre_Doc_Template_Mgt
SELECT template_type_code FROM templates GROUP BY template_type_code HAVING count(*)  <  3	cre_Doc_Template_Mgt
SELECT min(Version_Number) ,  Template_Type_Code FROM Templates GROUP BY Template_Type_Code	cre_Doc_Template_Mgt
SELECT min(Version_Number) ,  Template_Type_Code FROM Templates GROUP BY Template_Type_Code	cre_Doc_Template_Mgt
SELECT T1.template_type_code FROM templates AS T1 JOIN documents AS T2 ON T1.template_id  =  T2.template_id WHERE T2.document_name  =  "Data base"	cre_Doc_Template_Mgt
SELECT T1.template_type_code FROM templates AS T1 JOIN documents AS T2 ON T1.template_id  =  T2.template_id WHERE T2.document_name  =  "Data base"	cre_Doc_Template_Mgt
SELECT T2.document_name FROM templates AS T1 JOIN documents AS T2 ON T1.template_id  =  T2.template_id WHERE T1.template_type_code  =  "BK"	cre_Doc_Template_Mgt
SELECT T1.document_name FROM Documents AS T1 JOIN Templates AS T2 ON T1.template_id  =  T2.template_id WHERE T2.template_type_code  =  "BK"	cre_Doc_Template_Mgt
SELECT T2.template_type_code ,  count(*) FROM Documents AS T1 JOIN templates AS T2 ON T1.template_id  =  T2.template_id GROUP BY T2.template_type_code	cre_Doc_Template_Mgt
SELECT T1.template_type_code ,  count(*) FROM templates AS T1 JOIN documents AS T2 ON T1.template_id  =  T2.template_id GROUP BY T1.template_type_code	cre_Doc_Template_Mgt
SELECT template_type_code FROM templates AS T1 JOIN documents AS T2 ON T1.template_id  =  T2.template_id GROUP BY template_type_code ORDER BY count(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT template_type_code FROM templates AS T1 JOIN documents AS T2 ON T1.template_id  =  T2.template_id GROUP BY template_type_code ORDER BY count(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT template_type_code FROM Ref_template_types EXCEPT SELECT template_type_code FROM templates AS t1 JOIN documents AS t2 ON t1.template_id  =  t2.template_id	cre_Doc_Template_Mgt
SELECT template_type_code FROM Ref_template_types EXCEPT SELECT template_type_code FROM templates AS t1 JOIN documents AS t2 ON t1.template_id  =  t2.template_id	cre_Doc_Template_Mgt
SELECT template_type_code ,  template_type_description FROM Ref_template_types	cre_Doc_Template_Mgt
SELECT template_type_code ,  template_type_description FROM Ref_template_types	cre_Doc_Template_Mgt
SELECT template_type_description FROM Ref_template_types WHERE template_type_code  =  "AD"	cre_Doc_Template_Mgt
SELECT template_type_description FROM Ref_template_types WHERE template_type_code  =  "AD"	cre_Doc_Template_Mgt
SELECT template_type_code FROM Ref_template_types WHERE template_type_description  =  "Book"	cre_Doc_Template_Mgt
SELECT template_type_code FROM Ref_template_types WHERE template_type_description  =  "Book"	cre_Doc_Template_Mgt
SELECT DISTINCT T2.template_type_description FROM templates AS T1 JOIN ref_template_types AS T2 ON T1.template_type_code  =  T2.template_type_code JOIN documents AS T3 ON T1.template_id  =  T3.template_id	cre_Doc_Template_Mgt
SELECT DISTINCT T1.template_description FROM documents AS T1 JOIN templates AS T2 ON T1.template_id  =  T2.template_id	cre_Doc_Template_Mgt
SELECT T1.template_id FROM templates AS T1 JOIN Ref_template_types AS T2 ON T1.template_type_code  =  T2.template_type_code WHERE T2.template_type_description  =  "Presentation"	cre_Doc_Template_Mgt
SELECT template_id FROM documents WHERE document_name  =  "Presentation"	cre_Doc_Template_Mgt
SELECT count(*) FROM Paragraphs	cre_Doc_Template_Mgt
SELECT count(*) FROM Paragraphs	cre_Doc_Template_Mgt
SELECT count(*) FROM documents AS T1 JOIN paragraphs AS T2 ON T1.document_id  =  T2.document_id WHERE T1.document_name  =  "Summer Show"	cre_Doc_Template_Mgt
SELECT count(*) FROM documents AS t1 JOIN paragraphs AS t2 ON t1.document_id  =  t2.document_id WHERE t1.document_name  =  "Summer Show"	cre_Doc_Template_Mgt
SELECT other_details FROM Paragraphs WHERE paragraph_text  =  "Korea "	cre_Doc_Template_Mgt
SELECT other_details FROM Paragraphs WHERE paragraph_text LIKE "%Korea %"	cre_Doc_Template_Mgt
SELECT T1.paragraph_id ,  T1.paragraph_text FROM paragraphs AS T1 JOIN documents AS T2 ON T1.document_id  =  T2.document_id WHERE T2.document_name  =  "Welcome to NY"	cre_Doc_Template_Mgt
SELECT T1.paragraph_id ,  T1.paragraph_text FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id  =  T2.document_id WHERE T2.document_name  =  "Welcome to NY"	cre_Doc_Template_Mgt
SELECT t2.paragraph_text FROM documents AS t1 JOIN paragraphs AS t2 ON t1.document_id  =  t2.document_id WHERE t1.document_name  =  "Customer reviews"	cre_Doc_Template_Mgt
SELECT t2.paragraph_text FROM documents AS t1 JOIN paragraphs AS t2 ON t1.document_id  =  t2.document_id WHERE t1.document_name  =  "Customer reviews"	cre_Doc_Template_Mgt
SELECT document_id ,  count(*) FROM Paragraphs GROUP BY document_id ORDER BY document_id	cre_Doc_Template_Mgt
SELECT document_id ,  count(*) FROM Paragraphs GROUP BY document_id ORDER BY document_id	cre_Doc_Template_Mgt
SELECT T1.document_id ,  T1.document_name ,  count(*) FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.document_id  =  T2.document_id GROUP BY T1.document_id	cre_Doc_Template_Mgt
SELECT T1.document_id ,  T2.document_name ,  count(*) FROM paragraphs AS T1 JOIN documents AS T2 ON T1.document_id  =  T2.document_id GROUP BY T1.document_id	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*)  >=  2	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*)  >=  2	cre_Doc_Template_Mgt
SELECT T1.document_id ,  T2.document_name FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.document_id  =  T2.document_id GROUP BY T1.document_id ORDER BY count(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT T1.document_id ,  T2.document_name FROM documents AS T1 JOIN templates AS T2 ON T1.template_id  =  T2.template_id JOIN paragraphs AS T3 ON T1.document_id  =  T3.document_id GROUP BY T1.document_id ORDER BY count(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT document_id FROM paragraphs GROUP BY document_id ORDER BY count(*) ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT document_id FROM paragraphs GROUP BY document_id ORDER BY count(*) ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs GROUP BY document_id HAVING count(*) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT document_id FROM paragraphs WHERE paragraph_text  =  'Brazil' INTERSECT SELECT document_id FROM paragraphs WHERE paragraph_text  =  'Ireland'	cre_Doc_Template_Mgt
SELECT document_id FROM paragraphs WHERE paragraph_text  =  'Brazil' INTERSECT SELECT document_id FROM paragraphs WHERE paragraph_text  =  'Ireland'	cre_Doc_Template_Mgt
SELECT count(*) FROM teacher	course_teach
SELECT count(*) FROM teacher	course_teach
SELECT name FROM teacher ORDER BY age ASC	course_teach
SELECT name FROM teacher ORDER BY age ASC	course_teach
SELECT age ,  hometown FROM teacher	course_teach
SELECT age ,  hometown FROM teacher	course_teach
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'	course_teach
SELECT name FROM teacher WHERE Hometown != 'Little Lever Urban District'	course_teach
SELECT Name FROM teacher WHERE Age  =  32 OR Age  =  33	course_teach
SELECT name FROM teacher WHERE age  =  32 OR age  =  33	course_teach
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1	course_teach
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1	course_teach
SELECT Hometown ,  COUNT(*) FROM teacher GROUP BY Hometown	course_teach
SELECT count(*) ,  Hometown FROM teacher GROUP BY Hometown	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*)  >=  2	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*)  >=  2	course_teach
SELECT T2.Name ,  T3.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN course AS T3 ON T1.course_id  =  T3.course_id	course_teach
SELECT T2.Name ,  T3.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN course AS T3 ON T1.course_id  =  T3.course_id	course_teach
SELECT T2.Name ,  T3.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN course AS T3 ON T1.course_id  =  T3.course_id ORDER BY T2.Name ASC	course_teach
SELECT T2.Name ,  T3.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN course AS T3 ON T1.course_id  =  T3.course_id ORDER BY T2.Name ASC	course_teach
SELECT T3.Name FROM course AS T1 JOIN course_arrange AS T2 ON T1.Course_ID  =  T2.Course_ID JOIN teacher AS T3 ON T2.teacher_id  =  T3.teacher_id WHERE T1.course  =  'math'	course_teach
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN course AS T3 ON T1.course_id  =  T3.course_id WHERE T3.course  =  'Math'	course_teach
SELECT T2.Name ,  COUNT(*) FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T2.Name	course_teach
SELECT T2.Name ,  COUNT(*) FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T2.Name	course_teach
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.teacher_id HAVING COUNT(*)  >=  2	course_teach
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.teacher_id HAVING COUNT(*)  >=  2	course_teach
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)	course_teach
SELECT name FROM teacher WHERE teacher_id NOT IN (SELECT teacher_id FROM course_arrange)	course_teach
SELECT count(*) FROM visitor WHERE age  <  30	museum_visit
SELECT name FROM visitor WHERE LEVEL_of_membership  >  4 ORDER BY LEVEL_of_membership DESC	museum_visit
SELECT avg(age) FROM visitor WHERE LEVEL_of_membership  <=  4	museum_visit
SELECT name ,  LEVEL_of_membership FROM visitor WHERE LEVEL_of_membership  >  4 ORDER BY age DESC	museum_visit
SELECT museum_id ,  name FROM museum ORDER BY num_of_staff DESC LIMIT 1	museum_visit
SELECT avg(Num_of_Staff) FROM museum WHERE Open_Year  <  2009	museum_visit
SELECT open_year ,  num_of_staff FROM museum WHERE name  =  'Plaza Museum'	museum_visit
SELECT name FROM museum WHERE num_of_staff  >  (select min(num_of_staff) from museum where open_year  >  2010)	museum_visit
SELECT T1.id ,  T1.name ,  T1.age FROM visitor AS T1 JOIN visit AS T2 ON T1.id  =  T2.visitor_id GROUP BY T1.id HAVING count(*)  >  1	museum_visit
SELECT T1.id ,  T1.Name ,  T1.Level_of_membership FROM visitor AS T1 JOIN visit AS T2 ON T1.id  =  T2.visitor_id GROUP BY T2.visitor_id ORDER BY sum(T2.total_spent) DESC LIMIT 1	museum_visit
SELECT T2.name ,  T1.museum_id FROM visit AS T1 JOIN museum AS T2 ON T1.museum_id  =  T2.museum_id GROUP BY T1.museum_id ORDER BY count(*) DESC LIMIT 1	museum_visit
SELECT name FROM museum WHERE museum_id NOT IN (SELECT museum_id FROM visit)	museum_visit
SELECT T1.Name ,  T1.Age FROM visitor AS T1 JOIN visit AS T2 ON T1.ID  =  T2.visitor_ID GROUP BY T2.visitor_ID ORDER BY sum(T2.Num_of_Ticket) DESC LIMIT 1	museum_visit
SELECT avg(Num_of_Ticket) ,  max(Num_of_Ticket) FROM visit	museum_visit
SELECT sum(Total_spent) FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_ID  =  T2.ID WHERE T2.Level_of_membership  =  1	museum_visit
SELECT T3.Name FROM visit AS T1 JOIN museum AS T2 ON T1.Museum_ID  =  T2.Museum_ID JOIN visitor AS T3 ON T1.visitor_ID  =  T3.ID WHERE T2.open_year  <  2009 INTERSECT SELECT T3.Name FROM visit AS T1 JOIN museum AS T2 ON T1.Museum_ID  =  T2.Museum_ID JOIN visitor AS T3 ON T1.visitor_ID  =  T3.ID WHERE T2.open_year  >  2011	museum_visit
SELECT count(*) FROM visitor WHERE id NOT IN( SELECT T1.visitor_id FROM visit AS T1 JOIN museum AS T2 ON T1.museum_id  =  T2.museum_id WHERE T2.open_year  >  2010 )	museum_visit
SELECT count(*) FROM museum WHERE open_year  >  2013 OR open_year  <  2008	museum_visit
SELECT count(*) FROM players	wta_1
SELECT count(*) FROM players	wta_1
SELECT count(*) FROM matches	wta_1
SELECT count(*) FROM matches	wta_1
SELECT first_name ,  birth_date FROM players WHERE country_code = 'USA'	wta_1
SELECT first_name ,  birth_date FROM players WHERE country_code = 'USA'	wta_1
SELECT avg(loser_age) ,  avg(winner_age) FROM matches	wta_1
SELECT avg(loser_age) ,  avg(winner_age) FROM matches	wta_1
SELECT avg(winner_rank) FROM matches	wta_1
SELECT avg(winner_rank) FROM matches	wta_1
SELECT max(loser_rank) FROM matches	wta_1
SELECT min(loser_rank) FROM matches	wta_1
SELECT count(DISTINCT country_code) FROM players	wta_1
SELECT count(DISTINCT country_code) FROM players	wta_1
SELECT count(DISTINCT loser_name) FROM matches	wta_1
SELECT count(DISTINCT loser_name) FROM matches	wta_1
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(*)  >  10	wta_1
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(*)  >  10	wta_1
SELECT T1.first_name ,  T1.last_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.year  =  2013 INTERSECT SELECT T1.first_name ,  T1.last_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.year  =  2016	wta_1
SELECT T1.first_name ,  T1.last_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.year = 2013 INTERSECT SELECT T1.first_name ,  T1.last_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.year = 2016	wta_1
SELECT count(*) FROM matches WHERE YEAR  =  2013 OR YEAR  =  2016	wta_1
SELECT count(*) FROM matches WHERE YEAR  =  2013 OR YEAR  =  2016	wta_1
SELECT T1.country_code ,  T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  'WTA Championships' INTERSECT SELECT T1.country_code ,   T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  'Australian Open'	wta_1
SELECT T1.first_name ,  T1.country_code FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  'WTA Championships' INTERSECT SELECT T1.first_name ,   T1.country_code FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  'Australian Open'	wta_1
SELECT first_name ,  country_code FROM players ORDER BY birth_date LIMIT 1	wta_1
SELECT first_name ,  country_code FROM players ORDER BY birth_date LIMIT 1	wta_1
SELECT first_name ,  last_name FROM players ORDER BY birth_date	wta_1
SELECT first_name ,  last_name FROM players ORDER BY birth_date	wta_1
SELECT first_name ,  last_name FROM players WHERE hand = 'L' ORDER BY birth_date	wta_1
SELECT first_name ,  last_name FROM players WHERE hand = "L" ORDER BY birth_date	wta_1
SELECT T1.first_name ,  T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY T2.player_id ORDER BY count(*) DESC LIMIT 1	wta_1
SELECT T1.first_name ,  T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY T2.player_id ORDER BY count(*) DESC LIMIT 1	wta_1
SELECT YEAR FROM matches GROUP BY YEAR ORDER BY count(*) DESC LIMIT 1	wta_1
SELECT YEAR FROM matches GROUP BY YEAR ORDER BY count(*) DESC LIMIT 1	wta_1
SELECT T1.winner_name ,  T1.winner_rank_points FROM matches AS T1 JOIN players AS T2 ON T1.winner_id  =  T2.player_id GROUP BY T1.winner_name ORDER BY count(*) DESC LIMIT 1	wta_1
SELECT T1.first_name ,  T1.last_name ,  sum(T2.ranking_points) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY T1.player_id ORDER BY count(*) DESC LIMIT 1	wta_1
SELECT T1.first_name ,  T1.last_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  'Australian Open' ORDER BY T1.rank_points DESC LIMIT 1	wta_1
SELECT T1.first_name ,  T1.last_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  'Australian Open' ORDER BY T1.ranking_points DESC LIMIT 1	wta_1
SELECT winner_name ,  loser_name FROM matches ORDER BY minutes DESC LIMIT 1	wta_1
SELECT T1.winner_name ,  T1.loser_name FROM matches AS T1 JOIN players AS T2 ON T1.winner_id  =  T2.player_id JOIN players AS T3 ON T1.loser_id  =  T3.player_id ORDER BY T1.minutes DESC LIMIT 1	wta_1
SELECT avg(T1.ranking) ,  T2.first_name FROM rankings AS T1 JOIN players AS T2 ON T1.player_id  =  T2.player_id GROUP BY T2.first_name	wta_1
SELECT T1.first_name ,  avg(T2.ranking) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY T1.first_name	wta_1
SELECT sum(T1.ranking_points) ,  T2.first_name FROM rankings AS T1 JOIN players AS T2 ON T1.player_id  =  T2.player_id GROUP BY T2.first_name	wta_1
SELECT T1.first_name ,  sum(T2.ranking_points) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY T1.player_id	wta_1
SELECT count(*) ,  country_code FROM players GROUP BY country_code	wta_1
SELECT count(*) ,  country_code FROM players GROUP BY country_code	wta_1
SELECT country_code FROM players GROUP BY country_code ORDER BY count(*) DESC LIMIT 1	wta_1
SELECT country_code FROM players GROUP BY country_code ORDER BY count(*) DESC LIMIT 1	wta_1
SELECT country_code FROM players GROUP BY country_code HAVING count(*)  >  50	wta_1
SELECT country_code FROM players GROUP BY country_code HAVING count(*)  >  50	wta_1
SELECT sum(tours) ,  ranking_date FROM rankings GROUP BY ranking_date	wta_1
SELECT sum(tours) ,  ranking_date FROM rankings GROUP BY ranking_date	wta_1
SELECT count(*) ,  YEAR FROM matches GROUP BY YEAR	wta_1
SELECT count(*) ,  YEAR FROM matches GROUP BY YEAR	wta_1
SELECT T1.first_name ,  T1.last_name ,  T1.rank FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id ORDER BY T2.winner_age LIMIT 3	wta_1
SELECT T1.first_name ,  T1.last_name ,  T2.ranking FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id WHERE T2.ranking  =  (SELECT min(ranking) FROM rankings) LIMIT 3	wta_1
SELECT count(DISTINCT T1.player_id) FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  'WTA Championships' AND T1.hand  =  'L'	wta_1
SELECT count(*) FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T1.hand  =  'L' AND T2.tourney_name  =  'WTA Championships'	wta_1
SELECT T1.first_name ,  T1.country_code ,  T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id ORDER BY T2.winner_rank_points DESC LIMIT 1	wta_1
SELECT T1.first_name ,  T1.country_code ,  T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id GROUP BY T2.winner_id ORDER BY sum(T2.winner_rank_points) DESC LIMIT 1	wta_1
SELECT count(*) ,  hand FROM players GROUP BY hand	wta_1
SELECT count(*) ,  hand FROM players GROUP BY hand	wta_1
SELECT count(*) FROM ship WHERE disposition_of_ship = "Captured";	battle_death
SELECT name ,  tonnage FROM ship ORDER BY name DESC	battle_death
SELECT name ,  date ,  result FROM battle	battle_death
SELECT max(killed) ,  min(killed) FROM death	battle_death
SELECT avg(injured) FROM death	battle_death
SELECT T1.killed ,  T1.injured FROM death AS T1 JOIN ship AS T2 ON T1.caused_by_ship_id  =  T2.id WHERE T2.tonnage  =  't'	battle_death
SELECT name ,  RESULT FROM battle WHERE bulgarian_commander != 'Boril'	battle_death
SELECT DISTINCT T1.id ,  T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.ship_type = "Brig"	battle_death
SELECT T2.id ,  T2.name FROM death AS T1 JOIN battle AS T2 ON T1.caused_by_ship_id  =  T2.id GROUP BY T1.caused_by_ship_id HAVING sum(T1.killed)  >  10	battle_death
SELECT T1.id ,  T1.name FROM ship AS T1 JOIN death AS T2 ON T1.id  =  T2.caused_by_ship_id GROUP BY T1.id ORDER BY sum(T2.injured) DESC LIMIT 1	battle_death
SELECT DISTINCT name FROM battle WHERE bulgarian_commander  =  'Kaloyan' AND latin_commander  =  'Baldwin I'	battle_death
SELECT count(DISTINCT result) FROM battle	battle_death
SELECT count(*) FROM battle WHERE id NOT IN ( SELECT lost_in_battle FROM ship WHERE tonnage  =  '225' )	battle_death
SELECT T1.name ,  T1.date FROM battle AS T1 JOIN ship AS T2 ON T1.id  =  T2.lost_in_battle WHERE T2.name  =  'Lettice' INTERSECT SELECT T1.name ,   T1.date FROM battle AS T1 JOIN ship AS T2 ON T1.id  =  T2.lost_in_battle WHERE T2.name  =  'HMS Atalanta'	battle_death
SELECT T1.name ,  T1.result ,  T1.bulgarian_commander FROM battle AS T1 JOIN ship AS T2 ON T1.id  =  T2.lost_in_battle WHERE T2.location != 'English Channel' GROUP BY T1.id HAVING sum(T2.lost_in_battle)  =  0	battle_death
SELECT note FROM death WHERE note LIKE '%East%'	battle_death
SELECT line_1 ,  line_2 FROM addresses	student_transcripts_tracking
SELECT line_1 ,  line_2 FROM addresses	student_transcripts_tracking
SELECT count(*) FROM COURSES	student_transcripts_tracking
SELECT count(*) FROM COURSES	student_transcripts_tracking
SELECT course_description FROM courses WHERE course_name  =  "Math"	student_transcripts_tracking
SELECT course_description FROM COURSES WHERE course_name LIKE "%Math%"	student_transcripts_tracking
SELECT zip_postcode FROM addresses WHERE city  =  "Port Chelsea"	student_transcripts_tracking
SELECT zip_postcode FROM addresses WHERE city  =  "Port Chelsea"	student_transcripts_tracking
SELECT T1.department_name ,  T1.department_id FROM DEPARTMENTS AS T1 JOIN Degree_Programs AS T2 ON T1.department_id  =  T2.department_id GROUP BY T1.department_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.department_name ,  T2.department_id FROM DEPARTMENTS AS T1 JOIN Degree_Programs AS T2 ON T1.department_id  =  T2.department_id GROUP BY T2.department_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT count(DISTINCT department_id) FROM degree_programs	student_transcripts_tracking
SELECT count(DISTINCT department_id) FROM degree_programs	student_transcripts_tracking
SELECT count(DISTINCT degree_summary_name) FROM degree_programs	student_transcripts_tracking
SELECT count(DISTINCT degree_summary_name) FROM degree_programs	student_transcripts_tracking
SELECT count(*) FROM departments AS T1 JOIN degree_programs AS T2 ON T1.department_id = T2.department_id WHERE T1.department_name = "Engineering"	student_transcripts_tracking
SELECT count(*) FROM departments AS T1 JOIN degree_programs AS T2 ON T1.department_id = T2.department_id WHERE T1.department_name = "Engineering"	student_transcripts_tracking
SELECT section_name ,  section_description FROM SECTIONS	student_transcripts_tracking
SELECT section_name ,  section_description FROM SECTIONS	student_transcripts_tracking
SELECT T1.course_name ,  T1.course_id FROM Courses AS T1 JOIN SECTIONS AS T2 ON T1.course_id  =  T2.course_id GROUP BY T1.course_id HAVING count(*)  <=  2	student_transcripts_tracking
SELECT T1.course_name ,  T1.course_id FROM Courses AS T1 JOIN SECTIONS AS T2 ON T1.course_id  =  T2.course_id GROUP BY T1.course_id HAVING count(*)  <  2	student_transcripts_tracking
SELECT section_name FROM sections ORDER BY section_name DESC	student_transcripts_tracking
SELECT section_name FROM SECTION ORDER BY section_name DESC	student_transcripts_tracking
SELECT T1.semester_name ,  T1.semester_id FROM semesters AS T1 JOIN student_enrolment AS T2 ON T1.semester_id  =  T2.semester_id GROUP BY T1.semester_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.semester_name ,  T1.semester_id FROM SEMESTERS AS T1 JOIN STUDENT_ENROLMENT AS T2 ON T1.semester_id  =  T2.semester_id GROUP BY T1.semester_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT department_description FROM DEPARTMENTS WHERE department_name LIKE "%computer%"	student_transcripts_tracking
SELECT department_description FROM DEPARTMENTS WHERE department_name LIKE "%computer%"	student_transcripts_tracking
SELECT T1.first_name ,  T1.middle_name ,  T1.last_name ,  T1.student_id FROM students AS T1 JOIN student_enrolment AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2	student_transcripts_tracking
SELECT T1.first_name ,  T1.middle_name ,  T1.last_name ,  T1.student_id FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2	student_transcripts_tracking
SELECT T1.first_name ,  T1.middle_name ,  T1.last_name FROM students AS T1 JOIN student_enrolment AS T2 ON T1.student_id  =  T2.student_id JOIN degree_programs AS T3 ON T2.degree_program_id  =  T3.degree_program_id WHERE T3.degree_summary_name  =  "Bachelor"	student_transcripts_tracking
SELECT T1.first_name ,  T1.middle_name ,  T1.last_name FROM students AS T1 JOIN student_enrolment AS T2 ON T1.student_id  =  T2.student_id JOIN degree_programs AS T3 ON T2.degree_program_id  =  T3.degree_program_id WHERE T3.degree_summary_name  =  "Bachelors"	student_transcripts_tracking
SELECT T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_summary_name ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_summary_name ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.degree_program_id ,  T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id  =  T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.degree_program_id ,  T2.degree_summary_name FROM Student_Enrolment AS T1 JOIN Degree_Programs AS T2 ON T1.degree_program_id  =  T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.student_id ,  T1.first_name ,  T1.middle_name ,  T1.last_name ,  count(*) FROM students AS T1 JOIN student_enrolment AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.first_name ,  T1.middle_name ,  T1.last_name ,  T1.student_id ,  count(*) FROM students AS T1 JOIN student_enrolment AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT semester_name FROM semesters WHERE semester_id NOT IN ( SELECT semester_id FROM student_enrolment )	student_transcripts_tracking
SELECT semester_name FROM semesters WHERE semester_id NOT IN ( SELECT semester_id FROM student_enrolment )	student_transcripts_tracking
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id	student_transcripts_tracking
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id	student_transcripts_tracking
SELECT T1.course_name FROM courses AS T1 JOIN sections AS T2 ON T1.course_id  =  T2.course_id JOIN student_enrolment_courses AS T3 ON T2.section_id  =  T3.course_id GROUP BY T1.course_name ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.course_name FROM courses AS T1 JOIN sections AS T2 ON T1.course_id  =  T2.course_id JOIN student_enrolment_courses AS T3 ON T2.section_id  =  T3.student_enrolment_courses_id GROUP BY T1.course_name ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.last_name FROM students AS T1 JOIN addresses AS T2 ON T1.current_address_id = T2.address_id WHERE T2.state_province_county = "North Carolina" EXCEPT SELECT T4.last_name FROM students AS T3 JOIN student_enrolment AS T4 ON T3.student_id = T4.student_id	student_transcripts_tracking
SELECT T1.last_name FROM students AS T1 JOIN addresses AS T2 ON T1.current_address_id = T2.address_id WHERE T2.state_province_county = "North Carolina" EXCEPT SELECT T4.last_name FROM students AS T3 JOIN student_enrolment AS T4 ON T3.student_id = T4.student_id	student_transcripts_tracking
SELECT T1.transcript_date ,  T1.transcript_id FROM TRANSCRIPTS AS T1 JOIN transcript_contents AS T2 ON T1.transcript_id  =  T2.transcript_id GROUP BY T1.transcript_id HAVING count(*)  >=  2	student_transcripts_tracking
SELECT T1.transcript_date ,  T1.transcript_id FROM TRANSCRIPTS AS T1 JOIN transcript_contents AS T2 ON T1.transcript_id  =  T2.transcript_id GROUP BY T1.transcript_id HAVING count(*)  >=  2	student_transcripts_tracking
SELECT cell_mobile_number FROM students WHERE first_name = "Timothy" AND last_name = "Ward";	student_transcripts_tracking
SELECT cell_mobile_number FROM students WHERE first_name = "Timmothy" AND last_name = "Ward";	student_transcripts_tracking
SELECT first_name ,  middle_name ,  last_name FROM students ORDER BY date_first_registered LIMIT 1	student_transcripts_tracking
SELECT first_name ,  middle_name ,  last_name FROM students ORDER BY date_first_registered LIMIT 1	student_transcripts_tracking
SELECT first_name ,  middle_name ,  last_name FROM students ORDER BY date_left LIMIT 1	student_transcripts_tracking
SELECT first_name ,  middle_name ,  last_name FROM students ORDER BY date_left LIMIT 1	student_transcripts_tracking
SELECT T1.first_name FROM students AS T1 JOIN addresses AS T2 ON T1.permanent_address_id = T2.address_id WHERE T2.city != T1.current_address_id	student_transcripts_tracking
SELECT T1.first_name FROM students AS T1 JOIN addresses AS T2 ON T1.permanent_address_id = T2.address_id WHERE T2.city != T1.current_address_id	student_transcripts_tracking
SELECT T1.address_id ,  T1.line_1 ,  T1.line_2 ,  T1.line_3 FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.current_address_id GROUP BY T1.address_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.address_id ,  T1.line_1 ,  T1.line_2 FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.current_address_id GROUP BY T1.address_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT avg(transcript_date) FROM TRANSCRIPTS	student_transcripts_tracking
SELECT avg(transcript_date) FROM transcripts	student_transcripts_tracking
SELECT transcript_date ,  other_details FROM TRANSCRIPTS ORDER BY transcript_date ASC LIMIT 1	student_transcripts_tracking
SELECT transcript_date ,  other_details FROM TRANSCRIPTS ORDER BY transcript_date ASC LIMIT 1	student_transcripts_tracking
SELECT count(*) FROM TRANSCRIPTS	student_transcripts_tracking
SELECT count(*) FROM TRANSCRIPTS	student_transcripts_tracking
SELECT transcript_date FROM transcripts ORDER BY transcript_date DESC LIMIT 1	student_transcripts_tracking
SELECT transcript_date FROM transcripts ORDER BY transcript_date DESC LIMIT 1	student_transcripts_tracking
SELECT count(*) ,  T1.student_course_id FROM transcript_contents AS T1 JOIN transcripts AS T2 ON T1.transcript_id  =  T2.transcript_id GROUP BY T1.student_course_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT T1.course_id ,  count(*) FROM Student_Enrolment_Courses AS T1 JOIN Transcript_Contents AS T2 ON T1.student_course_id  =  T2.student_course_id GROUP BY T1.course_id ORDER BY count(*) DESC LIMIT 1	student_transcripts_tracking
SELECT transcript_date ,  transcript_id FROM TRANSCRIPTS GROUP BY transcript_date ORDER BY count(*) LIMIT 1	student_transcripts_tracking
SELECT transcript_date ,  transcript_id FROM TRANSCRIPTS GROUP BY transcript_id ORDER BY count(*) ASC LIMIT 1	student_transcripts_tracking
SELECT T2.semester_name FROM student_enrolment AS T1 JOIN semesters AS T2 ON T1.semester_id = T2.semester_id JOIN degree_programs AS T3 ON T1.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = "Master" INTERSECT SELECT T2.semester_name FROM student_enrolment AS T1 JOIN semesters AS T2 ON T1.semester_id = T2.semester_id JOIN degree_programs AS T3 ON T1.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = "Bachelor"	student_transcripts_tracking
SELECT T1.semester_id FROM semesters AS T1 JOIN student_enrolment AS T2 ON T1.semester_id  =  T2.semester_id JOIN degree_programs AS T3 ON T2.degree_program_id  =  T3.degree_program_id WHERE T3.degree_summary_name  =  'Masters' INTERSECT SELECT T1.semester_id FROM semesters AS T1 JOIN student_enrolment AS T2 ON T1.semester_id  =  T2.semester_id JOIN degree_programs AS T3 ON T2.degree_program_id  =  T3.degree_program_id WHERE T3.degree_summary_name  =  'Bachelors'	student_transcripts_tracking
SELECT count(DISTINCT current_address_id) FROM students	student_transcripts_tracking
SELECT DISTINCT T1.line_1 ,  T1.line_2 ,  T1.line_3 ,  T1.city ,  T1.zip_postcode ,  T1.state_province_county ,  T1.country FROM addresses AS T1 JOIN students AS T2 ON T1.address_id = T2.current_address_id	student_transcripts_tracking
SELECT other_student_details FROM students ORDER BY other_student_details DESC	student_transcripts_tracking
SELECT other_student_details FROM students ORDER BY last_name DESC	student_transcripts_tracking
SELECT section_description FROM SECTIONS WHERE section_name  =  "h"	student_transcripts_tracking
SELECT section_description FROM SECTIONS WHERE section_name  =  "h"	student_transcripts_tracking
SELECT T1.first_name FROM students AS T1 JOIN addresses AS T2 ON T1.permanent_address_id = T2.address_id WHERE T2.country  =  'Haiti' OR T1.cell_mobile_number  =  '09700166582'	student_transcripts_tracking
SELECT T1.first_name FROM students AS T1 JOIN addresses AS T2 ON T1.permanent_address_id = T2.address_id WHERE T2.country = "Haiti" OR T1.cell_mobile_number = "09700166582"	student_transcripts_tracking
SELECT title FROM cartoon ORDER BY title	tvshow
SELECT title FROM cartoon ORDER BY title	tvshow
SELECT title FROM Cartoon WHERE directed_by  =  "Ben Jones"	tvshow
SELECT title FROM Cartoon WHERE directed_by  =  'Ben Jones'	tvshow
SELECT count(*) FROM Cartoon WHERE Written_by  =  "Joseph Kuhr"	tvshow
SELECT count(*) FROM Cartoon WHERE Written_by  =  "Joseph Kuhr"	tvshow
SELECT title ,  directed_by FROM Cartoon ORDER BY original_air_date	tvshow
SELECT title ,  directed_by FROM cartoon ORDER BY original_air_date	tvshow
SELECT title FROM Cartoon WHERE directed_by  =  "Ben Jones" OR directed_by  =  "Brandon Vietti"	tvshow
SELECT title FROM Cartoon WHERE directed_by  =  'Ben Jones' OR directed_by  =  'Brandon Vietti'	tvshow
SELECT Country ,  COUNT(*) FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1	tvshow
SELECT Country ,  COUNT(*) FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1	tvshow
SELECT count(DISTINCT series_name) ,  count(DISTINCT content) FROM TV_channel	tvshow
SELECT count(DISTINCT series_name) ,  count(DISTINCT content) FROM TV_channel	tvshow
SELECT Content FROM TV_Channel WHERE series_name  =  "Sky Radio"	tvshow
SELECT Content FROM TV_Channel WHERE series_name  =  "Sky Radio"	tvshow
SELECT Package_Option FROM TV_Channel WHERE series_name  =  "Sky Radio"	tvshow
SELECT Package_Option FROM TV_Channel WHERE series_name  =  "Sky Radio"	tvshow
SELECT count(*) FROM TV_Channel WHERE Language  =  "English"	tvshow
SELECT count(*) FROM TV_Channel WHERE Language  =  "English"	tvshow
SELECT LANGUAGE ,  count(*) FROM TV_Channel GROUP BY LANGUAGE ORDER BY count(*) ASC LIMIT 1	tvshow
SELECT LANGUAGE ,  count(*) FROM TV_Channel GROUP BY LANGUAGE ORDER BY count(*) ASC LIMIT 1	tvshow
SELECT Language ,  COUNT(*) FROM TV_Channel GROUP BY Language	tvshow
SELECT count(*) ,  LANGUAGE FROM TV_Channel GROUP BY LANGUAGE	tvshow
SELECT T2.series_name FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel  =  T2.id WHERE T1.Title  =  "The Rise of the Blue Beetle!"	tvshow
SELECT T2.series_name FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel  =  T2.id WHERE T1.Title  =  "The Rise of the Blue Beetle"	tvshow
SELECT T2.title FROM TV_channel AS T1 JOIN cartoon AS T2 ON T1.id  =  T2.channel WHERE T1.series_name  =  "Sky Radio"	tvshow
SELECT T2.title FROM TV_channel AS T1 JOIN cartoon AS T2 ON T1.id  =  T2.channel WHERE T1.series_name  =  "Sky Radio"	tvshow
SELECT Episode FROM TV_series ORDER BY Rating DESC	tvshow
SELECT episode FROM tv_series ORDER BY rating	tvshow
SELECT Episode ,  Rating FROM TV_series ORDER BY Rating DESC LIMIT 3	tvshow
SELECT episode ,  rating FROM tv_series ORDER BY rating DESC LIMIT 3	tvshow
SELECT min(Share) ,  max(Share) FROM TV_series	tvshow
SELECT max(Share) ,  min(Share) FROM TV_series	tvshow
SELECT Air_Date FROM TV_series WHERE Episode  =  "A Love of a Lifetime"	tvshow
SELECT T2.Air_Date FROM Cartoon AS T1 JOIN TV_series AS T2 ON T1.Channel  =  T2.Channel WHERE T1.Title  =  "A Love of a Lifetime"	tvshow
SELECT Weekly_Rank FROM TV_series WHERE Episode  =  "A Love of a Lifetime"	tvshow
SELECT Weekly_Rank FROM TV_series WHERE Episode  =  "A Love of a Lifetime"	tvshow
SELECT T2.series_name FROM TV_series AS T1 JOIN TV_Channel AS T2 ON T1.Channel  =  T2.id WHERE T1.Episode  =  "A Love of a Lifetime"	tvshow
SELECT T2.series_name FROM TV_series AS T1 JOIN TV_channel AS T2 ON T1.channel  =  T2.id WHERE T1.episode  =  "A Love of a Lifetime"	tvshow
SELECT T2.Episode FROM TV_channel AS T1 JOIN TV_series AS T2 ON T1.id  =  T2.Channel WHERE T1.series_name  =  "Sky Radio"	tvshow
SELECT T2.episode FROM TV_channel AS T1 JOIN TV_series AS T2 ON T1.id  =  T2.channel WHERE T1.series_name  =  "Sky Radio"	tvshow
SELECT count(*) ,  directed_by FROM cartoon GROUP BY directed_by	tvshow
SELECT directed_by ,  count(*) FROM Cartoon GROUP BY directed_by	tvshow
SELECT production_code ,  channel FROM Cartoon ORDER BY original_air_date DESC LIMIT 1	tvshow
SELECT production_code ,  channel FROM Cartoon ORDER BY original_air_date DESC LIMIT 1	tvshow
SELECT Package_Option ,  series_name FROM TV_Channel WHERE Hight_definition_TV  =  'Yes'	tvshow
SELECT Package_Option ,  series_name FROM TV_Channel WHERE Hight_definition_TV  =  'Yes'	tvshow
SELECT T2.Country FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel  =  T2.id WHERE T1.Written_by  =  "Todd Casey"	tvshow
SELECT T2.Country FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel  =  T2.id WHERE T1.Written_by  =  "Todd Casey"	tvshow
SELECT country FROM TV_channel EXCEPT SELECT T2.country FROM Cartoon AS T1 JOIN TV_channel AS T2 ON T1.channel  =  T2.id WHERE T1.written_by  =  'Todd Casey'	tvshow
SELECT DISTINCT country FROM TV_channel EXCEPT SELECT DISTINCT T2.country FROM cartoon AS T1 JOIN TV_channel AS T2 ON T1.channel  =  T2.id WHERE T1.written_by  =  'Todd Casey'	tvshow
SELECT t1.series_name ,  t1.country FROM TV_channel AS t1 JOIN cartoon AS t2 ON t1.id  =  t2.channel WHERE t2.directed_by  =  "Ben Jones" INTERSECT SELECT t1.series_name ,  t1.country FROM TV_channel AS t1 JOIN cartoon AS t2 ON t1.id  =  t2.channel WHERE t2.directed_by  =  "Michael Chang"	tvshow
SELECT T2.series_name ,  T2.country FROM cartoon AS T1 JOIN tv_channel AS T2 ON T1.channel  =  T2.id WHERE T1.directed_by  =  "Ben Jones" INTERSECT SELECT T2.series_name ,  T2.country FROM cartoon AS T1 JOIN tv_channel AS T2 ON T1.channel  =  T2.id WHERE T1.directed_by  =  "Michael Chang"	tvshow
SELECT pixel_aspect_ratio_par ,  country FROM TV_channel WHERE LANGUAGE != 'English'	tvshow
SELECT pixel_aspect_ratio_par ,  country FROM tv_channel WHERE LANGUAGE != 'English'	tvshow
SELECT id FROM TV_channel GROUP BY country HAVING count(*)  >  2	tvshow
SELECT id FROM TV_channel GROUP BY id HAVING count(*)  >  2	tvshow
SELECT id FROM TV_channel EXCEPT SELECT channel FROM Cartoon WHERE directed_by  =  "Ben Jones"	tvshow
SELECT id FROM TV_channel EXCEPT SELECT channel FROM cartoon WHERE directed_by  =  'Ben Jones'	tvshow
SELECT DISTINCT Package_Option FROM TV_Channel EXCEPT SELECT DISTINCT T2.Package_Option FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel  =  T2.id WHERE T1.directed_by  =  "Ben Jones"	tvshow
SELECT DISTINCT T2.Package_Option FROM cartoon AS T1 JOIN TV_channel AS T2 ON T1.channel  =  T2.id WHERE T1.directed_by != "Ben Jones"	tvshow
SELECT count(*) FROM poker_player	poker_player
SELECT count(*) FROM poker_player	poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC	poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC	poker_player
SELECT Final_Table_Made ,  Best_Finish FROM poker_player	poker_player
SELECT Final_Table_Made ,  Best_Finish FROM poker_player	poker_player
SELECT avg(earnings) FROM poker_player	poker_player
SELECT avg(earnings) FROM poker_player	poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1	poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1	poker_player
SELECT max(Final_Table_Made) FROM poker_player WHERE Earnings  <  200000	poker_player
SELECT max(final_table_made) FROM poker_player WHERE earnings  <  200000	poker_player
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID	poker_player
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID	poker_player
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID WHERE T1.Earnings  >  300000	poker_player
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID WHERE T1.Earnings  >  300000	poker_player
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T1.Final_Table_Made ASC	poker_player
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T1.Final_Table_Made ASC	poker_player
SELECT T2.Birth_Date FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T1.Earnings LIMIT 1	poker_player
SELECT T2.Birth_Date FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T1.Earnings LIMIT 1	poker_player
SELECT T1.Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T2.Height DESC LIMIT 1	poker_player
SELECT T1.Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T2.Height DESC LIMIT 1	poker_player
SELECT avg(T1.Earnings) FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID WHERE T2.Height  >  200	poker_player
SELECT avg(T1.earnings) FROM poker_player AS T1 JOIN people AS T2 ON T1.people_id  =  T2.people_id WHERE T2.height  >  200	poker_player
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T1.Earnings DESC	poker_player
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T1.Earnings DESC	poker_player
SELECT Nationality ,  COUNT(*) FROM people GROUP BY Nationality	poker_player
SELECT Nationality ,  COUNT(*) FROM people GROUP BY Nationality	poker_player
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1	poker_player
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1	poker_player
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*)  >=  2	poker_player
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*)  >=  2	poker_player
SELECT Name ,  Birth_Date FROM people ORDER BY Name ASC	poker_player
SELECT Name ,  Birth_Date FROM people ORDER BY Name ASC	poker_player
SELECT Name FROM People WHERE Nationality != "Russia"	poker_player
SELECT Name FROM People WHERE Nationality != "Russia"	poker_player
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)	poker_player
SELECT Name FROM people WHERE People_id NOT IN (SELECT People_ID FROM poker_player)	poker_player
SELECT count(DISTINCT nationality) FROM people	poker_player
SELECT count(DISTINCT nationality) FROM people	poker_player
SELECT count(DISTINCT state) FROM area_code_state	voter_1
SELECT T1.contestant_number ,  T1.contestant_name FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number  =  T2.contestant_number ORDER BY T1.contestant_name DESC	voter_1
SELECT vote_id ,  phone_number ,  state FROM VOTES	voter_1
SELECT max(area_code) ,  min(area_code) FROM area_code_state	voter_1
SELECT max(created) FROM votes WHERE state  =  'CA'	voter_1
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != "Jessie Alloway"	voter_1
SELECT DISTINCT state ,  created FROM VOTES	voter_1
SELECT T1.contestant_number ,  T1.contestant_name FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number  =  T2.contestant_number GROUP BY T2.contestant_number HAVING COUNT(*)  >=  2	voter_1
SELECT T1.contestant_number ,  T1.contestant_name FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number  =  T2.contestant_number GROUP BY T2.contestant_number ORDER BY count(*) ASC LIMIT 1	voter_1
SELECT count(*) FROM VOTES WHERE state  =  "NY" OR state  =  "CA"	voter_1
SELECT count(*) FROM contestants WHERE contestant_number NOT IN (SELECT contestant_number FROM votes)	voter_1
SELECT area_code FROM area_code_state WHERE state  =  (SELECT state FROM votes GROUP BY state ORDER BY count(*) DESC LIMIT 1)	voter_1
SELECT T1.created ,  T1.state ,  T1.phone_number FROM VOTES AS T1 JOIN CONTESTANTS AS T2 ON T1.contestant_number  =  T2.contestant_number WHERE T2.contestant_name  =  "Tabatha Gehling"	voter_1
SELECT T1.area_code FROM area_code_state AS T1 JOIN votes AS T2 ON T1.state  =  T2.state JOIN contestants AS T3 ON T2.contestant_number  =  T3.contestant_number WHERE T3.contestant_name  =  'Tabatha Gehling' INTERSECT SELECT T1.area_code FROM area_code_state AS T1 JOIN votes AS T2 ON T1.state  =  T2.state JOIN contestants AS T3 ON T2.contestant_number  =  T3.contestant_number WHERE T3.contestant_name  =  'Kelly Clauss'	voter_1
SELECT contestant_name FROM contestants WHERE contestant_name LIKE "%Al%"	voter_1
SELECT Name FROM country WHERE IndepYear  >  1950	world_1
SELECT Name FROM country WHERE IndepYear  >  1950	world_1
SELECT count(*) FROM country WHERE GovernmentForm  =  "Republic"	world_1
SELECT count(*) FROM country WHERE GovernmentForm  =  "Republic"	world_1
SELECT sum(SurfaceArea) FROM country WHERE Region  =  'Caribbean'	world_1
SELECT sum(SurfaceArea) FROM country WHERE continent  =  'Caribbean'	world_1
SELECT T1.Continent FROM country AS T1 JOIN city AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Name  =  'Anguilla'	world_1
SELECT T1.Continent FROM country AS T1 JOIN city AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Name  =  'Anguilla'	world_1
SELECT T1.Region FROM country AS T1 JOIN city AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Name  =  'Kabul'	world_1
SELECT T1.Region FROM country AS T1 JOIN city AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Name  =  'Kabul'	world_1
SELECT T1.Language FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code WHERE T2.Name  =  'Aruba' ORDER BY T1.Percentage DESC LIMIT 1	world_1
SELECT T1.Language FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code WHERE T2.Name  =  'Aruba' AND T1.IsOfficial  =  'Yes'	world_1
SELECT LifeExpectancy ,  Population FROM country WHERE Name  =  'Brazil'	world_1
SELECT Population ,  LifeExpectancy FROM country WHERE Name  =  'Brazil'	world_1
SELECT Region ,  Population FROM country WHERE Name  =  'Angola'	world_1
SELECT Region ,  Population FROM country WHERE Name  =  'Angola'	world_1
SELECT avg(LifeExpectancy) FROM country WHERE Region  =  "Central Africa"	world_1
SELECT avg(LifeExpectancy) FROM country WHERE Continent  =  "Central Africa"	world_1
SELECT Name FROM country WHERE Continent  =  'Asia' ORDER BY LifeExpectancy LIMIT 1	world_1
SELECT Name FROM country WHERE Continent  =  'Asia' ORDER BY LifeExpectancy LIMIT 1	world_1
SELECT sum(population) ,  max(gnp) FROM country WHERE continent  =  'Asia'	world_1
SELECT sum(population) ,  max(gnp) FROM country WHERE continent  =  'Asia'	world_1
SELECT avg(LifeExpectancy) FROM country WHERE Continent  =  'Africa' AND GovernmentForm  =  'Republic'	world_1
SELECT avg(LifeExpectancy) FROM country WHERE Continent  =  'Africa' AND GovernmentForm  =  'Republic'	world_1
SELECT sum(SurfaceArea) FROM country WHERE continent  =  'Asia' OR continent  =  'Europe'	world_1
SELECT sum(surfacearea) FROM country WHERE continent  =  'Asia' OR continent  =  'Europe'	world_1
SELECT sum(Population) FROM city WHERE District  =  "Gelderland"	world_1
SELECT sum(Population) FROM city WHERE District  =  "Gelderland"	world_1
SELECT avg(gnp) ,  sum(population) FROM country WHERE governmentform  =  'US Territory'	world_1
SELECT avg(gnp) ,  sum(population) FROM country WHERE governmentform  =  'United States'	world_1
SELECT count(DISTINCT language) FROM countrylanguage	world_1
SELECT count(DISTINCT language) FROM countrylanguage	world_1
SELECT count(DISTINCT governmentform) FROM country WHERE continent  =  'Africa'	world_1
SELECT count(DISTINCT governmentform) FROM country WHERE continent  =  'Africa'	world_1
SELECT sum(T1.IsOfficial) FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code WHERE T2.Name  =  'Aruba'	world_1
SELECT count(DISTINCT T1.Language) FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code WHERE T2.Name  =  'Aruba'	world_1
SELECT sum(CASE WHEN T1.IsOfficial = 'Yes' THEN 1 ELSE 0 END) FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code WHERE T2.Name  =  'Afghanistan'	world_1
SELECT count(*) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.code  =  T2.countrycode WHERE T1.name  =  'Afghanistan' AND T2.IsOfficial  =  'Yes'	world_1
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode GROUP BY T1.Name ORDER BY count(*) DESC LIMIT 1	world_1
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode GROUP BY T1.Name ORDER BY count(*) DESC LIMIT 1	world_1
SELECT T1.Continent FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode GROUP BY T1.Continent ORDER BY COUNT(*) DESC LIMIT 1	world_1
SELECT T1.Continent FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode GROUP BY T1.Continent ORDER BY count(*) DESC LIMIT 1	world_1
SELECT COUNT(*) FROM countrylanguage WHERE language  =  'English' INTERSECT SELECT COUNT(*) FROM countrylanguage WHERE language  =  'Dutch'	world_1
SELECT count(DISTINCT countrycode) FROM countrylanguage WHERE language  =  'English' INTERSECT SELECT count(DISTINCT countrycode) FROM countrylanguage WHERE language  =  'Dutch'	world_1
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'English' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'French'	world_1
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'English' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'French'	world_1
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.IsOfficial  =  'Yes' AND T2.Language  =  'English' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.IsOfficial  =  'Yes' AND T2.Language  =  'French'	world_1
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.IsOfficial  =  'Yes' AND T2.Language  =  'English' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.IsOfficial  =  'Yes' AND T2.Language  =  'French'	world_1
SELECT count(DISTINCT T1.Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'Chinese'	world_1
SELECT count(DISTINCT T1.Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'Chinese'	world_1
SELECT T1.Region FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'English' OR T2.Language  =  'Dutch'	world_1
SELECT T1.Region FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'Dutch' OR T2.Language  =  'English'	world_1
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.IsOfficial  =  'Yes' AND (T2.Language  =  'English' OR T2.Language  =  'Dutch')	world_1
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.IsOfficial  =  'Yes' AND T2.Language  =  'English' UNION SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.IsOfficial  =  'Yes' AND T2.Language  =  'Dutch'	world_1
SELECT T1.Language FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code WHERE T2.Continent  =  'Asia' GROUP BY T1.Language ORDER BY sum(T1.Percentage) DESC LIMIT 1	world_1
SELECT T1.Language FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code WHERE T2.Continent  =  'Asia' GROUP BY T1.Language ORDER BY COUNT(*) DESC LIMIT 1	world_1
SELECT T1.Language FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code WHERE T2.GovernmentForm  =  "Republic" GROUP BY T1.Language HAVING count(*)  =  1	world_1
SELECT T1.Language FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code WHERE T2.GovernmentForm  =  "Republic" GROUP BY T1.Language HAVING count(*)  =  1	world_1
SELECT T1.Name FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode  =  T2.CountryCode WHERE T2.Language  =  "English" ORDER BY T1.Population DESC LIMIT 1	world_1
SELECT T1.Name FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode  =  T2.CountryCode WHERE T2.Language  =  "English" ORDER BY T1.Population DESC LIMIT 1	world_1
SELECT name ,  population ,  lifeexpectancy FROM country WHERE continent  =  'Asia' ORDER BY surfacearea DESC LIMIT 1	world_1
SELECT name ,  population ,  lifeexpectancy FROM country WHERE continent  =  'Asia' ORDER BY surfacearea DESC LIMIT 1	world_1
SELECT avg(T1.LifeExpectancy) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.IsOfficial  =  'No' AND T2.Language  =  'English'	world_1
SELECT avg(T1.LifeExpectancy) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.IsOfficial  =  'No' AND T2.Language  =  'English'	world_1
SELECT sum(population) FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language  =  'English')	world_1
SELECT sum(population) FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language  =  'English')	world_1
SELECT T1.Language FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code WHERE T2.HeadOfState  =  "Beatrix" AND T1.IsOfficial  =  "Yes"	world_1
SELECT T3.Language FROM country AS T1 JOIN countrylanguage AS T3 ON T1.Code  =  T3.CountryCode JOIN city AS T2 ON T1.Code  =  T2.CountryCode WHERE T1.HeadOfState  =  "Beatrix" AND T3.IsOfficial  =  "Yes"	world_1
SELECT count(DISTINCT T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T1.IndepYear  <  1930 AND T2.IsOfficial  =  'Yes'	world_1
SELECT count(DISTINCT T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T1.IndepYear  <  1930 AND T2.IsOfficial  =  'Yes'	world_1
SELECT Name FROM country WHERE SurfaceArea  >  (SELECT max(SurfaceArea) FROM country WHERE Continent  =  'Europe')	world_1
SELECT Name FROM country WHERE SurfaceArea  >  (SELECT max(SurfaceArea) FROM country WHERE Continent  =  'Europe')	world_1
SELECT name FROM country WHERE continent  =  'Africa' AND population  <  (SELECT max(population) FROM country WHERE continent  =  'Asia')	world_1
SELECT name FROM country WHERE continent  =  'Africa' AND population  <  (SELECT max(population) FROM country WHERE continent  =  'Asia')	world_1
SELECT name FROM country WHERE continent  =  'Asia' AND population  >  (SELECT max(population) FROM country WHERE continent  =  'Africa')	world_1
SELECT Name FROM country WHERE Continent  =  'Asia' AND Population  >  (SELECT max(Population) FROM country WHERE Continent  =  'Africa')	world_1
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'	world_1
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'	world_1
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'	world_1
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'	world_1
SELECT code FROM country EXCEPT SELECT countrycode FROM countrylanguage WHERE LANGUAGE  =  'English' UNION SELECT code FROM country WHERE governmentform != 'Republic'	world_1
SELECT code FROM country EXCEPT SELECT countrycode FROM countrylanguage WHERE LANGUAGE  =  'English' UNION SELECT code FROM country WHERE governmentform  =  'Republic'	world_1
SELECT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code JOIN countrylanguage AS T3 ON T2.Code  =  T3.CountryCode WHERE T3.IsOfficial  =  'F' AND T2.Continent  =  'Europe' AND T3.Language  =  'English'	world_1
SELECT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code JOIN countrylanguage AS T3 ON T2.Code  =  T3.CountryCode WHERE T2.Continent  =  'Europe' AND T3.IsOfficial  =  'No' AND T3.Language  =  'English'	world_1
SELECT DISTINCT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code JOIN countrylanguage AS T3 ON T2.Code  =  T3.CountryCode WHERE T3.IsOfficial  =  'T' AND T3.Language  =  'Chinese' AND T2.Continent  =  'Asia'	world_1
SELECT DISTINCT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code JOIN countrylanguage AS T3 ON T2.Code  =  T3.CountryCode WHERE T3.IsOfficial  =  'T' AND T3.Language  =  'Chinese' AND T2.Continent  =  'Asia'	world_1
SELECT name ,  indepyear ,  surfacearea FROM country ORDER BY population ASC LIMIT 1	world_1
SELECT name ,  indepyear ,  surfacearea FROM country ORDER BY population LIMIT 1	world_1
SELECT population ,  name ,  headofstate FROM country ORDER BY surfacearea DESC LIMIT 1	world_1
SELECT name ,  population ,  headofstate FROM country ORDER BY surfacearea DESC LIMIT 1	world_1
SELECT T1.Name ,  count(*) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode GROUP BY T1.Name HAVING count(*)  >=  3	world_1
SELECT T1.Name ,  count(*) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode GROUP BY T1.Name HAVING count(*)  >  2	world_1
SELECT count(*) ,  district FROM city WHERE population  >  (SELECT avg(population) FROM city) GROUP BY district	world_1
SELECT count(*) ,  T1.District FROM city AS T1 WHERE T1.population  >  (SELECT avg(population) FROM city) GROUP BY T1.district	world_1
SELECT governmentform ,  sum(population) FROM country GROUP BY governmentform HAVING avg(lifeexpectancy)  >  72	world_1
SELECT sum(T1.population) ,  T1.GovernmentForm FROM country AS T1 JOIN countrylanguage AS T2 ON T1.code  =  T2.countrycode WHERE T1.LifeExpectancy  >  72 GROUP BY T1.GovernmentForm	world_1
SELECT avg(lifeexpectancy) ,  sum(population) ,  continent FROM country GROUP BY continent HAVING avg(lifeexpectancy)  <  72	world_1
SELECT continent ,  sum(population) ,  avg(lifeexpectancy) FROM country GROUP BY continent HAVING avg(lifeexpectancy)  <  72	world_1
SELECT Name ,  SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5	world_1
SELECT Name ,  SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5	world_1
SELECT Name FROM country ORDER BY Population DESC LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population DESC LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population ASC LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population ASC LIMIT 3	world_1
SELECT count(*) FROM country WHERE continent  =  'Asia'	world_1
SELECT count(*) FROM country WHERE continent  =  'Asia'	world_1
SELECT name FROM country WHERE continent  =  'Europe' AND population  =  80000	world_1
SELECT Name FROM country WHERE Continent  =  "Europe" AND Population  =  80000	world_1
SELECT sum(Population) ,  avg(SurfaceArea) FROM country WHERE Continent  =  "North America" AND SurfaceArea  >  3000	world_1
SELECT sum(population) ,  avg(surfacearea) FROM country WHERE continent  =  'North America' AND surfacearea  >  3000	world_1
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000	world_1
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000	world_1
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(Language) DESC LIMIT 1	world_1
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1	world_1
SELECT T1.Name ,  T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.IsOfficial  =  'Yes' AND T2.Percentage  =  ( SELECT max(Percentage) FROM countrylanguage WHERE IsOfficial  =  'Yes' )	world_1
SELECT CountryCode ,  MAX(Percentage) FROM countrylanguage GROUP BY CountryCode	world_1
SELECT count(*) FROM countrylanguage WHERE LANGUAGE  =  "Spanish" AND percentage  =  (SELECT max(percentage) FROM countrylanguage WHERE LANGUAGE  =  "Spanish")	world_1
SELECT count(*) FROM countrylanguage WHERE language  =  "Spanish" AND percentage  >  50	world_1
SELECT CountryCode FROM countrylanguage WHERE Language  =  "Spanish" AND Percentage  =  (SELECT max(Percentage) FROM countrylanguage WHERE Language  =  "Spanish")	world_1
SELECT CountryCode FROM countrylanguage WHERE LANGUAGE  =  "Spanish" AND IsOfficial  =  "T"	world_1
SELECT count(*) FROM conductor	orchestra
SELECT count(*) FROM conductor	orchestra
SELECT name FROM conductor ORDER BY age ASC	orchestra
SELECT name FROM conductor ORDER BY age	orchestra
SELECT name FROM conductor WHERE nationality != 'USA'	orchestra
SELECT name FROM conductor WHERE nationality != "USA"	orchestra
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC	orchestra
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC	orchestra
SELECT avg(Attendance) FROM show	orchestra
SELECT avg(Attendance) FROM show	orchestra
SELECT max(Share) ,  min(Share) FROM performance WHERE TYPE != "Live final"	orchestra
SELECT max(Share) ,  min(Share) FROM performance WHERE TYPE != "Live final"	orchestra
SELECT count(DISTINCT nationality) FROM conductor	orchestra
SELECT count(DISTINCT nationality) FROM conductor	orchestra
SELECT name FROM conductor ORDER BY year_of_work DESC	orchestra
SELECT name FROM conductor ORDER BY year_of_work DESC	orchestra
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1	orchestra
SELECT name FROM conductor ORDER BY year_of_work DESC LIMIT 1	orchestra
SELECT T2.Name ,  T1.Orchestra FROM orchestra AS T1 JOIN conductor AS T2 ON T1.Conductor_ID  =  T2.Conductor_ID	orchestra
SELECT T1.Name ,  T2.Orchestra FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID  =  T2.Conductor_ID	orchestra
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID  =  T2.Conductor_ID GROUP BY T1.Name HAVING COUNT(*)  >  1	orchestra
SELECT T1.name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.conductor_id  =  T2.conductor_id GROUP BY T1.name HAVING count(*)  >  1	orchestra
SELECT t1.name FROM conductor AS t1 JOIN orchestra AS t2 ON t1.conductor_id  =  t2.conductor_id GROUP BY t1.name ORDER BY count(*) DESC LIMIT 1	orchestra
SELECT t1.name FROM conductor AS t1 JOIN orchestra AS t2 ON t1.conductor_id  =  t2.conductor_id GROUP BY t1.name ORDER BY count(*) DESC LIMIT 1	orchestra
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID  =  T2.Conductor_ID WHERE T2.Year_of_Founded  >  2008	orchestra
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID  =  T2.Conductor_ID WHERE T2.Year_of_Founded  >  2008	orchestra
SELECT Record_Company ,  COUNT(*) FROM orchestra GROUP BY Record_Company	orchestra
SELECT count(*) ,  record_company FROM orchestra GROUP BY record_company	orchestra
SELECT major_record_format FROM orchestra GROUP BY major_record_format ORDER BY count(*) ASC	orchestra
SELECT major_record_format FROM orchestra GROUP BY major_record_format ORDER BY count(*) DESC	orchestra
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1	orchestra
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1	orchestra
SELECT orchestra FROM orchestra WHERE orchestra_id NOT IN (SELECT orchestra_id FROM performance)	orchestra
SELECT orchestra FROM orchestra WHERE orchestra_id NOT IN (SELECT orchestra_id FROM performance)	orchestra
SELECT Record_Company FROM orchestra WHERE Year_of_Founded  <  2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded  >  2003	orchestra
SELECT Record_Company FROM orchestra WHERE Year_of_Founded  <  2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded  >  2003	orchestra
SELECT count(*) FROM orchestra WHERE major_record_format  =  "CD" OR major_record_format  =  "DVD"	orchestra
SELECT count(*) FROM orchestra WHERE major_record_format  =  "CD" OR major_record_format  =  "DVD"	orchestra
SELECT T2.Year_of_Founded FROM performance AS T1 JOIN orchestra AS T2 ON T1.Orchestra_ID  =  T2.Orchestra_ID GROUP BY T1.Orchestra_ID HAVING COUNT(*)  >  1	orchestra
SELECT T1.Year_of_Founded FROM orchestra AS T1 JOIN performance AS T2 ON T1.Orchestra_ID  =  T2.Orchestra_ID GROUP BY T2.Orchestra_ID HAVING COUNT(*)  >  1	orchestra
SELECT count(*) FROM Highschooler	network_1
SELECT count(*) FROM Highschooler	network_1
SELECT name ,  grade FROM Highschooler	network_1
SELECT name ,  grade FROM Highschooler	network_1
SELECT DISTINCT grade FROM Highschooler	network_1
SELECT DISTINCT grade FROM Highschooler	network_1
SELECT grade FROM Highschooler WHERE name  =  'Kyle'	network_1
SELECT grade FROM Highschooler WHERE name  =  'Kyle'	network_1
SELECT name FROM Highschooler WHERE grade  =  10	network_1
SELECT name FROM Highschooler WHERE grade  =  10	network_1
SELECT id FROM Highschooler WHERE name  =  'Kyle'	network_1
SELECT id FROM highschooler WHERE name  =  'Kyle'	network_1
SELECT count(*) FROM Highschooler WHERE grade  =  9 OR grade  =  10	network_1
SELECT count(*) FROM Highschooler WHERE grade  =  9 OR grade  =  10	network_1
SELECT count(*) ,  grade FROM Highschooler GROUP BY grade	network_1
SELECT count(*) ,  grade FROM Highschooler GROUP BY grade	network_1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY count(*) DESC LIMIT 1	network_1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY count(*) DESC LIMIT 1	network_1
SELECT grade FROM highschooler GROUP BY grade HAVING count(*)  >=  4	network_1
SELECT grade FROM Highschooler GROUP BY grade HAVING count(*)  >=  4	network_1
SELECT student_id ,  count(*) FROM friend GROUP BY student_id	network_1
SELECT count(*) ,  T1.id FROM highschooler AS T1 JOIN friend AS T2 ON T1.id  =  T2.student_id GROUP BY T1.id	network_1
SELECT T1.name ,  count(*) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.id  =  T2.student_id GROUP BY T2.student_id	network_1
SELECT T1.name ,  count(*) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.id  =  T2.student_id GROUP BY T2.student_id	network_1
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.id  =  T2.student_id GROUP BY T2.student_id ORDER BY count(*) DESC LIMIT 1	network_1
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.id  =  T2.student_id GROUP BY T2.student_id ORDER BY count(*) DESC LIMIT 1	network_1
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.id  =  T2.student_id GROUP BY T2.student_id HAVING count(*)  >=  3	network_1
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.id  =  T2.student_id GROUP BY T2.student_id HAVING count(*)  >=  3	network_1
SELECT T3.name FROM friend AS T1 JOIN highschooler AS T2 ON T1.student_id  =  T2.id JOIN highschooler AS T3 ON T1.friend_id  =  T3.id WHERE T2.name  =  'Kyle'	network_1
SELECT T3.name FROM friend AS T1 JOIN highschooler AS T2 ON T1.student_id  =  T2.id JOIN highschooler AS T3 ON T1.friend_id  =  T3.id WHERE T2.name  =  'Kyle'	network_1
SELECT count(*) FROM friend AS T1 JOIN highschooler AS T2 ON T1.student_id  =  T2.id WHERE T2.name  =  'Kyle'	network_1
SELECT count(*) FROM friend AS T1 JOIN highschooler AS T2 ON T1.student_id  =  T2.id WHERE T2.name  =  'Kyle'	network_1
SELECT id FROM highschooler EXCEPT SELECT student_id FROM friend	network_1
SELECT id FROM highschooler EXCEPT SELECT student_id FROM friend	network_1
SELECT name FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend)	network_1
SELECT name FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend)	network_1
SELECT student_id FROM friend INTERSECT SELECT liked_id FROM likes	network_1
SELECT student_id FROM friend INTERSECT SELECT student_id FROM likes	network_1
SELECT T1.name FROM highschooler AS T1 JOIN friend AS T2 ON T1.id  =  T2.student_id INTERSECT SELECT T3.name FROM highschooler AS T3 JOIN likes AS T4 ON T3.id  =  T4.student_id	network_1
SELECT T1.name FROM Highschooler AS T1 JOIN likes AS T2 ON T1.id  =  T2.student_id INTERSECT SELECT T3.name FROM Highschooler AS T3 JOIN friend AS T4 ON T3.id  =  T4.student_id	network_1
SELECT count(*) ,  student_id FROM Likes GROUP BY student_id	network_1
SELECT count(*) ,  student_id FROM Likes GROUP BY student_id	network_1
SELECT T1.name ,  count(*) FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.id  =  T2.student_id GROUP BY T2.student_id	network_1
SELECT T1.name ,  count(*) FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.id  =  T2.student_id GROUP BY T2.student_id	network_1
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.id  =  T2.student_id GROUP BY T2.student_id ORDER BY count(*) DESC LIMIT 1	network_1
SELECT T1.name FROM highschooler AS T1 JOIN likes AS T2 ON T1.id  =  T2.student_id GROUP BY T2.student_id ORDER BY count(*) DESC LIMIT 1	network_1
SELECT T1.name FROM highschooler AS T1 JOIN likes AS T2 ON T1.id  =  T2.student_id GROUP BY T2.student_id HAVING count(*)  >=  2	network_1
SELECT T1.name FROM highschooler AS T1 JOIN likes AS T2 ON T1.id  =  T2.student_id GROUP BY T2.student_id HAVING count(*)  >=  2	network_1
SELECT T1.name FROM highschooler AS T1 JOIN friend AS T2 ON T1.id  =  T2.student_id WHERE T1.grade  >  5 GROUP BY T2.student_id HAVING count(*)  >=  2	network_1
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.id  =  T2.student_id WHERE T1.grade  >  5 GROUP BY T2.student_id HAVING count(*)  >=  2	network_1
SELECT count(*) FROM likes AS T1 JOIN highschooler AS T2 ON T1.student_id  =  T2.id WHERE T2.name  =  'Kyle'	network_1
SELECT count(*) FROM likes AS T1 JOIN highschooler AS T2 ON T1.student_id  =  T2.id WHERE T2.name  =  'Kyle'	network_1
SELECT avg(grade) FROM highschooler WHERE id IN (SELECT student_id FROM friend)	network_1
SELECT avg(grade) FROM highschooler WHERE id IN (SELECT student_id FROM friend)	network_1
SELECT min(grade) FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend)	network_1
SELECT min(grade) FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend)	network_1
SELECT state FROM owners INTERSECT SELECT state FROM professionals	dog_kennels
SELECT state FROM owners INTERSECT SELECT state FROM professionals	dog_kennels
SELECT avg(age) FROM dogs WHERE dog_id IN (SELECT dog_id FROM treatments)	dog_kennels
SELECT avg(T1.age) FROM dogs AS T1 JOIN treatments AS T2 ON T1.dog_id  =  T2.dog_id	dog_kennels
SELECT T1.professional_id ,  T1.last_name ,  T1.cell_number FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id  =  T2.professional_id GROUP BY T1.professional_id HAVING count(*)  >  2 UNION SELECT professional_id ,  last_name ,  cell_number FROM Professionals WHERE state  =  'IN'	dog_kennels
SELECT T1.professional_id ,  T1.last_name ,  T1.cell_number FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id  =  T2.professional_id GROUP BY T1.professional_id HAVING count(*)  >  2 UNION SELECT professional_id ,  last_name ,  cell_number FROM Professionals WHERE state  =  'IN'	dog_kennels
SELECT T2.name FROM treatments AS T1 JOIN dogs AS T2 ON T1.dog_id  =  T2.dog_id GROUP BY T1.dog_id HAVING sum(T1.cost_of_treatment)  <=  1000	dog_kennels
SELECT T2.name FROM treatments AS T1 JOIN dogs AS T2 ON T1.dog_id  =  T2.dog_id WHERE T1.cost_of_treatment  <  1000 GROUP BY T2.name HAVING sum(T1.cost_of_treatment)  <=  1000	dog_kennels
SELECT DISTINCT first_name FROM owners UNION SELECT DISTINCT first_name FROM professionals EXCEPT SELECT DISTINCT name FROM dogs	dog_kennels
SELECT DISTINCT first_name FROM owners UNION SELECT DISTINCT first_name FROM professionals EXCEPT SELECT DISTINCT name FROM dogs	dog_kennels
SELECT professional_id ,  role_code ,  email_address FROM professionals EXCEPT SELECT professional_id ,  role_code ,  email_address FROM treatments AS T1 JOIN professionals AS T2 ON T1.professional_id  =  T2.professional_id	dog_kennels
SELECT professional_id ,  role_code ,  email_address FROM professionals EXCEPT SELECT professional_id ,  role_code ,  email_address FROM treatments	dog_kennels
SELECT T1.owner_id ,  T2.first_name ,  T2.last_name FROM Dogs AS T1 JOIN Owners AS T2 ON T1.owner_id  =  T2.owner_id GROUP BY T1.owner_id ORDER BY count(*) DESC LIMIT 1	dog_kennels
SELECT T2.owner_id ,  T1.first_name ,  T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id GROUP BY T2.owner_id ORDER BY count(*) DESC LIMIT 1	dog_kennels
SELECT T1.professional_id ,  T2.role_code ,  T2.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id  =  T2.professional_id GROUP BY T1.professional_id HAVING count(*)  >=  2	dog_kennels
SELECT T1.professional_id ,  T2.role_code ,  T2.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id  =  T2.professional_id GROUP BY T1.professional_id HAVING count(*)  >=  2	dog_kennels
SELECT T2.breed_name FROM Dogs AS T1 JOIN Breeds AS T2 ON T1.breed_code  =  T2.breed_code GROUP BY T1.breed_code ORDER BY count(*) DESC LIMIT 1	dog_kennels
SELECT T2.breed_name FROM dogs AS T1 JOIN breeds AS T2 ON T1.breed_code  =  T2.breed_code GROUP BY T1.breed_code ORDER BY count(*) DESC LIMIT 1	dog_kennels
SELECT T2.owner_id ,  T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id JOIN Treatments AS T3 ON T2.dog_id  =  T3.dog_id GROUP BY T2.owner_id ORDER BY sum(T3.cost_of_treatment) DESC LIMIT 1;	dog_kennels
SELECT T2.owner_id ,  T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id JOIN Treatments AS T3 ON T2.dog_id  =  T3.dog_id GROUP BY T2.owner_id ORDER BY sum(T3.cost_of_treatment) DESC LIMIT 1	dog_kennels
SELECT T1.treatment_type_description FROM Treatment_Types AS T1 JOIN Treatments AS T2 ON T1.treatment_type_code  =  T2.treatment_type_code GROUP BY T2.treatment_type_code ORDER BY sum(T2.cost_of_treatment) ASC LIMIT 1	dog_kennels
SELECT T1.treatment_type_description FROM Treatment_Types AS T1 JOIN Treatments AS T2 ON T1.treatment_type_code  =  T2.treatment_type_code GROUP BY T2.treatment_type_code ORDER BY sum(T2.cost_of_treatment) ASC LIMIT 1	dog_kennels
SELECT T1.owner_id ,  T2.zip_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id JOIN Charges AS T3 ON T4.charge_id  =  T5.charge_id GROUP BY T1.owner_id ORDER BY sum(T3.charge_amount) DESC LIMIT 1	dog_kennels
SELECT T1.owner_id ,  T2.zip_code FROM Dogs AS T1 JOIN Owners AS T2 ON T1.owner_id  =  T2.owner_id JOIN Treatments AS T3 ON T1.dog_id  =  T3.dog_id GROUP BY T1.owner_id ORDER BY sum(T3.cost_of_treatment) DESC LIMIT 1	dog_kennels
SELECT T1.professional_id ,  T2.cell_number FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id  =  T2.professional_id GROUP BY T1.professional_id HAVING count(DISTINCT T1.treatment_type_code)  >=  2	dog_kennels
SELECT T1.professional_id ,  T2.cell_number FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id  =  T2.professional_id GROUP BY T1.professional_id HAVING count(*)  >=  2	dog_kennels
SELECT T1.first_name ,  T1.last_name FROM professionals AS T1 JOIN treatments AS T2 ON T1.professional_id  =  T2.professional_id WHERE T2.cost_of_treatment  <  (SELECT avg(cost_of_treatment) FROM treatments)	dog_kennels
SELECT DISTINCT T1.first_name ,  T1.last_name FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id  =  T2.professional_id WHERE T2.cost_of_treatment  <  (SELECT avg(cost_of_treatment) FROM treatments)	dog_kennels
SELECT T1.date_of_treatment ,  T2.first_name FROM treatments AS T1 JOIN professionals AS T2 ON T1.professional_id = T2.professional_id	dog_kennels
SELECT T1.date_of_treatment ,  T2.first_name FROM treatments AS T1 JOIN professionals AS T2 ON T1.professional_id = T2.professional_id	dog_kennels
SELECT T1.cost_of_treatment ,  T2.treatment_type_description FROM treatments AS T1 JOIN treatment_types AS T2 ON T1.treatment_type_code  =  T2.treatment_type_code	dog_kennels
SELECT T1.cost_of_treatment ,  T2.treatment_type_description FROM treatments AS T1 JOIN treatment_types AS T2 ON T1.treatment_type_code  =  T2.treatment_type_code	dog_kennels
SELECT T1.first_name ,  T1.last_name ,  T3.size_description FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id JOIN Sizes AS T3 ON T2.size_code  =  T3.size_code	dog_kennels
SELECT T1.first_name ,  T1.last_name ,  T3.size_description FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id JOIN Sizes AS T3 ON T2.size_code  =  T3.size_code	dog_kennels
SELECT T2.first_name ,  T1.name FROM Dogs AS T1 JOIN Owners AS T2 ON T1.owner_id = T2.owner_id	dog_kennels
SELECT T1.first_name ,  T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id	dog_kennels
SELECT T1.name ,  T2.date_of_treatment FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id  =  T2.dog_id WHERE T1.breed_code  =  (SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY count(*) ASC LIMIT 1)	dog_kennels
SELECT T1.name ,  T2.date_of_treatment FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id  =  T2.dog_id WHERE T1.breed_code  =  (SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY count(*) ASC LIMIT 1)	dog_kennels
SELECT T1.first_name ,  T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id WHERE T1.state  =  "VA"	dog_kennels
SELECT T1.first_name ,  T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id WHERE T1.state  =  "VA"	dog_kennels
SELECT T1.date_arrived ,  T1.date_departed FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id  =  T2.dog_id	dog_kennels
SELECT T1.date_arrived ,  T1.date_departed FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id  =  T2.dog_id	dog_kennels
SELECT T2.last_name FROM dogs AS T1 JOIN owners AS T2 ON T1.owner_id = T2.owner_id ORDER BY T1.date_of_birth DESC LIMIT 1	dog_kennels
SELECT T1.last_name FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id  =  T2.owner_id ORDER BY T2.date_of_birth DESC LIMIT 1	dog_kennels
SELECT email_address FROM professionals WHERE state  =  "HI" OR state  =  "WI"	dog_kennels
SELECT email_address FROM professionals WHERE state  =  "HI" OR state  =  "WI"	dog_kennels
SELECT date_arrived ,  date_departed FROM Dogs;	dog_kennels
SELECT date_arrived ,  date_departed FROM Dogs;	dog_kennels
SELECT count(DISTINCT dog_id) FROM treatments	dog_kennels
SELECT count(DISTINCT dog_id) FROM treatments	dog_kennels
SELECT count(DISTINCT professional_id) FROM treatments	dog_kennels
SELECT count(DISTINCT professional_id) FROM treatments	dog_kennels
SELECT role_code ,  street ,  city ,  state FROM Professionals WHERE city LIKE '%West%'	dog_kennels
SELECT role_code ,  street ,  city ,  state FROM professionals WHERE city LIKE '%West%'	dog_kennels
SELECT first_name ,  last_name ,  email_address FROM Owners WHERE state LIKE "%North%"	dog_kennels
SELECT first_name ,  last_name ,  email_address FROM Owners WHERE state LIKE "%North%"	dog_kennels
SELECT count(*) FROM dogs WHERE age  <  (SELECT avg(age) FROM dogs)	dog_kennels
SELECT count(*) FROM dogs WHERE age  <  (SELECT avg(age) FROM dogs)	dog_kennels
SELECT cost_of_treatment FROM treatments ORDER BY date_of_treatment DESC LIMIT 1	dog_kennels
SELECT cost_of_treatment FROM treatments ORDER BY date_of_treatment DESC LIMIT 1	dog_kennels
SELECT count(*) FROM dogs WHERE dog_id NOT IN ( SELECT dog_id FROM treatments )	dog_kennels
SELECT count(*) FROM dogs WHERE dog_id NOT IN ( SELECT dog_id FROM treatments )	dog_kennels
SELECT count(*) FROM owners WHERE owner_id NOT IN ( SELECT owner_id FROM dogs )	dog_kennels
SELECT count(*) FROM owners WHERE owner_id NOT IN ( SELECT owner_id FROM dogs )	dog_kennels
SELECT count(*) FROM professionals WHERE professional_id NOT IN ( SELECT professional_id FROM treatments )	dog_kennels
SELECT count(*) FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments)	dog_kennels
SELECT name ,  age ,  weight FROM Dogs WHERE abandoned_yn  =  1	dog_kennels
SELECT dog_name ,  age ,  weight FROM Dogs WHERE abandoned_yn  =  1	dog_kennels
SELECT avg(age) FROM Dogs	dog_kennels
SELECT avg(age) FROM Dogs	dog_kennels
SELECT age FROM dogs ORDER BY age DESC LIMIT 1	dog_kennels
SELECT age FROM dogs ORDER BY age DESC LIMIT 1	dog_kennels
SELECT charge_type ,  charge_amount FROM Charges	dog_kennels
SELECT charge_type ,  charge_amount FROM Charges	dog_kennels
SELECT charge_amount FROM charges ORDER BY charge_amount DESC LIMIT 1	dog_kennels
SELECT charge_amount FROM charges ORDER BY charge_amount DESC LIMIT 1	dog_kennels
SELECT email_address ,  cell_number ,  home_phone FROM professionals	dog_kennels
SELECT email_address ,  cell_number ,  home_phone FROM professionals	dog_kennels
SELECT DISTINCT breed_name ,  size_description FROM breeds AS T1 JOIN sizes AS T2 ON T1.breed_code  =  T2.size_code	dog_kennels
SELECT DISTINCT breed_type ,  size_type FROM Dogs AS T1 JOIN Breeds AS T2 ON T1.breed_code  =  T2.breed_code JOIN Sizes AS T3 ON T1.size_code  =  T3.size_code	dog_kennels
SELECT T2.first_name ,  T3.treatment_type_description FROM treatments AS T1 JOIN professionals AS T2 ON T1.professional_id  =  T2.professional_id JOIN treatment_types AS T3 ON T1.treatment_type_code  =  T3.treatment_type_code	dog_kennels
SELECT T2.first_name ,  T3.treatment_type_description FROM treatments AS T1 JOIN professionals AS T2 ON T1.professional_id  =  T2.professional_id JOIN treatment_types AS T3 ON T1.treatment_type_code  =  T3.treatment_type_code	dog_kennels
SELECT count(*) FROM singer	singer
SELECT count(*) FROM singer	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC	singer
SELECT name FROM singer ORDER BY Net_Worth_Millions ASC	singer
SELECT Birth_Year ,  Citizenship FROM singer	singer
SELECT Birth_Year ,  Citizenship FROM singer	singer
SELECT Name FROM SINGER WHERE Citizenship != "France"	singer
SELECT Name FROM singer WHERE Citizenship != "France"	singer
SELECT Name FROM singer WHERE Birth_Year  =  1948 OR Birth_Year  =  1949	singer
SELECT name FROM singer WHERE birth_year  =  1948 OR birth_year  =  1949	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1	singer
SELECT Citizenship ,  COUNT(*) FROM singer GROUP BY Citizenship	singer
SELECT Citizenship ,  COUNT(*) FROM singer GROUP BY Citizenship	singer
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1	singer
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1	singer
SELECT Citizenship ,  max(Net_Worth_Millions) FROM singer GROUP BY Citizenship	singer
SELECT citizenship ,  max(net_worth_millions) FROM singer GROUP BY citizenship	singer
SELECT T1.Title ,  T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID	singer
SELECT T1.Title ,  T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID	singer
SELECT DISTINCT T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID WHERE T1.Sales  >  300000	singer
SELECT DISTINCT T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID WHERE T1.Sales  >  300000	singer
SELECT T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T1.Singer_ID HAVING COUNT(*)  >  1	singer
SELECT T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T1.Singer_ID HAVING COUNT(*)  >  1	singer
SELECT T2.Name ,  sum(T1.Sales) FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T2.Name	singer
SELECT T2.Name ,  sum(T1.Sales) FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T2.Name	singer
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)	singer
SELECT name FROM singer WHERE singer_id NOT IN (SELECT singer_id FROM song)	singer
SELECT Citizenship FROM singer WHERE Birth_Year  <  1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year  >  1955	singer
SELECT Citizenship FROM singer WHERE Birth_Year  <  1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year  >  1955	singer
SELECT count(*) FROM Other_Available_Features	real_estate_properties
SELECT T1.feature_type_name FROM Ref_Feature_Types AS T1 JOIN Other_Available_Features AS T2 ON T1.feature_type_code  =  T2.feature_type_code WHERE T2.feature_name  =  "AirCon"	real_estate_properties
SELECT T2.property_type_description FROM Properties AS T1 JOIN Ref_Property_Types AS T2 ON T1.property_type_code  =  T2.property_type_code	real_estate_properties
SELECT property_name FROM properties WHERE property_type_code  =  "House" AND room_count  >  1 UNION SELECT property_name FROM properties WHERE property_type_code  =  "Apartment" AND room_count  >  1	real_estate_properties

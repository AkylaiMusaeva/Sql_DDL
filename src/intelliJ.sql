-- 30 таблица тузобуз: 10 IntelliJ IDEA, 10 pgAdmin, 10 Terminal аркылуу болсун
-- Таблицалар окшош эмес жана полелери да ар турдуу болсун
-- Constraint тер да кошулсун
-- Соссуз турдо бардык таблицаларга маанилер берилсин
-- Бири бири мн байланышкан да таблицалар болсун
-- PS. консоль гиттен жиберилбейт. sql файл ачып, ошол жака копировайтетип жонотунуздор. 3 башка файл болсун: intelliJ.sql, pgAdmin.sql, terminal.sql
CREATE TABLE clients(
                        id SERIAL PRIMARY KEY,
                        client_name VARCHAR,
                        client_surname VARCHAR,
                        email VARCHAR UNIQUE,
                        phone_number VARCHAR
);

CREATE TABLE staff(
                      id SERIAL PRIMARY KEY,
                      staff_name VARCHAR,
                      staff_surname VARCHAR,
                      staff_email VARCHAR UNIQUE,
                      staff_phone_number VARCHAR,
                      client_id INT REFERENCES clients(id)
);

CREATE TABLE director_of_department(
                                       id SERIAL PRIMARY KEY,
                                       director_name VARCHAR,
                                       director_surname VARCHAR,
                                       staff_id INT REFERENCES staff(id)
);

CREATE TABLE department (
                            id SERIAL PRIMARY KEY,
                            department_name VARCHAR,
                            department_description VARCHAR,
                            director_of_department_id INT REFERENCES director_of_department(id)
);

CREATE TABLE company(
                        id SERIAL PRIMARY KEY,
                        company_name VARCHAR,
                        foundation_year INT,
                        department_id INT REFERENCES department(id)
);

CREATE TABLE entrepreneur(
                             id SERIAL PRIMARY KEY,
                             entpr_name VARCHAR,
                             nation VARCHAR,
                             capital INT,
                             company_id INT REFERENCES company(id)
);

CREATE TABLE part_of_the_city(
                                 id SERIAL PRIMARY KEY ,
                                 part_of_the_city_name VARCHAR,
                                 entrepreneur_id INT REFERENCES entrepreneur(id)
);

CREATE TABLE city (
                      id SERIAL PRIMARY KEY,
                      city_name VARCHAR,
                      part_of_the_city_id INT REFERENCES part_of_the_city(id)
);

CREATE TABLE country(
                        id SERIAL PRIMARY KEY,
                        country_name VARCHAR,
                        city_id INT REFERENCES city(id)
);

CREATE TABLE continent(
                          id SERIAL PRIMARY KEY,
                          continent_name VARCHAR,
                          country_id INT REFERENCES country(id)
);




INSERT INTO clients(client_name, client_surname, email, phone_number)
VALUES ('Asan','Asanov','asan@gmail.com','+996777123456'),
       ('Beksultan','Beksultanov','beksultan@gmail.com','+996772457148'),
       ('Viktor','Viktorov','victor@gmail.com','+9960558748956'),
       ('Dilan','Dilanov','dilan@gmail.com','05524569878'),
       ('Esen','Esenov','esen@gmail.com','0222548796'),
       ('Farhat','Farhatov','farhat@gmail.com','02256874587'),
       ('Goldosh','Goldoshov','goldosh@gmail.com','0998748758'),
       ('Hilal','Hilalov','hilal@gmail.com','0775874569');

INSERT INTO staff(staff_name, staff_surname, staff_email, staff_phone_number, client_id)
VALUES ('Islam','Islamov','islam@gmail.com','0223456545',1),
       ('Jolaman','Jolamanov','jolaman@gmail.com','0221212121',2),
       ('Kamilla','Kamilova','kamila@gmail.com','0223654578',3),
       ('Liliya','Liliyava','liliya@gmail.com','0556987414',4),
       ('Malika','Malikova','malika@gmail.com','0779874525',5),
       ('Nazar','Nazarov','nazar@gmail.com','0708915878',6);

INSERT INTO director_of_department(director_name, director_surname, staff_id)
VALUES ('Ormon','Ormonov',1),
       ('Piter','Piterov',2),
       ('Ruslan','Ruslanov',3),
       ('Stalbek','Stalbekov',4);


INSERT INTO department(department_name, department_description, director_of_department_id)
VALUES ('HR','HR hires employees',1),
       ('SMM','SMM makes content',2),
       ('Development','Development develops programs',3),
       ('Security','Security guards city',4);

INSERT INTO company(company_name, foundation_year, department_id)
VALUES ('Microsoft Corp',1975,3),
       ('Pixar',1968,2),
       ('Protect',1998,4),
       ('Coca cola',1930,1);


INSERT INTO entrepreneur(entpr_name, nation, capital, company_id)
VALUES ('John Stith Pemberton ','american',120000,4),
       ('George Lucas','australian',250640,2),
       ('Bill Gates','american',460542,1),
       ('Somebody','kyrgyz',25645,3);;

INSERT INTO part_of_the_city(part_of_the_city_name, entrepreneur_id)
VALUES ('Leninskyi district',4),
       ('Richmond district',2),
       ('Atlanta district',1),
       ('Albuquerque district',3);

INSERT INTO city(city_name, part_of_the_city_id)
VALUES ('Bishkek',1),--asia
       ('Valencia',4),--south
       ('California',2),--north
       ('Stockholm',3);--europe

INSERT INTO country(country_name, city_id)
VALUES('Sweden',4),
      ('Havana',2),
      ('Kyrgyzstan',1),
      ('USA',3);

INSERT INTO continent(continent_name, country_id)
VALUES ('North America',4),
       ('South America',2),
       ('Asia',3),
       ('Europe',1);



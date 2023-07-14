-- 30 таблица тузобуз: 10 IntelliJ IDEA, 10 pgAdmin, 10 Terminal аркылуу болсун
-- Таблицалар окшош эмес жана полелери да ар турдуу болсун
-- Constraint тер да кошулсун
-- Соссуз турдо бардык таблицаларга маанилер берилсин
-- Бири бири мн байланышкан да таблицалар болсун
-- PS. консоль гиттен жиберилбейт. sql файл ачып, ошол жака копировайтетип жонотунуздор. 3 башка файл болсун: intelliJ.sql, pgAdmin.sql, terminal.sql

Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Пароль пользователя postgres:
psql (15.3)
ПРЕДУПРЕЖДЕНИЕ: Кодовая страница консоли (866) отличается от основной
                страницы Windows (1251).
                8-битовые (русские) символы могут отображаться некорректно.
                Подробнее об этом смотрите документацию psql, раздел
                "Notes for Windows users".
Введите "help", чтобы получить справку.

postgres=#  create table actors(id serial primary key,name);
ОШИБКА:  ошибка синтаксиса (примерное положение: ")")
СТРОКА 1: create table actors(id serial primary key,name);
^
postgres=# create table actors(id serial primary key,name varchar(50)not null);
CREATE TABLE
    postgres=# insert table actors(name)values('Asan'),('Baizak'),('Vladimir'),('Dolotbek');
ОШИБКА:  ошибка синтаксиса (примерное положение: "table")
СТРОКА 1: insert table actors(name)values('Asan'),('Baizak'),('Vladimi...
                 ^
postgres=#  insert actors(name)values('Asan'),('Baizak'),('Vladimir'),('Dolotbek');
ОШИБКА:  ошибка синтаксиса (примерное положение: "actors")
СТРОКА 1: insert actors(name)values('Asan'),('Baizak'),('Vladimir'),('...
                 ^
postgres=#  insert into  actors(name)values('Asan'),('Baizak'),('Vladimir'),('Dolotbek');
INSERT 0 4
postgres=# create table manager(id serial primary key,name varchar(50) not null,actor_id int references actors(id));
CREATE TABLE
postgres=# alert table manager rename manager to managers;
ОШИБКА:  ошибка синтаксиса (примерное положение: "alert")
СТРОКА 1: alert table manager rename manager to managers;
          ^
postgres=# alter table manager rename manager to managers;
ОШИБКА:  столбец "manager" не существует
postgres=# alter table manager to managers;
ОШИБКА:  ошибка синтаксиса (примерное положение: "to")
СТРОКА 1: alter table manager to managers;
                              ^
postgres=# alter table manager managers;
ОШИБКА:  ошибка синтаксиса (примерное положение: "managers")
СТРОКА 1: alter table manager managers;
                              ^
postgres=# alter table manager rename to managers;
ALTER TABLE
postgres=# insert into managers(name,actor_id)values('Elena',4),('Catrine',3),('Farida',2),('George',1);
INSERT 0 4
postgres=#      create table departments(id serial primary key,name varchar not null,staff_count int not null,manager_id int references managers(id));
CREATE TABLE
postgres=# insert into departments(name,staff_count,manager_id)values('drama',5,3),('thriller',4,1),values('historical',7,2),('cartoon',9,4);
ОШИБКА:  ошибка синтаксиса (примерное положение: "values")
СТРОКА 1: ...t,manager_id)values('drama',5,3),('thriller',4,1),values('hi...
                                                               ^
postgres=#  insert into departments(name,staff_count,manager_id)values('drama',5,3),('thriller',4,1),('historical',7,2),('cartoon',9,4);
INSERT 0 4
postgres=# create table company(id serial primary key,name varchar(50) not null,staff_count int not null,rating numeric);
ОШИБКА:  отношение "company" уже существует
postgres=# create table companies(id serial primary key,name varchar(50) not null,staff_count int not null,rating numeric);
CREATE TABLE
postgres=# insert into companies(name,staff_count,rating)values('netflix',4,5.5),('pixar',3,3.5),('disney',7,4.5);
INSERT 0 3
postgres=# create table corporations(id serial primary key,name varchar(50) not null);
CREATE TABLE
postgres=# insert into corporation(name)values('corp.1'),('corp.2'),('corp.3');
ОШИБКА:  отношение "corporation" не существует
СТРОКА 1: insert into corporation(name)values('corp.1'),('corp.2'),('c...
                      ^
postgres=# insert into corporations(name)values('corp.1'),('corp.2'),('corp.3');
INSERT 0 3
postgres=#
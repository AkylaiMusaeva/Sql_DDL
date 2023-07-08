create table country1(
                         id serial primary key,
                         name varchar(20) not null unique ,
                         name_continet continent not null,
                         city_id int references city1(id))

alter table country1 drop column name_continet

    insert into country1(name,city_id)
values ('Australia',5),
		('South Korea',4),
		('England',6),
		('Kyrgyzstan',1),
		('North America',3),
		('South America',7),
		('Kazakhstan',2)
------------------------------------------------------
create table city1 (
                       id serial primary key,
                       name varchar(50) not null,
                       population numeric not null,
                       company_id int references company1(id))

    insert into city1(name,population,company_id)
values ('Bishek',3.5,1),
		('Almaty',6.5,7),
		('California',26.4,4),
		('Seoul',35.3,5),
		('Sydney',27.3,2),
		('London',46.5,3),
		('Puerto Rico',38.9,6)
------------------------------------------------------
create table company1(
                         id serial primary key,
                         name varchar(50) not null,
                         foundation_date date not null,
                         artist_id int references artist(id))

    insert into company1(name,foundation_date,artist_id)
values	('Pastry cook company','2011-12-14',6),
		('Photo company','1998-12-25',4),
		('Cook community company','211-5-14',2),
		('Marvel studios','1991-7-14', 3),
		('Netflix corp.','1994-6-3',5),
		('Music Record corp.','2013-6-13',1),
		('Fashion company','2014-4-14',7)

------------------------------------------------------
create table artist(
                       id serial primary key,
                       name varchar(50) not null,
                       last_name varchar(50) not null,
                       age int,
                       nation varchar(50) not null,
                       artist_proffession varchar(50) not null,
                       experience_year int,
                       work_name int references work_name(id))

alter table artist rename column nation to nationality

    insert into artist(name,last_name,age,nationality,artist_proffession,experience_year,work_name)
    values  ('Luis','Fonsi',36,'puerto-rican','singer',8,1),
    ('Gordon','Ramsey',62,'britain','cook',18,7),
    ('Robert','Downey Jr',66,'american','actor',26,2),
    ('Mark','Hasley',47,'australian','photographer',5,6),
    ('Jung','Hoyeon',26,'korean','model/actress',6,3),
    ('Sabina','Temiralieva',32,'kyrgyz','pastry cook',6,5),
    ('Kunduz','Zholdosheva',52,'kazakh','designer',14,4)

------------------------------------------------------

create table work_name(
                          id serial primary key,
                          name varchar(50) not null,
                          release_date date not null,
                          rank_of_succeed numeric not null)

    insert into work_name(name,release_date,rank_of_succeed)
values  ('Despasito','2017-06-17',5.0),
		('Avengers.The final.','2018-12-12',5.0),
		('Squid game','2021-09-1',4.5),
		('Spring-Summer collection','2022-05-14',3.5),
		('Macarons','2020-12-15',3.0),
		('Dicover nature photobook','2023-10-10',5.1)
delete from work_name where id = 8
update work_name set name='Traditional cook book',
                     release_date='2016-7-18',
                     rank_of_succeed=4.6 WHERE ID=7

-----------------------------------------------------------------------------------------------------
create table book (
                      id serial primary key,
                      name varchar(50) not null,
                      genre varchar(50) not null,
                      release_year int)

    insert into book (name,genre,release_year)
values  ('Atomic habits','psychology',2011),
		('The Gifts of Imperfection','psychology',2014),
		('Mindset','psychology',2010),
		('The Daily Stoic','psychology',1994),
		('Feeling Good: The New Mood Therapy','psychology',2008),
		('Meditation','psychology',1997),
		('The Happiness','psychology',2003),
		('If You are So Smart, Why Are You Not Happy?','psychology',2003)

alter table author add column pages int
alter table author drop column pages
alter table book add column pages int

update book set pages=391 where id=8

create table author(
                       id serial primary key,
                       full_name varchar(50),
                       age int,
                       book_id int references book(id))



    insert into author(full_name,age,book_id)
values ('Ryan Holiday',62,4),
		('James Clear',41,1),
		('Brené Brown',36,2),
		('Carol Dweck',67,3),
		('Marcus Aurelius',37,6),
		('David D Burns',25,5),
		('Raj Raghunathan',36,8),
		('Russ Hurris',45,7)
delete from author full_name where id =8
    insert into author (full_name,age,book_id) values('Roby Kim',36,7)
---------------------------------------------------------------------------------
create table shop(
                     id serial primary key,
                     name varchar(50) not null,
                     address varchar(50) not null
)
    insert into shop(name,address)values('flower shop','ahunbaev 187'),
									('meat shop','djal 29'),
									('kids shop','dordoi k-47'),
									('pastry shop','orozbekov 46')

alter table shop rename to shops

create table workers(
                        id serial primary key,
                        name varchar(50),
                        age int,
                        year_of_working numeric,
                        shop_id int references shops(id))

    insert into workers(name,age,year_of_working,shop_id)values
('Asan',24,4.5,4),
('Uson',36,1.5,2),
('Talgat',45,0.5,3),
('Anara',29,3.5,1),
('Kumar',41,1.2,2)

update workers set name='Tumar' where id=5
delete from workers  where id=5

create table proffessions(
                             id serial primary key,
                             name varchar(50),
                             rank int
)
alter table proffessions rename rank to perspectivity
alter table proffessions alter column perspectivity type numeric
alter table proffessions add column
    insert into proffessions (name,perspectivity)values ('teacher',4.5),
													('lawyer',4.5),
													('scientist',5),
													('translator',5)

alter table workers add column proffession_id int references proffessions(id)
update workers set proffession_id=1 where id=4
update workers set proffession_id=3 where id=1
update workers set proffession_id=4 where id=2
update workers set proffession_id=2 where id=3
























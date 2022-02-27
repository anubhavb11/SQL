create database record_company;

--  How we create a table in database sample 
use record_company;
create table test (
	test_column int
);
alter table test 
add another_column varchar(255) ;
drop table test;

-- lets create a table of bands that will never contain the null value
use record_company;
create table bands(
	id INT not null auto_increment,  -- primary key 
    name varchar(255) not null,
    primary key (id) 
);

create table albums (
	id INT not null auto_increment,
    name varchar(255) not null,
    release_year INT, 
    band_id int not null,  
    primary key (id),
    foreign key (band_id) references bands(id)  -- here band id is acting as a foregin key to link it with other tab;e primary key 
);

insert into bands(name)   -- inserting to bands table
values ('maroon5');

insert into bands(name)
values ('Deuce') , ('Iron Maiden') , ('Ankor');

select * from bands;

select * from bands limit 3;

select name from bands limit 2;

select id as 'ID' , name AS 'Band Name' from bands;

select * from bands order by name;  -- defaault is ascending 

select * from bands order by name desc;

insert into albums (name, release_year, band_id) -- inserting to albums table 
values('abc' , 1985, 1), 
('def', 1234 , 1),
('nightmare', 2018, 2),
('nightmare',2010, 3),
('test', NULL, 3);

select * from albums;

select distinct name from bands;
select distinct name from albums;
update albums 
set release_year = 1912
where id = 1;

select * from albums
where release_year > 2000;

select distinct name from albums 
where name like '%a%';

select * from albums 
where release_year = 2010 and band_id = 1;
select * from albums 
where release_year = 2010 or band_id = 1;

select * from albums 
where release_year between 2010 and 2018;  -- include both start and ending 

delete from albums where id = 2 or  id = 1; -- this will delete both 

-- JOINS
select * from bands
 join albums on bands.id = albums.band_id;  -- iner join 
 select * from bands
 right join albums on bands.id = albums.band_id;  -- right join  - keep everyjthing on the right
 select * from bands
 left join albums on bands.id = albums.band_id;  -- left join  - keep everything on the left 
 
-- Aggregate functions 
select avg(release_year) from albums;
select sum(release_year) from albums;

select band_id, count(band_id) from albums 
group by band_id;                 -- goup by take all of ther record and group by that colums 












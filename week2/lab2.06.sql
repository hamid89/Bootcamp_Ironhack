#1
select distinct release_year from sakila.film;
# 2
select title from sakila.film
where title like '%ARMAGEDDON%';
# 3 
select title from sakila.film
where title like '%APOLLO';
#4
select title from sakila.film
order by length desc
limit 10;
#5
select count(*) from sakila.film
where special_features like '%Behind the Scenes%';
#6
alter table skila.staff drop column picture;
# 7
select * from sakila.customer
where first_name = 'TAMMY' and last_name = 'SANDERS';
insert into sakila.staff(first_name, last_name, email, address_id, store_id, username)
values('TAMMY','SANDERS', 'TAMMY.SANDERS@sakilacustomer.org', 640, 2, 'tammy');
#8
select customer_id from sakila.customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
select film_id from sakila.film where title = 'ACADEMY DINOSAUR';
select inventory_id from sakila.inventory where film_id = 1;
select * from sakila.staff;
insert into sakila.rental(rental_date, inventory_id, customer_id, staff_id)
values (curdate(), 1, 130, 1);
select curdate();
#9
select * from sakila.customer
where active = 0;
drop table if exists deleted_users;
CREATE TABLE deleted_users (
customer_id int UNIQUE NOT NULL,
email varchar(255) UNIQUE NOT NULL,
delete_date date
);
insert into deleted_users
select customer_id, email, curdate()
from sakila.customer
where active = 0;
select * from deleted_users;
delete from sakila.customer where active = 0;
select * from skila.customer
where active = 0;

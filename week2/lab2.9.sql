drop table if exists rentals_may;
CREATE TABLE rentals_may (
may_id int UNIQUE NOT NULL AUTO_INCREMENT,
rental_date datetime,
inventory_may INT,
customer_id_may  INT,
return_date_may datetime
);
#where it is coming from
select * from rentals_may;
INSERT INTO rentals_may
SELECT rental_id,rental_date, inventory_id, customer_id, return_date 
from sakila.rental
where rental_date between '2005-05-01' and '2005-05-31';
########## June
drop table if exists rentals_june;
CREATE TABLE rentals_june (
june_id int UNIQUE NOT NULL AUTO_INCREMENT,
rental_date datetime,
inventory_june INT,
customer_id_june  INT,
return_date_june datetime
);
INSERT INTO rentals_june
SELECT rental_id,rental_date, inventory_id, customer_id, return_date #where it is coming from
from sakila.rental
where rental_date between '2005-06-01' and '2005-06-30';
select * from rentals_june;
######## rentals per customer May
select COUNT(return_date_may), customer_id_may
from sakila.rentals_may
group by customer_id_may
order by COUNT(return_date_may) asc;
######## rentals per customer June
select COUNT(return_date_june), customer_id_june
from sakila.rentals_june
group by customer_id_june
order by COUNT(return_date_june) asc;

Instructions
1.	Review the tables in the database.
2.	Explore tables by selecting all columns from each table or using the in built review features for your client. 
select *
from sakila.film;
select *
from sakila.actor;
select *
from sakila.address;
select *
from sakila.category;
select *
from sakila.city;
select *
from sakila.country;
select *
from sakila.customer;
3.	Select one column from a table. Get film titles.
select title
from sakila.film;
4.	Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
SELECT DISTINCT(name) AS 'Language'
FROM sakila.language;
5.	Using the select statements and reviewing how many records are returned, can you find out how many stores and staff does the company have? Can you return a list of employee first names only?
SELECT COUNT(store_id) AS 'Number of stores'
FROM sakila.store;

SELECT first_name  AS 'Staff First Name'
FROM sakila.staff;
6.	Bonus: How many unique days did customers rent movies in this dataset?
SELECT SUM(DISTINCT(rental_duration))
FROM sakila.film;

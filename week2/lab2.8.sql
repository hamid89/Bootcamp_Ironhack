#1.	Rank films by length (filter out the rows that have nulls or 0s in length column).
#In your output, only select the columns title, length, and the rank.
SELECT title, length, rank () over (order by title) AS 'Rank'
FROM sakila.film
WHERE length is not NULL and length <> 0;
#2.	Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column).
#In your output, only select the columns title, length, rating and the rank.
SELECT title, length, rating, rank () over (partition by rating order by length desc) AS 'Rank'
FROM sakila.film
WHERE length is not NULL and length <> 0
ORDER BY length;
#3.	How many films are there for each of the categories in the category table. Use appropriate join to write this query
select * from category;
#can also do using(film_id)
#inner join sakila.category as ca on fca.category_id = ca.category_id
SELECT COUNT(title.fi), category_id.ca,
FROM sakila.film fi
inner join sakila.film_category fca on fi.film_id = fca.film_id  
GROUP BY COUNT(title.fi);


#4.	Which actor has appeared in the most films?
SELECT t1.actor_id, COUNT(t2.film_id) as total_films
FROM actor t1
join film_actor t2 on t2.actor_id = t1.actor_id
GROUP BY t1.actor_id
ORDER BY total_films desc;
#5.	Most active customer (the customer that has rented the most number of films)
SELECT customer_id, COUNT(return_date), COUNT(rental_date)
FROM sakila.rental
GROUP BY customer_id
ORDER BY COUNT(return_date) DESC;
select *
from bank.account as acc
inner join bank.loan as loa on acc.account_id = loa.account_id
order by acc.account_id;
SELECT t1.dt2, t2.dt4, t2.dt5, t2.dt3 #get dt3 data from table2
FROM table1 t1, table2 t2
#Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement.
SELECT t1.title, COUNT(rental_id) as rentals
FROM sakila.film t1
inner join sakila.rental t2 on inventory_id = inventory_id
GROUP BY film_id
ORDER BY rentals DESC;

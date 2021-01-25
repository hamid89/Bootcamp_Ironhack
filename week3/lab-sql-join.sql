-- # Lab | SQL Join

-- 1. List number of films per `category`.
select
	category_id,
	count(*) as count
from sakila.film_category
group by category_id;

-- 2. Display the first and last names, as well as the address, of each staff member.
SELECT
st.first_name,
st.last_name,
ad.address
FROM sakila.staff as st
join sakila.address as ad using (address_id);

-- 3. Display the total amount rung up by each staff member in August of 2005.
select
	st.staff_id,
    st.first_name,
    st.last_name,
    sum(py.amount) as sum_amount
from sakila.staff as st
join sakila.payment as py using (staff_id)
where payment_date between '2005-08-01' and '2005-08-31'
group by staff_id;

-- 4. List each film and the number of actors who are listed for that film.
select
fl.title,
count(ac.actor_id) as n_of_actors
from sakila.film as fl
join sakila.film_actor as ac using (film_id)
group by fl.film_id;

-- 5. Using the tables `payment` and `customer` and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select
cs.last_name,
sum(py.amount) as total_payment
from sakila.payment as py
join sakila.customer as cs using (customer_id)
group by py.customer_id
order by cs.last_name;
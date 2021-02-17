
#..1
select distinct(r.customer_id), a.first_name, a.last_name, a.email
from customer a 
inner join `rental` r on 
a.`customer_id` = r.`customer_id`;

#.. 2
select  a.customer_id, CONCAT(a.first_name,' ',a.last_name) as name , avg(p.amount) as amount, a.email
from customer a
inner join `payment` p on
a.`customer_id` = p.`customer_id`
group by  a.customer_id
order by amount;
#..3
select * from customer c join 
rental r on 
c.`customer_id` = r.`customer_id` 
join `inventory` i on 
r.`inventory_id` = i.`inventory_id` 
join film_category f on 
i.`film_id` = f.`film_id` 
join  `category` g on 
f.`category_id` = g.`category_id`
where f.name = 'Action'
group by customer_name, email;
#... alternative 
select CONCAT(last_name,' ',first_name)  as Name, email as email
from customer
where customer_id in (
						select customer_id 
                        from rental
                        where inventory_id in (
												select inventory_id
                                                from inventory
                                                where film_id in (
																	select film_id
                                                                    from film_category
                                                                    where category_id in (
																							select category_id
                                                                                            from category
                                                                                            where name = 'Action'
                                                                                            )
																	)
												)
						)
group by customer_id
order by Name; 

#4.... 

select *, (case when amount < 2 Then 'Low' when amount > 4 Then 'High' ELSE 'medium' end) as Payment_class
from payment;

     



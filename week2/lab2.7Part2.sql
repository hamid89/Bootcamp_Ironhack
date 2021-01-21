# 1
select COUNT(`first_name`), `last_name` from `sakila`.`actor`
 
group by `last_name`
having count(`first_name`) = 1;
#2
select COUNT(`first_name`), `last_name` from `sakila`.`actor`
 
group by `last_name`
having count(`first_name`) > 1;
#3
select count(`return_date`), `staff_id` from sakila.`rental`
group by staff_id;
#4
select count(title), `release_year` from `sakila`.film
group by `release_year` ;
#5
select count(title), `rating` from `sakila`.film
group by rating ;
#6
select ROUND(AVG(`length`), 2), `rating` from `sakila`.film
group by rating ;
#7
select ROUND(AVG(`length`), 2), `rating` from `sakila`.film
where length > 120
group by rating; 


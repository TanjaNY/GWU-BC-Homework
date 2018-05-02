#1a
select first_name,last_name
from actor;

#1b
select upper(concat(first_name," ",last_name)) as actor_name 
from actor;

#2a
select actor_id,first_name,last_name
from actor where
first_name like 'Joe';

#2b
select actor_id, first_name, last_name
from actor where
last_name like '%GEN%';

#2c
select actor_id, first_name, last_name
from actor where
last_name like '%LI%'
order by last_name, first_name;

#2d
select country_id,country
from country
where country_id in (Afghanistan, Bangladesh, China);

#3a
alter table actor add column middle_name varchar(45) not null after first_name;

#3b

alter table actor drop column middle_name;

#4a
select last_name, count(last_name) from actor
group by last_name;

#4b
select last_name, count(last_name) from actor
group by last_name
having count(last_name)>1;

#4c
update actor
set first_name='HARPO'
where upper(concat(first_name," ",last_name))='GROUCHO WILLIAMS'; 

#4d
UPDATE actor 
   SET first_name = CASE WHEN first_name = 'HARPO' THEN 'GROUCHO' ELSE 'MUCHO GROUCHO'  END
 WHERE actor_id = 172 ;



#5a
SHOW CREATE TABLE address;

#6a
select first_name, Last_name, address 
from address a
join staff s on a.address_id=s.address_id;

#6b
select first_name, last_name, sum(p.amount) as total_amount
from staff s 
join payment p on p.staff_id = s.staff_id 
where p.payment_date like '%2005-08%' 
group by last_name;

#6c
select title,count(actor_id)
from film f
inner join film_actor a on f.film_id=a.film_id
group by title;


#6d
select count(i.film_id), title
from inventory i
join film f on i.film_id=f.film_id
where title='Hunchback Impossible'
group by title; 

#6e
select sum(amount), c.first_name, c.last_name
from payment p
join customer c on p.customer_id=c.customer_id
group by c.customer_id
order by last_name;

#7a
select title 
from film
where language_id in
(select language_id
from language
where name like 'English')
and title like 'Q%' or title like 'K%';

#7b
select first_name, last_name
from actor
where actor_id in
(select actor_id
from film_actor
where film_id in
(select film_id
from film
where title like 'ALONE TRIP'));

#7c
select first_name, last_name
from customer c
join address a on a.address_id=c.address_id
join city ct on ct.city_id=a.city_id
join country cn on cn.country_id=ct.country_id
where country like 'Canada';

#7d
select title
from film f
join film_category c on f.film_id=c.film_id
join category ct on ct.category_id=c.category_id
where name like 'Family';

#7e
select title, r.return_date
from rental r
join inventory i on r.inventory_id=i.inventory_id
join film f on f.film_id=i.film_id
order by r.return_date desc;

#7f
select sum(amount),st.store_id
from payment p
join staff s on p.staff_id=s.staff_id
join store st on st.store_id=s.store_id
group by st.store_id;

#7g
select store_id, c.city, ct.country
from store s 
join address a on s.address_id=a.address_id
join city c on a.city_id=c.city_id
join country ct on ct.country_id=c.country_id;

#7h
select sum(p.amount) as total_amount,c.name
from payment p 
join rental r on p.rental_id=r.rental_id
join inventory i on i.inventory_id=r.inventory_id
join film_category fc on i.film_id=fc.film_id
join category c on fc.category_id=c.category_id
group by c.name
order by total_amount desc limit 5;

#8a
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `8a` AS
    SELECT 
        SUM(`p`.`amount`) AS `total_amount`, `c`.`name` AS `name`
    FROM
        ((((`payment` `p`
        JOIN `rental` `r` ON ((`p`.`rental_id` = `r`.`rental_id`)))
        JOIN `inventory` `i` ON ((`i`.`inventory_id` = `r`.`inventory_id`)))
        JOIN `film_category` `fc` ON ((`i`.`film_id` = `fc`.`film_id`)))
        JOIN `category` `c` ON ((`fc`.`category_id` = `c`.`category_id`)))
    GROUP BY `c`.`name`
    ORDER BY `total_amount` DESC
    LIMIT 5
    
#8b

SHOW CREATE VIEW 8a;

#8c
DROP VIEW 8a;









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
update actor
set first_name='GROUCHO'


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








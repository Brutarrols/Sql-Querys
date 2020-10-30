--Consulta 1--
select customer.first_name, customer.last_name, customer.email
from customer
left join address
on customer.address_id = address.address_id
where address.city_id = 312;

--Consulta 2--
select film.title, film.description, film.release_year, film.rental_rate, film.special_features, category.name
from film
inner join film_category
on film.film_id = film_category.film_id
inner join category
on film_category.category_id = category.category_id
where category.category_id = 5;

--Consulta 3--
select actor.actor_id, actor.first_name, film.title, film.description, film.release_year
from actor
left join film_actor
on film_actor.actor_id = actor.actor_id
join film
on film.film_id = film_actor.film_id
where film_actor.actor_id = 5;

--Consulta 4--
select customer.first_name, customer.last_name, customer.email, address.address
from customer
left join address
on customer.address_id = address.address_id
where city_id = 1
and store_id = 1
or city_id = 42
or city_id = 312
or city_id = 459;

--Consulta 5--
select film.title, film.description, film.release_year, film.rating, film.special_features
from film
left join film_actor
on film.film_id = film_actor.film_id
left join actor
on film_actor.actor_id = actor.actor_id
where actor.actor_id  = 15
and film.rating = 'G'
and special_features like '%Behind the Scenes%';

--Consulta 6--
select film.film_id as numero_pelicula, film.title, actor.actor_id as numero_actor, actor.first_name as nombre_actor
from film
left join film_actor
on film.film_id = film_actor.film_id
left join actor
on actor.actor_id = film_actor.actor_id
where film_actor.film_id = 369;

--Consulta 7--
select film.title, film.description, film.release_year, film.rating, film.special_features, category.name
from film
left join film_category
on film.film_id = film_category.film_id
left join category
on film_category.category_id = category.category_id
where film.rental_rate = 2.99
and category.name = 'Drama';

--Consulta 8--
select film.title, film.description, film.release_year, film.rating, film.special_features, category.name, actor.first_name, actor.last_name
from actor
left join film_actor
on actor.actor_id = film_actor.actor_id
left join film
on film_actor.film_id = film.film_id
left join film_category
on film_category.film_id = film.film_id
left join category
on film_category.category_id = category.category_id
where category.name = 'action'
and actor.first_name = 'sandra'
AND actor.last_name = 'kilmer';
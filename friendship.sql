use amigos;

SELECT  users.first_name, users.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name
FROM users
LEFT JOIN friendships ON friendships.user_id = users.id
LEFT JOIN users as user2 ON  user2.id = friendships.friend_id;

--Consulta 1--
SELECT  users.first_name, users.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name
FROM users
LEFT JOIN friendships ON friendships.user_id = users.id
LEFT JOIN users as user2 ON  user2.id = friendships.friend_id
where users.first_name = 'Kermit';

--Consulta 2--
select sum(friendships.id) as total from friendships;

--Consulta 3--

select first_name, last_name, max(total_amigos) from (
select users.first_name, users.last_name, count(friendships.user_id) as total_amigos
from users
JOIN friendships on friendships.user_id = users.id
left join users as user2 on friendships.friend_id = user2.id
group by friendships.user_id) as Ariel;

--Consulta 4--
insert into users (first_name, last_name, created_at, updated_at)
values ('Elvis', 'Ko', now(), now()); 

insert into friendships (user_id, friend_id, created_at, updated_at)
values (6,2, now(),now());
insert into friendships (user_id, friend_id, created_at, updated_at)
values (6,4, now(),now());
insert into friendships (user_id, friend_id, created_at, updated_at)
values (6,5, now(),now());

--Consulta 5--
SELECT  users.first_name, users.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name
FROM users
LEFT JOIN friendships ON friendships.user_id = users.id
LEFT JOIN users as user2 ON  user2.id = friendships.friend_id
where users.first_name = 'Eli'
order by friend_last_name asc;

--Consulta 6--
delete from friendships where user_id = 2 and friend_id = 4;

--Consulta 7--
SELECT  users.first_name, users.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name
FROM users
LEFT JOIN friendships ON friendships.user_id = users.id
LEFT JOIN users as user2 ON  user2.id = friendships.friend_id;

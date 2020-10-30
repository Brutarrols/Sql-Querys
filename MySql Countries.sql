
-- consulta 1 --
select countries.name, languages.language, languages.percentage
from countries
left join languages
on countries.id = languages.country_id
where language = 'slovene'
order by languages.percentage desc;

--consulta 2--
select countries.name as pais, count(cities.name) as  Numero_ciudad
from countries
inner join cities
on countries.id = cities.country_id
group by countries.id
order by Numero_ciudad desc;

--consulta 3--
select name , population 
from cities
where country_id = 136
and cities.population > 500000
order by cities.population desc;

--consulta 4--
select countries.name, languages.language, languages.percentage
from countries, languages
where languages.percentage > 89
order by languages.percentage desc;

--consulta 5--
select * 
from countries
where surface_area < 501
and population > 100000;


--consulta 6--
select * 
from countries 
where government_form = 'Constitutional Monarchy'
and capital >200
and life_expectancy > 75;

--consulta 7--
select countries.name as pais, cities.name, cities.district, cities.population
from countries, cities
where cities.population > 500000
and countries.id = 9
and district = 'Buenos Aires';

--consulta 8--
select region, count(id) as cantidad_paises 
from countries
group by region
order by cantidad_paises desc;

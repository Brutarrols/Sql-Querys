--Consulta 1--
select sum(amount) as total_marzo 
from billing 
where charged_datetime <= '2012/03/31'
and charged_datetime >= '2012/03/01';

--Consulta 2--
select clients.first_name, clients.last_name, sum(amount) as recaudado
from clients
left join billing on billing.client_id = clients.client_id
where clients.client_id = 2;

--Consulta 3--
select clients.first_name, clients.last_name, count(sites.domain_name) as total_dominios
from clients
left join sites on sites.client_id = clients.client_id;
where clients.client_id = 10;

--Consulta 4--
--4. ¿Qué consulta ejecutaría para obtener el número total de sitios creados por mes por año para el cliente con una identificación de 1? ¿Qué pasa con el cliente = 20?--
use lead_gen_business;
select client_id, count(sites.site_id), monthname(created_datetime), year(created_datetime)
from sites
where sites.client_id = 1
or sites.client_id = 20
group by concat(year(created_datetime), month(created_datetime)) 
order by created_datetime asc;
--year()
--month()

--Consulta 5--
use lead_gen_business;
select sites.domain_name, count(leads.leads_id) as paginas, concat(year(leads.registered_datetime)," ", monthname(leads.registered_datetime),", ",day(leads.registered_datetime)) as fecha
from sites
left join leads on sites.site_id = leads.site_id
where leads.registered_datetime >= '2011/01/01'
and leads.registered_datetime <= '2011/02/15'
group by leads.leads_id
order by leads.registered_datetime asc;

--Consulta 6--
use lead_gen_business;
select concat(clients.first_name, " ",clients.last_name) as clientes, count(leads.site_id) as cantidad_clientes
from clients
left join sites on clients.client_id  = sites.client_id
left join leads on sites.site_id = leads.site_id
where year(registered_datetime) = 2011
group by clients.client_id;

--consulta 7--
use lead_gen_business;
select concat(clients.first_name, " ",clients.last_name) as cliente, count(leads.site_id) as cantidad_clientes, monthname(registered_datetime) as mes
from clients
left join sites on clients.client_id  = sites.client_id
left join leads on sites.site_id = leads.site_id
where year(registered_datetime) = 2011
and month(registered_datetime) <= 6
and month(registered_datetime) >= 1
group by leads.registered_datetime;


--consulta 8--
use lead_gen_business;
select concat(clients.first_name, " ",clients.last_name) as clientes, count(leads.site_id) as cantidad_clientes
from clients
left join sites on clients.client_id  = sites.client_id
left join leads on sites.site_id = leads.site_id
where year(registered_datetime) = 2011
group by clients.client_id;

use lead_gen_business;
select concat(clients.first_name, " ", clients.last_name) as cliente, sites.domain_name, count(leads.site_id) as cliente_potencial
from clients
left join sites on clients.client_id  = sites.client_id
left join leads on sites.site_id = leads.site_id
group by leads.site_id;

--Consulta 9--
use lead_gen_business;
select concat(clients.first_name, " ",clients.last_name) as cliente, billing.amount as ganancias, monthname(charged_datetime)as mes, year(charged_datetime) as año
from clients 
left join billing on clients.client_id = billing.client_id
group by concat(year(charged_datetime), month(billing.charged_datetime));

--Consulta 10--
use lead_gen_business;
select concat(clients.first_name,' ',clients.last_name) as cliente , group_concat(sites.domain_name) as dominios
from clients
left join sites on clients.client_id = sites.client_id
group by clients.client_id;
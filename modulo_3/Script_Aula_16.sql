/* Selecionar todos os avi�es (Aircrafts) e os voos associados a eles (Flights), e verificar
 os avi�es que n�o realizaram voos */ 
select *
from aircrafts_data ad2
left join flights f ON ad2.aircraft_code = f.aircraft_code
order by f.flight_id desc;


/* Selecionar todos os avi�es (Aircrafts) e os assentos associados a eles (Seats), e verificar 
os avi�es que n�o possuem assentos cadastrados */
select *
from aircrafts_data ad
left join seats s ON ad.aircraft_code = s.aircraft_code
order by s.seat_no desc;

/* Apresentar o n�mero de voos (Flights) feitos por cada avi�o (Aircrafts) */
select ad.aircraft_code, count(f.flight_id)
from flights f
right join aircrafts_data ad ON f.aircraft_code = ad.aircraft_code
group by ad.aircraft_code;

/* Selecionar os diferentes c�digos dos aeroportos (Airport) */
select distinct (a.airport_code)
from airports a
order by a.airport_code;

/* Apresentar apenas c�digo do aeroporto (Airport) que e o n�mero de voos do aeroporto que
teve menos voo de destino */  
select ad2.airport_code, count(f.flight_id)
from flights f
right join airports_data ad2 ON f.arrival_airport = ad2.airport_code
group by ad2.airport_code
order by count
limit 1;

/*Selecionar o n�mero vezes que os assentos foram escolhidos pelos passageiros agrupados 
por avi�o e ordenados pelo assento menos escolhido */ 
select a.aircraft_code, bp.seat_no, count( bp.ticket_no )
from boarding_passes bp
right join ticket_flights tf on tf.flight_id = bp.flight_id
right join flights f on f.flight_id = tf.flight_id
right join aircrafts a on a.aircraft_code = f.aircraft_code
group by a.aircraft_code, bp.seat_no
order by count asc;

/*Selecionar o assento mais escolhido pelos passageiros do avi�o de c�digo 763 */
select a.aircraft_code, bp.seat_no, count( bp.ticket_no )
from boarding_passes bp
right join ticket_flights tf on tf.flight_id = bp.flight_id
right join flights f on f.flight_id = tf.flight_id
right join aircrafts a on a.aircraft_code = f.aircraft_code
group by a.aircraft_code, bp.seat_no
having a.aircraft_code = '763'
order by count desc
limit 1;

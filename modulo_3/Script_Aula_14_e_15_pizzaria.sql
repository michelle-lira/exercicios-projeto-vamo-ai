/* Quest�o: Selecionar o total de pre�o dos pedidos, agrupado pelos nomes dos clientes e ordenados pelos que mais gastaram.*/

select c.nome, sum (preco) as valor_total_pedidos
from tb_cliente as c
inner join tb_pedido as p on c.id_cliente = p.id_cliente
group by c.nome
order by valor_total_pedidos; 

/* Quest�o: Selecionar o nome dos clientes e o pre�o dos pedidos com o tipo de entrega Delivery.*/

select * from tb_cliente as c
join tb_pedido as p on c.id_cliente = p.id_cliente

select * from tb_pedido as p
join tb_cliente as c on c.id_cliente = p.id_cliente

/* Quest�o: Selecionar o total de pre�o dos pedidos, agrupado pelos nomes dos clientes e ordenados pelos que mais gastaram.*/

select c.nome, sum (preco) as valor_total_pedidos
from tb_cliente as c
inner join tb_pedido as p on c.id_cliente = p.id_cliente
group by p.delivery 
order by valor_total_pedidos desc

/* Quest�o: Selecionar o nome de todas as pizzas associadas com os ids dos pedidos. */

/* (sem apelido) */ 
select tb_pizza.nome, tb_pedido_pizza.id_pedido
from tb_pizza 
left join tb_pedido_pizza on tb_pizza.id_pizza = tb_pedido_pizza.id_pizza;

/* (com apelido) */ 
select piz.nome, ped.id_pedido
from tb_pizza as piz
left join tb_pedido_pizza as ped on piz.id_pizza = ped.id_pizza;

/* Selecionar o nome de todas as pizzas associadas com os nomes dos clientes que as pediram */

select tb_pizza.nome, tb_cliente.nome, tb_pedido_pizza.id_pedido
from tb_pizza
left join tb_pedido_pizza on tb_pedido_pizza.id_pizza = tb_pizza.id_pizza 
left join tb_pedido on tb_pedido.id_pedido = tb_pedido_pizza.id_pedido 
left join tb_cliente on tb_cliente.id_cliente = tb_pedido.id_cliente;

/* Quest�o: Quais os pedidos que tiveram o pre�o acima da m�dia? */

select * from tb_pedido 
where preco > (select avg(preco) from tb_pedido);

/* Quest�o: Quais os clientes que fizeram retirada do pedido no balc�o? */

select nome 
from tb_cliente where id_cliente in (select id_cliente from tb_pedido 
										where tipo_entrega = 'Retirada no balc�o');
										
										
----------------------------------------------------------------------------------------
-- AULA 16
-- Selecionar o nome de todas as pizzas, associar com os pedidos, os nomes dos clientes
-- que as escolheram e verificar quais pizzas nunca foram pedidas

select tb_cliente.id_cliente, tb_cliente.nome as "cliente", tb_pedido.preco, tb_pedido.data_pedido, 
tb_pizza.nome as "pizza", tb_pedido_pizza.id_pedido
from tb_cliente 
right join tb_pedido on tb_pedido.id_cliente = tb_pedido.id_cliente
right join tb_pedido_pizza on tb_pedido_pizza.id_pedido = tb_pedido.id_pedido
right join tb_pizza on tb_pizza.id_pizza = tb_pedido_pizza.id_pizza
where tb_pedido.id_pedido isnull; -- usando tb_pedido_pizza tbm vai



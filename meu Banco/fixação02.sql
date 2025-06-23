-- link da lista (List02) de exercicios: https://github.com/cami-la/exercicios-de-fixacao-MYSQL/blob/master/List02/EXERCICIOS-BD-MYSQL2.pdf
-- créditos: cami-la

create database if not exists vendas
default character set utf8mb4
default collate utf8mb4_general_ci;

use vendas;

create table if not exists duplicata (
	nome varchar(40),
    numero int,
    valor decimal(10, 2),
    vencimento date,
    banco varchar(20),
    
    primary key(numero)
) default charset utf8mb4;

insert into duplicata values 
('ABC PAPELARIA', '100100', '5000.00', '2017-01-20', 'ITAU'),
('LIVRARIA FERNANDES', '100110', '2500.00', '2017-01-22', 'ITAU'),
('LIVRARIA FERNANDES', '100120', '1500.00', '2016-10-15', 'BRADESCO'),
('ABC PAPELARIA', '100130', '8000.00', '2016-10-15', 'SANTANDER'),
('LER E SABER', '200120', '10500.00', '2018-04-26', 'BANCO DO BRASIL'),
('LIVROS E CIA', '200125', '2000.00', '2018-04-26', 'BANCO DO BRASIL'),
('LER E SABER', '200130', '11000.00', '2018-09-26', 'ITAU'),
('PAPELARIA SILVA', '250350', '1500.00', '2018-01-26', 'BRADESCO'),
('LIVROS MM', '250360', '500.00', '2018-12-18', 'SANTANDER'),
('LIVROS MM', '250370', '3400.00', '2018-04-26', 'SANTANDER'),
('PAPELARIA SILVA', '250380', '3500.00', '2018-04-26', 'BANCO DO BRASIL'),
('LIVROS E CIA', '453360', '1500.00', '2018-06-15', 'ITAU'),
('LIVROS MM', '453365', '5400.00', '2018-06-15', 'BRADESCO'),
('PAPELARIA SILVA', '453370', '2350.00', '2017-12-27', 'ITAU'),
('LIVROS E CIA', '453380', '1550.00', '2017-12-27', 'BANCO DO BRASIL'),
('ABC PAPELARIA', '980130', '4000.00', '2016-12-11', 'ITAU'),
('LIVRARIA FERNANDES', '770710', '2500.00', '2016-11-15', 'SANTANDER'),
('ABC PAPELARIA', '985001', '3000.00', '2016-09-11', 'ITAU'),
('PAPEIS E AFINS', '985002', '2500.00', '2011-03-12', 'SANTANDER'),
('LER E SABER', '888132', '2500.00', '2017-03-05', 'ITAU');

-- 1. Listar nome,vencimento e valor de cada duplicata da tabela
select nome, vencimento, valor
from duplicata;

-- 2. Apresentar o número das duplicatas depositadas no banco Itaú
select numero
from duplicata
where banco = 'ITAU';

-- 4. Quais são as duplicatas (número, vencimento, valor e nome) que vencem no ano de 2017
select numero, vencimento, valor, nome
from duplicata
where vencimento between '2017-01-01' and '2017-12-31'
order by vencimento;

select numero, vencimento, valor, nome
from duplicata
where year(vencimento) = 2017;

-- 5. Apresentar as duplicatas (número, vencimento, valor e nome) que não estão depositadas nos bancos Itaú e Santander
select numero, vencimento, valor, nome
from duplicata
where banco != 'ITAU' and banco != 'SANTANDER';

-- 6. Quanto é o valor da divida o cliente PAPELARIA SILVA, e quais são as duplicatas?
select * from duplicata
order by nome;

select distinct(nome) from duplicata
order by nome;

select * from duplicata
where nome like '%silva';

select sum(valor) from duplicata
where nome like '%silva';

-- 7. Retirar da tabela a duplicata 770710 do cliente LIVRARIA FERNANDES, por ter sido devidamente quitada
delete from duplicata
where numero = '770710'
limit 1;

-- 8. Apresentar uma listagem em ordem alfabética por nome do cliente de todos os campos da tabela
select * from duplicata
order by nome;

-- 9. Apresentar uma listagem em ordem de data de vencimento com o nome do cliente, banco, valor e vencimento
select nome, banco, valor, vencimento
from duplicata
order by vencimento;

-- 10. As duplicatas do Banco do Brasil foram transferidas para o Santander. Proceder o ajuste dos registros
update duplicata
set banco = 'SANTANDER'
where banco = 'BANCO DO BRASIL'
limit 4;

-- 11. Quais são os clientes que possuem suas duplicatas depositadas no Banco Bradesco?
select * from duplicata
where banco = 'BRADESCO';

-- 12. Qual é a previsão de recebimento no período de 01/01/2016 até 31/12/2016?
select * from duplicata
where vencimento between '2016-01-01' and '2016-12-31';

select sum(valor) as 'recebimento2016' from duplicata
where vencimento between '2016-01-01' and '2016-12-31';

-- 13. Quanto a empresa tem para receber no período de 01/08/2016 até 30/08/2016?
select sum(valor) as 'recebimento2016' from duplicata
where vencimento between '2016-08-01' and '2016-08-30';

-- 15. Acrescentar uma multa de 15% para todos os títulos que se encontram vencidos no período de 01/01/2016 até 31/12/2016
update duplicata
set valor = valor * 1.15
where vencimento between '2016-01-01' and '2016-12-31'
limit 4;

-- 16. Acrescentar uma multa de 5% para todos os títulos vencidos entre 01/01/2017 e 31/05/2017 que sejam do cliente LER E SABER
select * from duplicata
where vencimento between '01-01-2017' and '2017-05-31'
order by vencimento;

select count(*) from duplicata
where vencimento between '01-01-2017' and '2017-05-31'
order by vencimento;

update duplicata
set valor = valor * 1.05
where vencimento between '2017-01-01' and '2017-05-31'
order by vencimento
limit 8;

-- 17. Qual é a média aritmética dos valores das duplicatas do ano de 2016?
select * from duplicata
where year(vencimento) = '2016'
order by vencimento;

select avg(valor) as media2016 from duplicata
where year(vencimento) = '2016';

-- 18. Exiba as duplicatas e nome dos respectivos clientes que possuem duplicatas com valor superior a 10000,00?
select * from duplicata
where valor > 10000
order by valor;

-- 19. Qual o valor total das duplicatas lançadas para o banco Santander?
select sum(valor) as totalSantander from duplicata
where banco = 'santander';

-- 20. Quais são os clientes que possuem suas duplicatas depositadas nos Bancos Bradesco ou Itaú? 
select * from duplicata
where banco = 'bradesco' or banco = 'itau';
-- link da lista (List03) de exercicios: https://github.com/cami-la/exercicios-de-fixacao-MYSQL/blob/master/List03/EXERCICIOS-BD-MYSQL3.pdf
-- créditos: cami-la

create database if not exists Longa_Vida
default character set utf8mb4
default collate utf8mb4_general_ci;

use Longa_Vida;

create table if not exists planos (
	numero varchar(2) not null,
    descricao varchar(30),
    valor decimal(10, 2) default '0',
    primary key(numero)
) default charset utf8mb4;

insert into planos values
('B1', 'Basico 1', '200.00'), 
('B2', 'Basico 2', '150.00'),
('B3', 'Basico 3', '100.00'),
('E1', 'Executivo 1', '350.00'),
('E2', 'Executivo2', '300.00'),
('E3', 'Executivo3', '250.00'),
('M1', 'Master 1', '500.00'),
('M2', 'Master 2', '450.00'),
('M3', 'Master 3', '400.00');

create table if not exists associado (
	plano varchar(2) not null,
    nome varchar(40) not null,
    endereco varchar(35),
    cidade varchar(20),
    estado varchar(2),
    cep varchar(9),
    primary key(nome),
    foreign key(plano) references planos(numero)
) default charset utf8mb4;

insert into associado values
('B1', 'JOSE ANTONIO DA SILVA', 'R. FELIPE DO AMARAL, 3450', 'COTIA', 'SP', '06700-000'),
('B1', 'MARIA DA SILVA SOBRINHO', 'R. FELIPE DE JESUS, 1245', 'DIADEMA', 'SP', '09960-170'),
('B1', 'PEDRO JOSE DE OLIVEIRA', 'R. AGRIPINO DIAS, 155', 'COTIA', 'SP', '06700-011'),
('B2', 'ANTONIA DE FERNANDES', 'R. PE EZEQUIEL, 567', 'DIADEMA', 'SP', '09960-175'),
('B2', 'ANTONIO DO PRADO', 'R. INDIO TABAJARA, 55', 'GUARULHOS', 'SP', '07132-999'),
('B3', 'WILSON DE SENA', 'R. ARAPIRACA, 1234', 'OSASCO', 'SP', '06293-001'),
('B3', 'SILVIA DE ABREU', 'R. DR. JOAO DA SILVA, 5', 'SANTO ANDRE', 'SP', '09172-199'),
('E1', 'ODETE DA CONCEIÇÃO', 'R. VOLUNTARIOS DA PATRIA, 10', 'SÃO PAULO', 'SP', '02010-550'),
('E2', 'JOAO CARLOS MACEDO', 'R. VISTA ALEGRE, 500', 'SÃO PAULO', 'SP', '04343-990'),
('E3', 'CONCEIÇÃO DA SILVA', 'AV. VITORIO DO AMPARO, 11', 'MAUA', 'SP', '09312-988'),
('E3', 'PAULO BRUNO AMARAL', 'R. ARGENZIO BRILHANTE, 88', 'BARUERI', 'SP', '06460-999'),
('E3', 'WALDENICE DE OLIVEIRA', 'R. OURO VELHO, 12', 'BARUERI', 'SP', '06460-998'),
('E3', 'MARCOS DO AMARAL', 'R. DO OUVIDOR, 67', 'GUARULHOS', 'SP', '07031-555'),
('M1', 'MURILO DE SANTANA', 'R. PRATA DA CASA', 'BARUERI', 'SP', '06455-111'),
('M1', 'LUIZA ONOFRE FREITAS', 'R. VICENTE DE ABREU, 55', 'SANTO ANDRE', 'SP', '09060-667'),
('M2', 'MELISSA DE ALMEIDA', 'R. FERNANDO ANTONIO, 2345', 'SÃO PAULO', 'SP', '04842-987'),
('M2', 'JOAO INACIO DA CONCEICAO', 'R. PENELOPE CHARMOSA, 34', 'SUZANO', 'SP', '08670-888'),
('B3', 'AUGUSTA DE ABREU', 'AV. RIO DA SERRA, 909', 'SANTO ANDRE', 'SP', '09061-333'),
('M3', 'ILDA DE MELO DA CUNHA', 'AV. POR DO SOL, 546', 'SANTO ANDRE', 'SP', '09199-444'),
('M3', 'MARCOS DA CUNHA', 'AV. PEDROSO DE MORAES', 'SÃO PAULO', 'SP', '04004-444');

-- 1. Quais campos das tabelas associado e plano devem ser utilizados para efetuar o relacionamento entre as tabelas?
select p.numero, ass.nome, ass.cidade
from planos as p
join associado as ass
on p.numero = ass.plano
order by ass.nome;

-- 2. Extrair uma relação geral de todos os associados e os planos que eles possuem
select * from associado;

-- 3. Quantos associados possuem o plano B1?
select * from associado
where plano = 'B1';

select count(*) from associado
where plano = 'B1';

-- 4. Apresente uma relação com todos os nomes, planos e valores de todos os registros de associados
select ass.nome, p.numero, p.valor
from planos as p
join associado as ass
on p.numero = ass.plano;

-- 5. Quais são os associados que moram em COTIA ou em DIADEMA?
select * from associado
where cidade like '%cotia%' || cidade like '%diadema%';

-- 6. Apresente o nome, plano e valor dos associados que moram em BARUERI e possuem o plano M1
select ass.nome, p.numero, p.valor
from planos as p
join associado as ass
on p.numero = ass.plano
where ass.cidade like '%BARUERI%' and p.numero = 'M1';

-- 7. Apresente uma relação com nome, plano e valor de todos os associados residentes em SÃO PAULO
select ass.nome, p.numero, p.valor
from planos as p
join associado as ass
on p.numero = ass.plano
where ass.cidade like '%são_paulo%';

-- 8. Apresente uma relação completa de todos os campos de ambas as tabelas em que o associado possua SILVA no nome
select * from planos as p
join associado as ass
on p.numero = ass.plano
where ass.nome like '%silva%';

-- 9. Devido ao aumento do índice IGPM, a empresa reajustou os valores dos planos básicos em 10%, dos planos 
-- executivos em 5% e dos planos Máster em 3 %. Atualize os valores na tabela planos
select count(*) from planos;

select * from planos;

select count(*) from planos
where numero like 'b_';

update planos
set valor = valor * 1.1
where numero like 'b_'
limit 3;

select count(*) from planos
where numero like 'e_';

update planos
set valor = valor * 1.05
where numero like 'e_'
limit 3;

select count(*) from planos
where numero like 'm_';

update planos
set valor = valor * 1.03
where numero like 'm_'
limit 3;

-- 10. O associado PEDRO JOSE DE OLIVEIRA alterou seu plano de B1 para E3. Faça a devida atualizaçã
select * from associado
where nome like '%pedro jose%';

update associado 
set plano = 'E3'
where nome like '%pedro jose%'
limit 1;

-- 11. Quantos associados possuem o plano E3?
select count(*) from associado
where plano like 'E3';

select * from associado
where plano like 'E3';

-- 12.Liste o nome e o valor de todos os associados que possuem os planos B1, E1 e M1
select ass.nome, p.valor
from planos as p
join associado as ass
on p.numero = ass.plano
where ass.plano in ('B1', 'E1', 'M1');

-- 13. Quais são os associados que possuem plano do tipo EXECUTIVO, independentemente da categoria ser 1, 2 ou 3?
select plano, nome
from associado
where plano like 'E_';

-- 14. Quais são os associados que possuem plano dos tipos Básico e Máster?
select plano, nome
from associado
where plano not like 'E_';

-- 15. A empresa fechou seu escritório na cidade de SANTO ANDRE e transferiu os cliente para um terceirizado. Remova
-- da tabela associados todos os registros existentes de associados da cidade de SANTO ANDRE
select nome, plano
from associado
where cidade like '%SANTO ANDRE%';

delete from associado
where cidade like '%SANTO ANDRE%'
limit 4;

-- 16. Apresente o nome, plano e valor dos associados que moram em SÃO PAULO e possuem os planos M2 e M3. A
-- listagem deve estar ordenada pelo campo nome
select ass.nome, p.numero, p.valor
from planos as p
join associado as ass
on p.numero = ass.plano
where ass.cidade like '%são_paulo%' and ass.plano in ('M2', 'M3')
order by ass.nome;

-- 17. Apresente uma listagem completa de todos os campos de ambas as tabelas ordenados por tipo de plano
select * from planos as p
join associado as ass
on p.numero = ass.plano
order by p.numero;

-- 18. Faça uma relação geral de todos os associados e planos que eles possuem. A relação deve ser apresentada em ordem
-- ascendente pelo campo tipo de plano e descendente pelo campo de identificação do nome do associado
select * from planos as p
join associado as ass
on p.numero = ass.plano
order by p.numero asc, ass.nome desc;

-- 19. Apresentar uma relação de todos os associados que não possuem o plano Máster
select * from associado
where plano not like 'M_';

-- 20. Apresentar uma listagem em ordem crescente pelo campo nome do associado. Essa listagem deve ser formada pelos
-- campos Nome da tabela associado e Descrição da tabela Planos
select ass.nome, p.descricao
from planos as p
join associado as ass
on p.numero = ass.plano
order by ass.nome;

-- 21.Apresentar uma listagem dos planos que estão situados na faixa de valores de 300 até 500
select * from planos
where valor between '300' and '500';

select * from planos;

-- 22. Apresentar uma relação contendo: nome, plano, descrição do plano e valor de todos os associados que tenham em
-- seu nome, seja na posição que for, a seqüência AMARAL
select ass.nome, ass.plano, p.descricao, p.valor
from planos as p
join associado as ass
on p.numero = ass.plano
where nome like '%amaral%';

-- 23. Quais associados residem na cidade de DIADEMA?
select *
from planos as p
join associado as ass
on p.numero = ass.plano
where ass.cidade like '%diadema%'
order by ass.nome;

-- 24. O plano do tipo MASTER teve um reajuste de 6%. Atualize na tabela planos os valores das categorias 1, 2 e 3
update planos
set valor = valor * 1.06
where numero like 'm_'
limit 3;

-- 25. Quais são os clientes cujo CEP é iniciado com os valores 09?
select * from associado
where cep like '09%';
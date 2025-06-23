use cadastroCeV;

show tables;

select * from cursos;

select * from gafanhotos;

select nome, descricao, ano
from cursos
where ano > 2016
order by ano, nome;

select id, nome, profissao, nacionalidade, altura
from gafanhotos
where altura between 1.75 and 2.00
order by nome, nacionalidade desc;

select nome, carga, totaulas
from cursos
where ano in (2014, 2018, 2022)
order by ano;

select * from gafanhotos
where sexo = 'M' 
order by profissao, altura, nacionalidade;
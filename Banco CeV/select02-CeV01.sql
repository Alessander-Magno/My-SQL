use cadastrocev;

select * from gafanhotos
where nome like 'Guilherme%';

select * from gafanhotos
where nome like '%g%';

select * from gafanhotos
where nacionalidade like '%lia%';

select * from cursos;

select * from cursos
where nome like '___'; 

select * from cursos
where descricao like '%_c_';

select * from cursos
where descricao like '%H%_';

select distinct ano from cursos;

select distinct * from cursos;

select distinct carga from cursos
order by carga;

select distinct nacionalidade from gafanhotos
order by nacionalidade;

select count(*) from cursos;

select max(carga) from cursos;

select min(carga) from cursos;

select sum(carga) from cursos;

select avg(carga) from cursos;
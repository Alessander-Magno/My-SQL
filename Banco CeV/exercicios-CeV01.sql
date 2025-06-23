select * from cursos;

select * from gafanhotos;

select nome from gafanhotos
where sexo = 'F';

select count(*) from gafanhotos
where sexo like '%F%';

select * from gafanhotos
where nascimento between '2000-01-01' and '2015-12-31';

select count(*) from gafanhotos
where nascimento between '2000-01-01' and '2015-12-31';

select * from gafanhotos
where profissao = 'programador' and sexo = 'M';

select * from gafanhotos
where sexo = 'F' and nacionalidade = 'brasil' and nome like 'j%';

select nome, nacionalidade
from gafanhotos
where sexo = 'M' and peso < '100' and nome like '%silva%' and not nacionalidade = 'brasil';

select max(altura) from gafanhotos
where sexo = 'M' and nacionalidade = 'brasil';

select avg(peso) from gafanhotos;

select min(peso) from gafanhotos
where sexo = 'F' and nascimento between '1990-01-01' and '2000-12-31' and not nacionalidade = 'brasil';

select count(peso) from gafanhotos
where sexo = 'F' and altura > 1.9;
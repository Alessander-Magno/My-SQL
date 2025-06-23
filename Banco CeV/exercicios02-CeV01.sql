select * from gafanhotos;

select profissao, count(profissao) as qtdProf
from gafanhotos
group by profissao
order by count(profissao);

select sexo, count(sexo) from gafanhotos
where year(nascimento) >= 2005
group by sexo;

select nacionalidade, count(nacionalidade) from gafanhotos
where nacionalidade != 'brasil'
group by nacionalidade
having count(nacionalidade) > 3
order by count(nacionalidade);
 
select avg(altura) from gafanhotos;

select altura, count(altura)
from gafanhotos
where peso > 100
group by altura
having altura > (select avg(altura) from gafanhotos)
order by altura;
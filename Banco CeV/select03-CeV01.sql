use cadastroCeV;

select * from cursos;

select ano, count(ano) from cursos
group by ano
order by ano;

select carga, count(carga) from cursos
group by carga
having count(carga) > 3
order by carga;
use cadastrocev;

select * from gafanhotos;

select * from cursos;

create table if not exists gafanhoto_assiste_curso (
	id int not null auto_increment,
    data date,
    idgafanhoto int,
    idcurso int,
    primary key(id),
    foreign key(idgafanhoto) references gafanhotos(id),
    foreign key(idcurso) references cursos(idcurso)
) default charset = utf8mb4;

describe gafanhoto_assiste_curso;

insert into gafanhoto_assiste_curso values
(default, '2015-09-30', '1', '1'),
(default, '2020-09-30', '24', '6'),
(default, '2017-04-22', '45', '18'),
(default, '2026-01-01', '61', '30');

select * from gafanhoto_assiste_curso;

select *
from gafanhotos as g
join gafanhoto_assiste_curso as gac
on g.id = gac.idgafanhoto;

select g.nome, g.profissao, g.cursopreferido, gac.idcurso
from gafanhotos as g
join gafanhoto_assiste_curso as gac
on g.id = gac.idgafanhoto;

select g.nome, c.nome
from gafanhotos as g
join gafanhoto_assiste_curso as gac
on g.id = gac.idgafanhoto
join cursos as c
on gac.idcurso = c.idcurso;
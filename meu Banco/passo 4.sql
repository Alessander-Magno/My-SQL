create table if not exists cursos (
	nome varchar(20) not null unique,
    descricao text,
    carga int unsigned not null,
    totalAulas int unsigned not null,
    ano year default '2025'
) default charset = utf8mb4;

alter table cursos
add column idCurso int not null;

alter table cursos
modify column idCurso int not null first;

alter table cursos
add primary key (idCurso);

describe cursos;
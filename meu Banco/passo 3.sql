describe pessoas;

alter table pessoas
add column profissao varchar(20) default 'desempregado' after nome;

alter table pessoas
drop profissao;

alter table pessoas
add column prof varchar(21) after nome;

alter table pessoas
modify column prof varchar(30) default 'desempregado' after nacionalidade;

alter table pessoas
change column prof profissao varchar(30) default 'desempregado';

select * from pessoas; 

alter table pessoas
rename to gafanhotos;

describe pessoas;

describe gafanhotos;

select * from gafanhotos;
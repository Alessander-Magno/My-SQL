use cadastro;

insert into cursos values
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algoritmos', 'Lógica de Programação', '20', '15', '2014'),
('3', 'PGP', 'Curso de PHP para iniciantes', '40', '20', '2010'),
('4', 'Jarva', 'Introdução a Linguagem Java', '10', '29', '2000'),
('5', 'MySQL', 'Banco de Dados MySQL', '30', '15', '2016'),
('6', 'Youtuber', 'Gerar polêmica e ganhar inscritos', '5', '2', '2028'),
('7', 'Cozinha Árabe', 'Como cozinhar que nem um sudão', '30', '15', '2028');

update cursos
set nome = 'HTML5'
where idCurso = 1;

update cursos
set nome = 'PHP', totalAulas = 25, ano = 2011 
where idCurso = 3;

update cursos
set nome = 'Java', ano = '2010'
where idCurso = 4;

update cursos
set ano = '2018'
where ano = '2028'
limit 2;

delete from cursos
where ano = 2018
limit 2;

/*
truncate table cursos;

delete from cursos
where idCurso > 0;
*/

select * from cursos;
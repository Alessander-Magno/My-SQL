use cadastrocev;

-- cardinalidade: um para muitos, a chave vai vim da entidade com cardinalidade (1)
-- | gafanhotos | (n) -- / prefere \ -- (1) | cursos | 
-- um gafanhoto só poderá ter um curso preferido, e um curso poderá ter vários gafanhotos que o preferem  
-- a chave estrangeira de gafanhotos virá da tabela cursos

-- cardinalidade: muitos para muitos, cria uma nova tabela onde ele será constituida por uma chave estrangeira composta pela duas outras tabelas
-- antes: | cliente | (n) -- / pedido \ -- (n)| produto |
-- depois: | cliente | (1) -- (n) | pedido | (n) -- (1) | produto | esse é o resultado de n para n

-- cardinalidade: um para um, nesse tipo de relacionamento, é escolhido uma entidade dominante e em seguida ela recebe a chave estrangeira da entidade 
-- não dominante
-- | marido | (1) -- / se relaciona \ -- (1) | esposa | 
-- pondo a entidade esposa como dominante, ela receberá a chave estrangeira da entidade marido

describe gafanhotos;

select * from gafanhotos;

describe cursos;

select * from cursos;

alter table gafanhotos
add column cursoPreferido int;

alter table gafanhotos
add foreign key (cursoPreferido)
references cursos(idcurso);

UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '6' WHERE (`id` = '1');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '30' WHERE (`id` = '2');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '3' WHERE (`id` = '3');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '18' WHERE (`id` = '4');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '21' WHERE (`id` = '5');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '2' WHERE (`id` = '6');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '2' WHERE (`id` = '7');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '7' WHERE (`id` = '8');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '9' WHERE (`id` = '9');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '13' WHERE (`id` = '10');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '25' WHERE (`id` = '11');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '29' WHERE (`id` = '15');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '20' WHERE (`id` = '16');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '17' WHERE (`id` = '17');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '4' WHERE (`id` = '18');
UPDATE `cadastrocev`.`gafanhotos` SET `cursoPreferido` = '7' WHERE (`id` = '26');

select gafanhotos.nome, cursos.nome
from gafanhotos join cursos;

select gafanhotos.nome, cursos.nome, cursos.ano
from gafanhotos join cursos
on gafanhotos.cursoPreferido = cursos.idCurso
order by cursos.nome;

select g.nome, c.nome, c.ano
from gafanhotos as g left join cursos as c
on g.cursoPreferido = c.idCurso;

select g.nome, c.nome, c.ano
from gafanhotos as g right join cursos as c
on g.cursoPreferido = c.idCurso;

select g.nome, c.nome, c.ano
from gafanhotos as g right join cursos as c
on g.cursoPreferido != c.idCurso
order by g.nome;
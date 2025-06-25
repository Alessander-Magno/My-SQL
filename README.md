# 🐬 My-SQL

Repositório de estudo com comandos e scripts em SQL.  
Exercicios e material de apoio vindos do: Curso em Video e de um perfil de uma professora do git

---

## 🧱 Exemplos de comandos

```sql
create table if not exists gafanhoto_assiste_curso (
	id int not null auto_increment,
    data date,
    idgafanhoto int,
    idcurso int,
    primary key(id),
    foreign key(idgafanhoto) references gafanhotos(id),
    foreign key(idcurso) references cursos(idcurso)
) default charset = utf8mb4;

select g.nome, c.nome
from gafanhotos as g
join gafanhoto_assiste_curso as gac
on g.id = gac.idgafanhoto
join cursos as c
on gac.idcurso = c.idcurso;

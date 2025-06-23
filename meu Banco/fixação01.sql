-- link da lista (List01) de exercicios: https://github.com/cami-la/exercicios-de-fixacao-MYSQL/blob/master/List01/EXERCICIOS-BD-MYSQL1.pdf
-- créditos: cami-la

-- 1. Criar um banco de dados chamado "vendas"
create database if not exists vendas
default character set utf8mb4
default collate utf8mb4_general_ci;

use vendas;

-- 2. Criar a tabela Produto
create table if not exists Produto (
	Codigo_produto int not null,
    Descricao_produto varchar(30),
    Preco_produto float not null default '0',
    primary key (Codigo_produto)
) default charset = utf8mb4;

-- 3. Criar a tabela Nota_fiscal
create table if not exists Nota_fiscal (
	Numero_NF int not null,
    Data_NF date,
    Valor_NF float not null,
    primary key (Numero_NF)
) default charset = utf8mb4;

-- 4. Criar a tabela Itens
create table if not exists Itens (
	Produto_Codigo_Produto int,
    Nota_fiscal_Num_NF int,
    Num_Item int not null default '0', 
    Qtd_Item int not null default '0',
    primary key (Produto_Codigo_Produto, Nota_fiscal_Num_NF)
) default charset = utf8mb4;

-- 5. Alterar o campo Descricao_Produto da tabela Produto para o tipo Varchar(50)
alter table Produto
modify column Descricao_produto varchar(50);

-- 6. Alterar a tabela Nota_Fiscal, adicionando o campo ICMS, do tipo float depois do campo Numero_NF
alter table Nota_fiscal
add column ICMS float default '0' after Numero_NF;

-- 7. Alterar a tabela Produto, adicionando o campo Peso, do tipo float
alter table Produto
add column Peso float;

-- 8. Fazer com que a chave primária da tabela Itens deixe de ser composta por código do produto mais número da nota fiscal e passe a ser Num_item
alter table Itens
drop primary key;

-- 9. Apresentar a estrutura da tabela Produto
describe Produto;

-- 10. Apresentar a estrutura da tabela Nota_Fiscal
describe Nota_fiscal;
alter table Itens
add primary key (Num_Item);

-- 11. Alterar o nome do campo Valor_NF da tabela Nota_fiscal para ValorTotal_NF
alter table Nota_fiscal
change column Valor_NF ValorTotal_NF float not null;

-- 12. Remover o campo Data_NF da tabela Nota_fiscal
alter table Nota_fiscal
drop Data_NF;

-- 13. Remover a tabela Itens do modelo de dados
drop table Itens;

-- 14. Alterar o nome da tabela Nota_fiscal para Venda
alter table Nota_fiscal
rename to Venda;
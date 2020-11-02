create database bdRevista;

use bdRevista;

create table tbRevista (
idRevista int primary key auto_increment,
nome varchar(40),
categoria varchar(30)
);



insert into tbRevista (idRevista,nome) values
('0','Quatro rodas'),
('0','Veja' ),
('0', 'Época'),
('0', 'Cláudia'),
('0', 'Adventista');

select * from tbRevista;

update tbRevista set categoria = 'Automotiva' where idRevista = 1;
update tbRevista set categoria = 'Informativa' where idRevista in (2,3);
update tbRevista set categoria = 'Fofoca' where idRevista = 4;
update tbRevista set categoria = 'Religiosa' where idRevista = 5;

select * from tbRevista;

insert into tbRevista values
('0', 'Hugo Gloss', 'Famosos'),
('0', 'Soccer', 'Esportes'),
('0', 'Fly', 'Aviação');

select * from tbRevista;

desc tbRevista;

-- Alterar tabela

alter table tbRevista modify categoria varchar(40);
desc tbRevista;

-- Acrescentar uma coluna

alter table tbRevista add column periodicidade varchar(15);
select * from tbrevista;

-- Deletar uma coluna

alter table tbRevista drop column periodicidade;

-- Criar tabela editora

create table editora (
idEditora int primary key auto_increment,
NomeEditora varchar(40),
DataFund date
)auto_increment=1000;

insert into editora values
('0', 'Abril', '1987-02-25'),
('0', 'Globo', '1800-10-18'),
('0', 'Banca', '1975-05-10'),
('0', 'Auto', '2000-10-22');

select * from editora;

-- Adicionar campo FkEditora  para ser Foreign Key na tabela revista refenciado pela tabela editora

alter table tbrevista add column fkEditora int; 

-- configura como foreign key

alter table tbrevista add foreign key (fkeditora) references editora (ideditora);

-- atualizar os dados da coluna fkEditora

update tbrevista set fkeditora = 1000 where idrevista in  (2,3);
update tbrevista set fkeditora = 1002 where idrevista = (1);
update tbrevista set fkeditora = 1003 where idrevista = (4);
update tbrevista set fkeditora = 1003 where idrevista = (5);
UPDATE tbrevista SET fkEditora = 1002 WHERE idRevista = (6);
UPDATE tbrevista SET fkEditora = 1003 WHERE idRevista = (7);
UPDATE tbrevista SET fkEditora = 1001 WHERE idRevista = (8);

select * from tbrevista;

select tbrevista.*, editora.nomeeditora,datafund from tbrevista , editora where ideditora = fkeditora; 

select*from tbrevista, editora where fkeditora=ideditora order by idRevista;

-- Deletar um campo da tabela

delete from tbrevista where idrevista = 2;

select * from tbrevista;

delete from editora where nomeeditora = 'globo';














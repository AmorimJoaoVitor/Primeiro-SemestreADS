create database faculdade;

use faculdade;

create table aluno (
ra char(8) primary key,
nome varchar (50), 
telefone varchar(15),
email varchar(100)
);
-- alterar o nome do campo telefone para fone
alter table aluno rename column fone to telefone;
-- Rename table alunos to aluno
alter table aluno modify nome varchar(120);

-- exibir os dados da tabela
Select * from aluno;

-- descrição da tabela
desc aluno;
describe aluno;

-- Inserir dados na tabela
insert into aluno values 
('01202044', 'João Arnaut', '11999838972', 'joao.arnaut@bandtec.com.br');

Select * from aluno;

insert into aluno values 
('01202020', 'Bruna Brito', '11999875631', 'bruna.brito@bandtec.com.br'),
('01205689', 'hanan ortiz', '11999874879', 'hanam.ortiz@bandtec.com.br');

insert into aluno values 
('01253214', 'joao amorim', '11999897256', 'joao.amorim@bandtec.com.br');

select * from aluno;

-- exibir os nomes que terminam com a letra z
select * from aluno where nome like '%z';

-- exibir nomes que a primeira letra é j
select * from aluno where nome like 'j%';

-- exibir nomes que a segunda letra é r
select * from aluno where nome like '_r%';

-- exibir nomes que penúltima letra é i
select * from aluno where nome like '%i_';










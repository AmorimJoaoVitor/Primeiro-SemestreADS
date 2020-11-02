create database alunoProjeto;

use alunoProjeto;

create table projeto (
idProjeto int primary key auto_increment,
nomeProjeto varchar(45),
descricao varchar(45)
);

create table aluno (
ra char(8) primary key,
nomeAluno varchar(45),
telefone varchar(45),
fkProjeto int,
foreign key (fkProjeto) references projeto (idProjeto)
);

alter table aluno add column fkRepresentante char(8);
alter table aluno add foreign key (fkRepresentante) references aluno (ra); -- chave estrangeira do auto relacionamento

create table acompanhante (
idAcompanhante int,
nomeAcomp varchar(100),
relacao varchar(100),
fkAluno char(8),
foreign key (fkaluno) references aluno (ra),
primary key (idAcompanhante,fkaluno) -- chave primária composta
);

-- inserir dados na tabela projeto
insert into projeto values
(null, 'Projeto gama', 'Glub gama'),
(null, 'Projeto Sabri', 'Glub Sabrina');

-- inserir dados no aluno 
insert into aluno values
('01202022', 'João Amorim', '5932-5384', 2,null),
('01202029', 'Clevinto Porta', '5933-4647', 1,null);

select * from aluno;

-- configura o representante do aluno
update aluno set fkRepresentante = '01202022' where ra = '01202029';

-- inserir dados na tabela acompanhante
insert into acompanhante values
(1,'Josi', 'Mãe', '01202022'),
(1, 'Tonino Porta', 'Irmão', '01202029'),
(2, 'Matheus Amorim', 'Irmão', '01202022');

insert into acompanhante values
(3, 'Lorenzo Amorim', 'filho', '01202022');

insert into acompanhante values
(2, 'Maria Porta', 'Mãe', '01202029');

select * from acompanhante order by fkAluno;

-- Exibe os dados dos alunos e dos projetos correspondentes
select * from aluno, projeto where fkProjeto = idProjeto;

-- Exibe os dados dos alunos e dos acompanhantes correspondentes
select * from aluno, acompanhante where fkAluno = ra;

-- Exibe os dados dos alunos e dos representantes correspondentes
select * from aluno as aluno, aluno as representante 
                       where aluno.fkrepresentante = representante.ra;

-- Exibe os dados dos alunos e dos projetos correspondentes, mas somente de um projeto
select * from aluno, projeto where fkprojeto = idProjeto 
           and projeto.nomeProjeto like '%Gama%';
           
-- Exibe os dados dos alunos dos projetos e dos acompanhantes correspondentes
select * from aluno, projeto, acompanhante 
                      where fkAluno = ra and fkProjeto = idProjeto;
					
select * from aluno as a, aluno as r, projeto, acompanhante 
where fkAluno = a.ra and r.ra = a.fkrepresentante and a.fkProjeto = idProjeto;                    
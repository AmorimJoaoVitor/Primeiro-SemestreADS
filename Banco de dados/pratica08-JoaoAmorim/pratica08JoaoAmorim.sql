create database sprints;

use sprints;

create table aluno (
ra char(8) primary key,
nomeAluno varchar(45),
email varchar(45),
fkGrupo int
);
alter table aluno add foreign key (fkGrupo) references grupo (idGrupo);
insert into aluno values 
('01202021', 'João Amorim', 'joaovitordeamorim1@gmail.com', 1 ),
('01202028', 'Vitoria Souza', 'vitoria.souza@bandtec.com.br', 3),
('01202044', 'Serginho Esteves', 'serginho.groisman@bandtec.com.br', 1);

select * from aluno;

create table grupo (
idGrupo int auto_increment primary key,
nomeGrupo varchar(45),
projeto varchar(100)
);

insert into grupo values 
(null, 'Termolabs', 'Monitoramento dos medicamentos Termolábeis'),
(null, 'GroonTec', 'Hidroponia');

update grupo set nomeGrupo = "GreenSensors" where idGrupo = 3;
select * from grupo;

create table professor (
idProfessor int auto_increment primary key,
nomeProfessor varchar(45),
materia varchar(45)
)auto_increment= 1000;

insert into professor values 
(null, 'Fernando Brandão', 'Pesquisa e inovação'),
(null, 'Thiago Bonacelli', 'Tecnologia da informação'),
(null, 'Vivian Silva', 'Banco de dados'),
(null, 'Caio Santos', 'Algorítmos');

select * from professor;

create table avaliacao(
fkGrupo int,
fkProfessor int,
dataAvaliacao datetime,
nota decimal(4,2),
foreign key (fkGrupo) references grupo (idGrupo),
foreign key (fkProfessor) references professor (idProfessor),
primary key(fkGrupo,fkProfessor)
);

insert into avaliacao values
(1, 1000, '2020-10-29 14:45', 8);

insert into avaliacao values
(1, 1002, '2020-10-29 14:45', 8),
(3, 1001, '2020-10-29 15:30', 10),
(3, 1003, '2020-10-29 15:30', 10);

update avaliacao set nota = 8 where fkGrupo = 1;

select * from avaliacao;

-- 5.      Exibir os dados dos grupos e os dados de seus respectivos alunos.
select * from grupo inner join aluno on idGrupo = fkGrupo;

-- 6.      Exibir os dados de um determinado grupo e os dados de seus respectivos alunos.
select * from grupo inner join aluno on idGrupo = fkGrupo where idGrupo = 1;

-- 7.      Exibir a média das notas atribuídas aos grupos, no geral.
select avg (nota) from avaliacao;

-- 8.      Exibir a nota mínima e a nota máxima que foi atribuída aos grupos, no geral.
select min(nota) from avaliacao;
select max(nota) from avaliacao;

-- 9.      Exibir a soma das notas dadas aos grupos, no geral
select sum(nota) from avaliacao;

-- 10.  Exibir os dados dos professores que avaliaram cada grupo, os dados dos grupos, a data e o horário da avaliação.
select * from professor inner join grupo inner join avaliacao on fkGrupo = idGrupo on fkProfessor = idProfessor;

-- 11.    Exibir os dados dos professores que avaliaram um determinado grupo, os dados do grupo, a data e o horário da avaliação.
select * from professor inner join grupo inner join avaliacao on fkGrupo = idGrupo on fkProfessor = idProfessor where idGrupo = 1;

-- 12.   Exibir os nomes dos grupos que foram avaliados por um determinado professor.
select grupo.nomeGrupo, avaliacao.* from grupo inner join avaliacao on fkgrupo = idgrupo where fkprofessor = 1002;

-- 13.   Exibir os dados dos grupos, os dados dos alunos correspondentes, os dados dos professores que avaliaram, a data e o horário da avaliação.
select g.* , l.* , p.* , a.dataAvaliacao from professor as p inner join avaliacao as a on p.idprofessor = a.fkprofessor inner join grupo as g on g.idgrupo = a.fkgrupo inner join aluno as l on g.idgrupo = l.fkgrupo;

-- 14.  Exibir a quantidade de notas distintas.    
select distinct(nota) from avaliacao;

-- 15.   Exibir a identificação do professor (pode ser o fk ou o nome), a média das notas e a soma das notas atribuídas, agrupadas por professor.                                                                                                                         
 select professor.nomeProfessor, avg(nota), sum(nota) from professor inner join avaliacao on idprofessor=fkprofessor group by nomeProfessor;
 
 -- 16 Exibir a identificação do grupo (pode ser o fk ou o nome), a média das notas e a soma das notas atribuídas, agrupadas por grupo.
  select grupo.nomeGrupo, avg(nota), sum(nota) from grupo inner join avaliacao on idgrupo=fkgrupo group by nomeGrupo;
  
  -- 17 17.   Exibir a identificação do professor (pode ser o fk ou o nome), a menor nota e a maior nota atribuída, agrupada por professor.
 select professor.nomeProfessor, min(nota), max(nota) from professor inner join avaliacao on idprofessor=fkprofessor group by nomeProfessor;

-- 18.  Exibir a identificação do grupo (pode ser o fk ou o nome), a menor nota e a maior nota atribuída, agrupada por grupo.
select grupo.nomeGrupo, min(nota), max(nota) from grupo inner join avaliacao on idgrupo=fkgrupo group by nomeGrupo;
 
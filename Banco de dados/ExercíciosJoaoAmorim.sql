create database sprint1;

use sprint1;

create table Atleta (
idAtleta int auto_increment primary key,  
nome varchar(40),
modalidade varchar(40),
qtdMedalha int
);

insert into Atleta values
('1', 'Michael Phelps', 'Natação', '28'),
('2', 'Larissa Latynina', 'Ginástica artística', '18'),
('3', 'Pavo Nurmi', 'Atletismo', '12'),
('4', 'Mark Splitz', 'Natação', '11'),
('5', 'Carl Lewis', 'Atletismo', '10');

-- Exibir todos os dados.
select * from Atleta;

-- Exibir nome e quantidade.
select nome, qtdmedalha from Atleta;

-- Exibir dados de uma modalidade específica (natação)
select * from Atleta where modalidade = 'Natação';

-- Exibir dados ordenados por modalidade
select * from atleta order by modalidade;

-- Exibir dados ordenados pela quantidade de medalhas, em ordem decrescente
select * from atleta order by qtdmedalha desc;

-- Exibir dados dos atletas, cujo nome tenham a letra 's'
select * from atleta where nome like '%s%';

-- Exibir dados dos atletas que comecem com a letra 'M'
select * from atleta where nome like 'm%';

-- Exibir dados dos atletas que termine com a letra 'O'
select * from atleta where nome like '%o';

-- Exibir dados dos atletas que  a penúltima letra for 'r'
select * from atleta where nome like '%r_';

-- Exibir dados dos atletas onde a quantidade de medalha seja maior que 18
select * from atleta where qtdmedalha >= 18 ;

-- Dropar a tabela :(
Drop table Atleta;

-- Adicionar coluna
alter table atleta add column datamedalha datetime;
-- Atualizar em um campo
update atleta set datamedalha = '2020-08-20 12:20:00' where idAtleta = 1;

-- Atualizar EM (in)
update atleta set datamedalha = '2020-06-17 19:24:36' where idAtleta in (2,5);



select * from atleta;
--                                          Exercício 2

use sprint1;

create table Musica (
idMusica int auto_increment primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);

insert into musica values
('0', 'Liberdade provisória', 'Henrique e Juliano', 'Sertanejo');

Insert into musica values
(0, 'MILU', 'Gusttavo Lima', 'Sertanejo'),
(0, 'Quem traiu levou', 'Gusttavo Lima', 'Sertanejo'),
(0, 'Onze e pouquinho', 'Dilsinho', 'Pagode'),
(0, 'Mande um sinal', 'Mumuzinho', 'Pagode'),
(0, 'É tarde demais', 'Gigantes do Samba', 'Samba'),
(0, 'Camisa 10', 'Turma do pagode', 'Pagode'),
(0, 'Minha namorada', 'Ferrugem', 'Pagode'),
(0, 'Gelo', 'Melim', 'Folk Pop'),
(0, 'Sua mãe vai me amar', 'Turma do pagode', 'Pagode'),
(0, 'Blame', 'Calvin Harris', 'Eletrônica'),
(0, 'Sweet Nothing', 'Calvin Harris', 'Eletrônica');
 
 -- Exibir todos os dados da tabela
 
 select * from musica;
 
 -- Exibir apenas títulos e os artistas
 
 select titulo, artista from musica;
 
 -- Exibir apenas os dados das músicas de um determinado gênero (pagode)
 
 select * from musica where genero = 'Pagode';
 
 -- Exibir apenas os dados de um artista (gusttavo lima)
 
 select * from musica where artista = 'Gusttavo Lima';
 
 -- Exibir dados ordenados pelo título
 
 select * from musica order by titulo;

  -- Exibir dados ordenados pelo artista do maior para o menor

 select * from musica order by artista desc;
 
  -- Exibir dados das músicas que comecem com a letra 'M'
  
  select * from musica where titulo like 'M%';
  
  -- Exibir dados onde o nome do artista termine com a letra 'a'
  
  select * from musica where artista like '%a';
  
  -- Exibir dados das músicas cujo gênero tenha a segunda letra como 'E'
  
  select * from musica where genero like '_e%';
  
  -- Exibir dados das músicas onde a penultima letra do titulo seja 'd'
  
  select * from musica where titulo like '%d_';
  
  -- Dropar tabela
  
 -- drop table musica;
  
  -- João Vitor de Amorim Bezerra
  -- Curso: ADS
  -- Turma: A
  -- Matéria: Banco de dados
  -- Professora: Vivian


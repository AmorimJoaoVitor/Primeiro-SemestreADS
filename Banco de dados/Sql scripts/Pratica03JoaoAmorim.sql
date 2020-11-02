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

--                                  Prática 03 (para a tabela Atleta)

 create table tbPais (
 IdPais int primary key auto_increment,
 Nome varchar(40),
 Capital varchar(40)
 );
 
 insert into tbPais values
 (null, 'Estados Unidos', 'Washington'),
 (null, 'Itália', 'Roma'),
 (null, 'Finlândia', 'Helsinque'),
 (null, 'China', 'Xanghai');
 
 alter table tbPais rename column nome to NomePais;
 
 alter table atleta add column FkPais int;
 
 alter table atleta add foreign key (FkPais) references tbpais (IdPais);
 desc atleta;
 
 update atleta set fkpais = 1 where idatleta in  (1,4);
 update atleta set fkpais = 2 where idatleta = 2;
 update atleta set fkpais = 3 where idatleta = 5;
 update atleta set fkpais = 4 where idatleta = 3 ;
 
 select * from atleta;
 
 -- Exibir dados de um país específico (Estados Unidos)
 select atleta.nome,tbpais.* from atleta, tbpais where NomePais = 'Estados Unidos' and fkpais = idpais;
  


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
 
 --                               Prática 03 (para a tabela música)
 
 create table tbAlbum (
 idAlbum int primary key auto_increment,
 NomeAlbum varchar(40),
 Gravadora varchar(40)
 ) auto_increment=2000 ;
 
 alter table musica add column fkAlbum int;
 
 alter table musica add foreign key (fkAlbum) references tbAlbum (idAlbum);
 
insert into tbAlbum (idAlbum, NomeAlbum, Gravadora) values
(null, 'Terra sem lei', 'SoundRecords'),
(null, 'Vem pro pagode', 'Globo'),
(null, 'Enche o copo', 'BotecoRecords'),
(null, 'Comming', 'InternacionalRecords');

select * from tbAlbum;

update musica set fkAlbum = 2000 where idMusica in (1,2,3);
update musica set fkAlbum = 2001 where idMusica in (4,5,6,7);
update musica set fkAlbum = 2002 where idMusica in (8,10);
update musica set fkAlbum = 2003 where idMusica in (9,11,12);

-- exibir os dados das duas tabelas
select musica.*, tbAlbum.NomeAlbum from musica, tbalbum where fkalbum = idalbum;

-- Exibir os dados das músicas e dos albuns, mas de um determinado album (Enche o copo)
select musica.*,tbalbum.* from musica, tbalbum where NomeAlbum = 'Enche o copo' 
                                                          and fkalbum = idalbum;
                                                                                                       
-- Exibir os dados das musicas e dos albuns, mas somente de uma gravadora (Globo)
select musica.*,tbalbum.* from musica, tbalbum where fkalbum = idalbum 
											and Gravadora = 'Globo';


 
 

  -- João Vitor de Amorim Bezerra
  -- Curso: ADS
  -- Turma: A
  -- Matéria: Banco de dados
  -- Professora: Vivian


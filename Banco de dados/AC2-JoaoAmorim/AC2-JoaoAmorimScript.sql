create database AC2JoaoVitorAmorim;

use AC2JoaoVitorAmorim;

create table marca(
idMarca int primary key auto_increment ,
nome varchar(45),
fundacao int,
paisFund varchar(45),  -- Os campos "paisFund" e "cidadeFund" compõem a localização da fundação da marca,
cidadeFund varchar(45), -- portanto, um atributo composto
produtos varchar(150) -- uma marca pode vários produtos, então o campo recebe mais de um valor, mas todos eles são produtos
);                    -- Portanto, um atributo multivalorado.
-- inserindo dados na tabela marca
insert into marca values 
(null, 'Nike', 1972, 'Estados Unidos', 'Beaverton', 'Tênis, roupas, acessórios');

insert into marca values 
(null, 'Puma', 1948, 'Alemanha', 'Herzogenaurach', 'Calçados, vestuário, acessórios, roupas esportivas'),
(null, 'Adidas', 1949, 'Alemanha', 'Herzogenaurach', 'Calçados, roupas esportivas, equipamentos esportivos, produtos de higiene pessoal'),
(null, 'Fila', 1911, 'Itália', 'Biella', 'Calçados esportivos e casuais, roupas e acessórios'),
(null, 'Under Armor', 1996, 'Estados Unidos', 'Baltimore', 'Roupas, calçados, equipamentos esportivos, acessórios'),
(null, 'Umbro', 1924, 'Inglaterra', 'Cheadle', 'Materiais Esportivos');

 -- Exibindo os dados da tabela "marca"

select * from marca;

create table times (
idTime int primary key auto_increment,
nomeTime varchar(45),
estadio varchar(45),
anoFundacao int,
pais varchar(45), -- Os atributos "pais" e "estado" compõem a localização do time de futebol
estado varchar(45), -- portanto, atributo composto
relevancia varchar(30),
fkMarca int,
foreign key (fkMarca) references marca (idMarca),
check (relevancia = "Estadual" or relevancia = "Nacional" or relevancia = "Continental" or relevancia = "Mundial")
)auto_increment=100;
 
-- Inserindo dados na tabela times

insert into times values
(null, 'Corinthans', 'Arena Neo Química', 1910, 'Brasil', 'São Paulo', 'Continental', 1),
(null, 'Sport', 'Ilha do retiro', 1905, 'Brasil', 'Pernambuco', 'Nacional', 6),
(null, 'Coritiba', 'Couto Pereira', 1908, 'Brasil', 'Paraná', 'Nacional', 3),
(null, 'Boca Juniors', 'La Bombonera', 1911, 'Argentina', 'Buenos Aires', 'Continental', 1),
(null, 'Paris Saint German', 'Park des Princes', 1929, 'França', 'Paris', 'Continental', 2),
(null, 'Barcelona', 'Camp Nou', 1899, 'Espanha', 'Catalunha', 'Mundial', 1),
(null, 'Avaí', 'Ressacada', 1923, 'Brasil', 'Santa Catarina', 'Estadual', 4),
(null, 'Universidad Catolica', 'San Carlos de Apoquindo', 1937, 'Chile', 'Santiago', 'Continental', 5),
(null, 'Real Madrid', 'Santiago Bernabeu', 1900, 'Espanha', 'Madrid', 'Mundial', 3);

 -- Exibindo os dados da tabela "time"
select * from times;

-- Exibir os dados das tabelas, de forma correspondente
select times.*, marca.* from times, marca where fkmarca = idMarca;

-- Exibir os dados de uma tabela utilizando uma das funções aprendidas ((MAX, MIN, SUM, GROUP BY, AVG, COUNT); 
-- soma do ano de fundação dos times
select sum(anoFundacao) from times;
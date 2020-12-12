create database ac3JoaoAmorim;

use ac3JoaoAmorim;

create table concessionaria (
idConcessionaria int primary key auto_increment,
grupoConcessionaria varchar(45),
logradouro varchar(45),
bairro varchar(45),
numero int,
cnpj char(14)
);

insert into concessionaria values
(null, 'Localiza Hertz', 'Avenida Almeida filho', 'Jardim aeroporto', 1425, '49319202000190'),
(null, 'Unidas', 'Avenida Bandeirantes', 'Jardim Congonhas', 2846, '23070134000184'),
(null, 'Movida', 'Avenida indepente', 'Jardim Malia II', 528, '89405152000188'),
(null, 'ReservCars', 'Avenida Guarulhos', 'Jardim coqueiros', 3748, '55300338000150');

select * from concessionaria;

create table marca (
idMarca int auto_increment primary key,
nomeMarca varchar(45),
paisOrigem varchar(45)
)auto_increment=100;

insert into marca values
(null, 'Fiat', 'Itália'),
(null, 'Volkswagem', 'Alemanha'),
(null, 'Toyota', 'Japão'),
(null, 'Chevrolet', 'EUA'),
(null, 'Jeep', 'EUA'),
(null, 'Honda', 'Japão'),
(null, 'Ford', 'EUA');

select * from marca;

create table carros (
idCarro int primary key auto_increment,
modeloCarro varchar(45),
corCarro varchar(45),
ano char(4),
valorDiaria decimal(6,2),
fkConcessionaria int,
fkMarca int,
foreign key (fkMarca) references marca (idMarca),
foreign key (fkConcessionaria) references concessionaria (idConcessionaria)
)auto_increment=1000;

insert into carros values
(null, 'Ka', 'Cinza', '2016', 350, 4, 106);

insert into carros values
(null, 'Onix', 'Branco', '2015', 325, 4, 103),
(null, 'Siena', 'Prata', '2014', 335, 4, 100),
(null, 'Renegade', 'Preto', '2019', 405, 3, 104),
(null, 'Voyage', 'Prata', '2017', 349, 3, 101),
(null, 'Onix', 'Cinza', '2016', 334, 2, 103),
(null, 'Corolla', 'Cinza', '2020', 415, 2, 102),
(null, 'City', 'Branco', '2019', 410, 1, 105),
(null, 'Compass', 'Preto', '2021', 550, 1, 104);

select * from carros;


create table cliente (
idCliente int auto_increment primary key,
nomeCliente varchar(45),
cnh char(11),
cpf char(11),
rua varchar(45),
bairro varchar(45),
numero int
)auto_increment= 10000;

insert into cliente values
(null, 'João Vitor de Amorim', '49177183285', '26944933861', 'Rua projetada', 'Chácara Gaivotas', '27'),
(null, 'Vitória Lima', '74746767501', '59724595820', 'Amaro vaz', 'Jardim andré', 60),
(null, 'Steve Tonino', '07466229403', '67067740819', 'Vaz de lima', 'Jardim Amboré', 88),
(null, 'Lucas Pereira', '76228737742', '77601159892', 'Nunes porta', 'Jardim Alvez', 73),
(null, 'Higor Tadeu', '60630396551', '67341680857', 'Engenheiro Tavares', 'Marsilac', 150);

select * from cliente;

create table aluguel (
fkCarro int,
fkCliente int,
dataAluguel datetime,
dataDevolucao datetime,
valorTotal decimal(6,2),
foreign key (fkCarro) references carros (idCarro),
foreign key (fkCliente) references cliente (idCliente),
primary key (fkCarro, fkCliente)
);

insert into aluguel values
(1000, 10004, '2020-11-21 07:00', '2020-11-22- 07:00', 350),
(1004, 10002, '2020-11-22 13:00', '2020-11-23- 14:00', 349),
(1002, 10003, '2020-11-22 19:00', '2020-11-24- 19:00', 670),
(1007, 10001, '2020-11-24 20:00', '2020-11-25- 20:00', 410),
(1005, 10000, '2020-11-25 18:00', '2020-11-26- 19:00', 334);

insert into aluguel values
(1007, 10000, '2020-11-27 15:00', '2020-11-28 15:00', 410);

select * from aluguel;

--   Exibir os dados das tabelas correspondentes;

select * from concessionaria inner join carros on idConcessionaria = fkConcessionaria
 inner join marca on idMarca = fkMarca
 inner join aluguel on fkCarro = idCarro
 inner join cliente on idCliente = fkCliente;
 
 -- Exibir os dados das tabelas, de forma correspondente, de um determinado campo (Dados referentes ao carro '1000');
 
 select * from concessionaria inner join carros on idConcessionaria = fkConcessionaria
 inner join marca on idMarca = fkMarca
 inner join aluguel on fkCarro = idCarro
 inner join cliente on idCliente = fkCliente where idcarro = 1000;
 
 --  Exibir os dados da tabela associativa, utilizando o atributo numérico com pelo menos 1 função aprendida
 -- (SUM, AVG, MIN, MAX) e agrupando esses dados por um determinado campo (GROUP BY).
 
 select aluguel.*, sum(valorTotal) from aluguel group by fkCarro;
 
                                                                                                                 









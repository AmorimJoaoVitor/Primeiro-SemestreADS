create database familia;

use familia;

create table pessoa (
idPessoa int primary key auto_increment,
nomePessoa varchar(45),
dataNasc date,
profissao varchar(45),
fkGasto int,
foreign key (fkGasto) references gasto (idGasto)

);

create table gasto (
idGasto int primary key auto_increment,
dataGasto date,
valor varchar(45),
descricao varchar(45)
)auto_increment = 1000;

insert into gasto values
(null, '2020/07/26', 'R$ 300', 'Placa de captura'),
(null, '2020/08/16', 'R$ 1850', 'Pc Gamer'),
(null, '2020/08/17', 'R$ 100', 'Mouse Gamer'),
(null, '2020/09/10', 'R$ 150', 'teclado Gamer'),
(null, '2020/09/30', 'R$ 950', 'Smartphone'),
(null, '2020/10/05', 'R$ 370', 'Microondas');

insert into pessoa values
(null, 'C

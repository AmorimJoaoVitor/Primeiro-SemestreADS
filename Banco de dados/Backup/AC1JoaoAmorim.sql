create database AC101202021;

use AC101202021;

create table Carros (
Idcarro int auto_increment primary key,
Modelo varchar(40),
Marca varchar(40),
Ano char(4) not null,
Preço varchar(40) 
);

-- Inserir dados na tabela (carros)
insert into carros (Modelo, Marca, Ano, Preço) values
('Ka', 'Ford', '2003','R$ 8500');

insert into carros (Modelo, Marca, Ano, Preço) values
('Corolla', 'Toyota', '2019','R$ 54000'),
('Ônix', 'Chevrolet', '2018','R$ 36000'),
('Prisma', 'Chevrolet', '2018','R$ 38000'),
('Fluence', 'Renault', '2017','R$ 37000'),
('Gol', 'Volkswagen', '2013', 'R$ 19500'),
('Uno', 'Fiat', '2013', 'R$ 20700'),
('Veloster', 'Hyundai', '2016','R$ 31800');


-- Exibir todos os dados da tabela
Select * from carros;

-- Exibir dados da tabela por qualquer campo que não seja o id e em ordem decrescente (modelo)
select * from carros order by modelo desc;

-- Exibir dados de apenas uma coluna da tabela (marca)
select marca from carros;

-- Exibir os dados da tabela, do campo cujo dado tenha como penúltima letra uma determinada letra (Marca com a penultima letra "E")
select * from carros where marca like '%e_';

-- Exibir os dados da tabela, do campo cujo dado termine com uma determinada letra (Modelos com a ultima letra "A")
select * from carros where Modelo like '%a';

-- Atualizar um dado da tabela e exibir a tabela para verificar a atualização,(Preço do gol foi de 19500 -> 16500);
update carros set preço = 'R$ 16500' where idcarro = 6;
select * from carros;

--  Excluir um registro da tabela e exibir a tabela para verificar a exclusão;
delete from carros where idcarro = 8;
select * from carros;

-- Eliminar a tabela e o banco de dados
-- drop table carros; 
-- drop database ac101202021;


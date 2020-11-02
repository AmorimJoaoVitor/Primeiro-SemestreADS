create database petshop;

use petshop;

create table tbCliente (
idCliente int primary key auto_increment,
nome varchar(45),
telefoneFixo varchar(9),
telefoneCelular varchar(10),
nomeRua varchar(100),
bairro varchar(45),
numeroCasa int
);


insert into tbcliente values (null, 'Steve Tonino', '5664-7465', '99983-8972', 'Rua Projetada', 'Parque alto', 84);

insert into tbCliente values
(null, 'Rebeca Marta', '5932-7182', '98561-8431', 'Rua da paz', 'Chácara Klabin', 62),
(null, 'Maria Roberta', '5934-8925', '98647-2465', 'Rua cinco', 'Rio Bonito', 27),
(null, 'Stephani Villasboas', '5846-8436', '96942-5791', 'Rua amazônia preservada', 'Cidade Dutra',46),
(null, 'Mario Brok', '8756-4862', '92375-3457', 'Rua rebuscada', 'Jardim Universal', 49),
(null, 'Cléber Tonino', '5935-9461', '93476-1058', 'Rua Planejada', 'Jardim Nakamura', 93);


select * from tbcliente;

create table tbPet (
idPet int primary key auto_increment,
tipo varchar(45),
nome varchar(45),
raça varchar(45),
DataNascimento date,
fkCliente int,
foreign key (fkCliente) references tbCliente (idCliente)
)auto_increment=100;

insert into tbpet values
(null,'Cachorro','Faísca', 'Pinscher', '2020/01/28', 2);

insert into tbpet values
(null,'Cachorro','Bethoven', 'Pastor-Alemão', '2020/01/10', 5),
(null,'Gato','Floquinho', 'Maine Coon', '2020/02/15', 1),
(null,'Gato','Bob', 'Siamês', '2020/05/27', 3),
(null,'Gato','Armando', 'Persa', '2020/06/14', 4),
(null,'Cachorro','Tobi', 'Shi-Tzu', '2020/08/08', 6),
(null,'Cachorro','Lara', 'Shi-Tzu', '2018/04/23', 6);

select * from tbpet;

-- Altere o tamanho da coluna nome do cliente.
alter table tbcliente modify nome varchar(50);
desc tbcliente;

-- - Exibir os dados de todos os pets que são de um determinado tipo (gato)
select * from tbpet where tipo like "%Gato%";

-- Exibir apenas os nomes e as datas de nascimento dos pets.
select nome, DataNascimento from tbpet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
select * from tbpet order by nome;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.
select * from tbcliente order by bairro desc;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra. (B)
select * from tbpet where nome like "B%";

-- Exibir os dados dos clientes que têm o mesmo sobrenome. (Tonino)
select * from tbcliente where nome like "%Tonino%";

-- Alterar o telefone de um determinado cliente.
update tbcliente set telefonefixo = "5931-5384" where idcliente = 4;

-- Exibir os dados dos clientes para verificar se alterou.
select * from tbCliente;

-- Exibir os dados dos pets e dos seus respectivos donos.
select tbpet.*, tbcliente.* from tbpet, tbcliente where fkCliente = idCliente;

-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um 
-- determinado cliente. (Rebeca Marta).
select tbpet.*, tbcliente.* from tbpet, tbcliente where fkCliente = idCliente 
												and tbcliente.nome = "Rebeca Marta";
                                                
--  Excluir algum pet (Bethoven)
delete from tbpet where idpet = 101;     
select * from tbpet;     

-- João Vitor de Amorim Bezerra
-- 1ADSA
-- Professora : Vivian                                     





create database termoLabs;
use termoLabs;

create table sensores(
	idSensor int primary key auto_increment,
    tipoSensor varchar(40) not null,
    medicaoHr datetime,
    temperatura int
    );
    
    create table empresas(
	idEmpresa int primary key auto_increment,
    nome varchar(100) not null,
	cnpj char(13) not null,
	repEmpresa varchar(100),
    email varchar(100),
	telefone varchar(15),
    fkSensor int,
    foreign key (fkSensor) references sensores(idSensor)
	);
desc sensores;
desc empresas;

alter table sensores drop column umidade;


insert into sensores values
	(null, 'temperatura', '2020-09-25 13:30:00', 2),
	(null, 'temperatura', '2020-09-15 13:32:00', 5),
	(null, 'temperatura', '2020-09-15 13:34:00', 3),
	(null, 'temperatura', '2020-09-15 14:20:00', 6),
	(null, 'temperatura', '2020-09-15 14:40:00', 4);
    
    select * from sensores;
    
insert into empresas values
	(null, 'Eurofarma', '0845156060011', 'Tony Silva', 'tony_silva@eurofarma.com', '11-99965523', 5),
    (null, 'Ultrafarma','1182349100018', 'Carlos Alberto', 'cazabe1@ultrafarma.com', '11-98763412', 3),
    (null, 'Medley', '0432096900009', 'Márcio Duarte', 'marcio_duarte@medley.com', '11-50729081', 4),
    (null, 'NeoLab', '7809986700018', 'Esther Quintino', 'esther_quintino@neolab.com', '11-70705679', 2);
    
    select * from empresas;
    
-- Selects bonitinhos
select empresas.*, sensores.tipoSensor from empresas, sensores where idSensor = fkSensor;
select empresas.*, sensores.temperatura from empresas, sensores where idSensor = fkSensor;

select nome, cnpj, telefone from empresas;


-- AlterTables
alter table sensores modify tipoSensor varchar(40);


-- Updates
update empresas set repempresa = 'Esther Quintino', telefone = '11-70705679' where idempresa = 4 ;
delete from empresas where idempresa = 4;

insert into empresas values 
 (null, 'NeoLab', '7809986700018', 'Esther Quintino', 'esther_quintino@neolab.com', '11-70705679', 2);

create database Funcionario;
use Funcionario;
create table Funcionario (
   idFunc int primary key auto_increment,
   nome varchar(40),
   sexo char(1),
   check (sexo = 'm' or sexo ='f' or sexo = 'n'),
   salario decimal(7,2), -- 7 significa que o número tem 7 digitos, considerando os digitos antes da 
                         -- virgula e os depois
                         -- 2 significa que tem 2 diginos após a vírgula
                         -- decimal(7,2) significa um número do tipo 99999,99
   check (salario > 0),  
                         -- se fosse nota: check (nota >= 0 and nota <= 10)
   fkSupervisor int,  -- implementação de um relacionamento recursivo um para muitos
   foreign key(fkSupervisor) references Funcionario(idFunc)
) auto_increment = 1000;
select * from Funcionario;
desc Funcionario;
update funcionario set fksupervisor = 1002 where idfunc = 1000;
-- o comando a seguir não funciona pois está tentando inserir 'x' para sexo
insert into Funcionario values
    (null, 'Maria Aparecida','x',15000,null);
-- inserção de um funcionário, que não tem supervisor    
insert into Funcionario values
    (null, 'Maria Aparecida','f',15000,null);
-- inserção de mais um funcionário (supervisor deste funcionário será a Maria Aparecida - id 1000)    
insert into Funcionario values
	(null, 'José da Silva','m',5000,1000);
-- inserção de mais um funcionário (supervisor deste funcionário será o José da Silva - id 1001)
insert into Funcionario values
    (null, 'João Oliveira','m',2000,1001);
-- o comando a seguir não funciona pois está tentando inserir salário = 0
insert into Funcionario values
    (null, 'Fulano', 'n', 0, 1000); 
-- o comando a seguir não funciona pois está tentando inserir salário negativo
insert into Funcionario values
    (null, 'Fulano', 'n', -1000, 1000); 
-- Exibir os dados dos funcionários e dos supervisores
-- correspondentes
-- se existissem 2 tabelas, uma Funcionario e outra Supervisor, ficaria assim o comando:
select * from Funcionario, Supervisor where fkSupervisor = idSupervisor;
-- mas como a tabela é a mesma, tanto de Funcionario como de Supervisor, então o certo é:
select * from Funcionario as f, Funcionario as s
        where f.fkSupervisor = s.idFunc;
        
-- Criação da tabela Dependente, que é uma entidade fraca em relação a Funcionario 
create table Dependente (
   fkFunc int,
   foreign key (fkFunc) references Funcionario(idFunc),
   idDep int,
   primary key (fkFunc, idDep),  -- chave primária composta
   nome varchar(40),
   dataNasc date
);
-- Inserção de dependentes
insert into Dependente values -- lote
   (1000, 1, 'Ana', '2012-10-01'),
   (1000, 2, 'Paulo', '2014-03-05'),
   (1001, 1, 'Antônio', '2013-09-06'),
   (1002, 1, 'Clara', '2014-06-01');
-- Exibe a tabela Dependente
select * from Dependente;
-- Exibe os funcionários e seus dependentes
select * from Funcionario, Dependente where fkFunc = idFunc; 

select * from Dependente where nome='Paulo';
select * from Dependente where fkFunc=1000 and idDep=2;
update Dependente set nome='Paulo Jonas' where fkFunc=1000 and idDep = 2;
  
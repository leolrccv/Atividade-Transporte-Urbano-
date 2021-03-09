CREATE DATABASE AtividadeTransporte;
USE AtividadeTransporte;

CREATE TABLE Empresa(
	IdEmpresa int not null identity(1,1),
	Nome varchar(50) not null,
	Telefone char(11) not null,
	WebSite varchar(255),
	EndLocalidade varchar(75) not null,
	EndUf char(2) not null,
	EndLogradouro varchar(75) not null,
	EndNumero int not null,
	EndComplemento varchar(50),
	EndCep char(8) not null,
	EndBairro varchar(75) not null,

	CONSTRAINT PK_IdEmpresa PRIMARY KEY (IdEmpresa)
);

create table Itinerario(
	IdItinerario int not null identity(1,1),
	Sentido varchar(50) not null,
	constraint PK_IdItinerario primary key (IdItinerario)
);

create table Cidade(
	IdCidade int not null identity(1,1),
	Nome varchar(50) not null,
	Uf char(2) not null,
	constraint PK_IdCidade primary key (IdCidade),
);

create table Logradouro(
	IdLogradouro int not null identity(1,1),
	IdCidade int not null,
	Nome varchar(50) not null,
	constraint PK_IdLogradouro primary key (IdLogradouro),
	constraint FK_Cidade_Logradouro foreign key (IdCidade) references Cidade(IdCidade)
);

create table LogradouroItinerario(
	IdLogradouro int not null,
	IdItinerario int not null,
	IndexItinerario int not null,
	constraint FK_Logradouro_LogradouroItinerario foreign key(IdLogradouro) references Logradouro(IdLogradouro),
	constraint FK_Itinerario_LogradouroItinerario foreign key(IdItinerario) references Itinerario(IdItinerario)
);

CREATE TABLE QuadroHorario (
	IdQuadroHorario int not null identity(1,1),
	Dia varchar(50) not null,

	CONSTRAINT PK_IdQuadroHorario PRIMARY KEY (IdQuadroHorario)
);

CREATE TABLE QuadroHorarioHorario (
	IdQuadroHorario int not null,
	Horario time not null,

	constraint FK_QuadroHorario_QuadroHorarioHorario foreign key(IdQuadroHorario) references QuadroHorario(IdQuadroHorario),
	CONSTRAINT PK_IdQuadroHorario_Horario PRIMARY KEY (IdQuadroHorario, Horario)
);

CREATE TABLE Linha (
	IdLinha int not null identity(1,1),
	IdItinerario int not null,
	IdQuadroHorario int not null,
	IdCidade int not null,
	Nome varchar(50) not null,

	CONSTRAINT PK_IdLinha PRIMARY KEY (IdLinha),
	CONSTRAINT FK_Itinerario_Linha FOREIGN KEY (IdItinerario) REFERENCES Itinerario(IdItinerario),
	CONSTRAINT FK_QuadroHorario_Linha FOREIGN KEY (IdQuadroHorario) REFERENCES QuadroHorario(IdQuadroHorario),
	CONSTRAINT FK_Cidade_Linha FOREIGN KEY (IdCidade) REFERENCES Cidade(IdCidade)
);
CREATE TABLE LinhaEmpresa(
	IdLinha int not null,
	IdEmpresa int not null,

	CONSTRAINT FK_Linha_Empresa FOREIGN KEY (IdLinha) REFERENCES Linha(IdLinha),
	CONSTRAINT FK_Empresa_Linha FOREIGN KEY (IdEmpresa) REFERENCES Empresa(IdEmpresa)
);

INSERT INTO Cidade (Nome, Uf) VALUES ('Araraquara', 'SP');

SELECT * FROM Cidade;

INSERT INTO Logradouro (IdCidade, Nome) values (1, 'Rua Lino Morgante');
INSERT INTO Logradouro (IdCidade, Nome) values (1, 'Av. Miguel Pocce');
INSERT INTO Logradouro (IdCidade, Nome) values (1, 'Av. José Barbanti Neto');
INSERT INTO Logradouro (IdCidade, Nome) values (1, 'Av. Antônio Honório Real');
INSERT INTO Logradouro (IdCidade, Nome) values (1, 'Av. Prof° Gustavo Fleury Charmillot');
insert into Logradouro(IdCidade, Nome) values(1, 'TCI');
insert into Logradouro(IdCidade, Nome) values(1, 'Rua Bento Machado Ramalho');
insert into Logradouro(IdCidade, Nome) values(1, 'Rua Prof. Virgilio Abranches Quintão');
insert into Logradouro(IdCidade, Nome) values(1, 'Rua Carlos Gomes');
insert into Logradouro(IdCidade, Nome) values(1, 'Av. Padre Francisco Sales Culturato');
insert into Logradouro(IdCidade, Nome) values(1, 'Rua São Bento');
insert into Logradouro(IdCidade, Nome) values(1, 'Av. Portugal');
insert into Logradouro(IdCidade, Nome) values(1, 'Av. Augusto Bernardi ');

select * from Logradouro;

Insert into QuadroHorario (Dia) values ('Fim De Semana');
Insert into QuadroHorario (Dia) values ('Feriados');
Insert into QuadroHorario (Dia) values ('Dias uteis');

select * from QuadroHorario;

insert into QuadroHorarioHorario (IdQuadroHorario, Horario) values (1, '5:05');
insert into QuadroHorarioHorario (IdQuadroHorario, Horario) values (1, '12:30');

insert into QuadroHorarioHorario (IdQuadroHorario, Horario) values (2, '13:30');

insert into QuadroHorarioHorario (IdQuadroHorario, Horario) values (3, '5:30');
insert into QuadroHorarioHorario (IdQuadroHorario, Horario) values (3, '12:00');
insert into QuadroHorarioHorario (IdQuadroHorario, Horario) values (3, '13:00');
insert into QuadroHorarioHorario (IdQuadroHorario, Horario) values (3, '18:00');

select * from QuadroHorarioHorario;

INSERT INTO Itinerario (Sentido) values ('AGUAS DO PAIOL/TCI');

select * from Itinerario;

insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (1, 13, 1);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (1, 1, 2);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (1, 2, 3);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (1, 3, 4);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (1, 4, 5);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (1, 5, 6);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (1, 7, 7);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (1, 8, 8);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (1, 9, 9);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (1, 10, 10);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (1, 11, 11);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (1, 12, 12);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (1, 6, 13);

select * from LogradouroItinerario;

INSERT INTO Linha (IdItinerario, IdQuadroHorario, IdCidade, Nome) VALUES (1, 3, 1, 'AGUAS DO PAIOL - TERMINAL TCI');

select * from Linha;

Insert into Empresa (Nome, Telefone, WebSite, EndLocalidade, EndUf, EndLogradouro, EndNumero, EndCep, EndBairro)
values ('Paraty', '1633347800', 'vparaty.com.br', 'Araraquara', 'SP', 'Av. Otto Ernani Muller', 10, '14800630', 'Jarim Tamoio');

select * from Empresa;

insert into LinhaEmpresa (IdLinha, IdEmpresa) values (1, 1);

select * from LinhaEmpresa;



Insert into Empresa (Nome, Telefone, WebSite, EndLocalidade, EndUf, EndLogradouro, EndNumero, EndCep, EndBairro)
values ('Empresa Cruz', '1633220299', 'empresacruz.com.br', 'Araraquara', 'SP', 'Rua. Domingos Zanin', 264, '14803650', 'Vila Melhado');

select * from Empresa;

insert into LinhaEmpresa (IdLinha, IdEmpresa) values (1, 2);

select * from LinhaEmpresa;

INSERT INTO Itinerario (Sentido) values ('FONTE / JARDIM DAS ESTAÇÕES');

select * from Itinerario;

insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (2, 13, 1);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (2, 1, 2);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (2, 2, 3);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (2, 3, 4);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (2, 4, 5);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (2, 5, 6);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (2, 7, 7);
insert into LogradouroItinerario (IdItinerario, IdLogradouro, IndexItinerario) values (2, 8, 8);


insert into Linha (IdItinerario, IdQuadroHorario, IdCidade, Nome) VALUES (2, 2, 1, 'FONTE / JARDIM DAS ESTAÇÕES');
insert into LinhaEmpresa (IdLinha, IdEmpresa) values (2, 2);
 
 
-- (A) Todas as linhas da empresa

SELECT E.Nome AS "Empresa", L.Nome AS "Sentido"
FROM LinhaEmpresa LE 
JOIN Empresa E ON E.IdEmpresa = LE.IdEmpresa 
JOIN Linha L ON LE.IdLinha = L.IdLinha;

-- (B) Itinerário da linha por nome

SELECT	li.IndexItinerario as "Etapas", lo.Nome as "Logradouro"
FROM Linha L
JOIN Itinerario I ON I.IdItinerario = l.IdItinerario
JOIN LogradouroItinerario LI ON LI.IdItinerario = I.IdItinerario
JOIN Logradouro LO ON LO.IdLogradouro = LI.IdLogradouro
WHERE L.Nome = 'AGUAS DO PAIOL - TERMINAL TCI';

-- (C) Quadro de horário de determinada linha pesquisando pelo nome do quadro

select qh.Dia as "Quadro de Horário", qho.Horario as "Horário de saída" from QuadroHorario QH
JOIN QuadroHorarioHorario QHO on QH.IdQuadroHorario = QHO.IdQuadroHorario
where QH.Dia = 'Dias uteis';

-- (D) Linhas que passam por logradouro determinado

select E.Nome as "Empresa", L.Nome as "Nome Sentido" 
from Linha L
JOIN Itinerario I ON I.IdItinerario = L.IdItinerario
JOIN LogradouroItinerario LO ON I.IdItinerario = LO.IdItinerario
JOIN Logradouro LG ON LG.IdLogradouro = LO.IdLogradouro
JOIN LinhaEmpresa LE on LE.IdLinha = L.IdLinha
JOIN EMPRESA E ON E.IdEmpresa = LE.IdEmpresa
WHERE Lg.Nome like 'TCI' AND LG.IdCidade = 1;
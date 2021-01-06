create table koncert (
idkoncert int auto_increment primary key,
nazwa_koncertu varchar(45) not null,
sala int,
data date not null,
godzina_rozp time not null,
godzina_zak time not null
);

create table zespoly (
idzespoly int auto_increment primary key,
nazwa varchar(45) not null,
wokalisci int,
muzycy int
);

create table sale_koncertowe (
idsali int auto_increment primary key,
nazwa_sali varchar(45) not null,
miejscowosc varchar(45) not null,
ulica varchar(45) not null,
ilosc_miejsc int not null
);

create table koszty (
idkoszty int primary key,
koncert int unique not null,
dekoracje int,
oswietlenie int,
naglosnienie int,
wynajecie_sali int,
foreign key (koncert) references koncert(idkoncert)
);

create table faktury (
idfaktury int not null primary key,
nr_faktury int not null,
data_wystawienia date not null,
wartosc int not null,
kwota_podatku int not null,
koncert int unique not null,
foreign key (koncert) references koncert(idkoncert)
);

create table koncerty_zespoly_sale_koncertowe (
koncert int,
zespoly int,
sala int,
foreign key (koncert) references koncert(idkoncert),
foreign key (zespoly) references zespoly(idzespoly),
foreign key (sala) references sale_koncertowe(idsali)
);


insert into koncert values 
(default,'KoronaParty','1','2019-05-19','20:00:00','4:00:00'),
(default,'KoronaPartyV2','1','2020-06-25','19:00:00','5:00:00'),
(default,'Sylwester Marzen','2','2019-12-31','21:00:00','23:59:00'),
(default,'Sylwesterowa Zabawa','2','2020-12-31','19:00:00','23:59:00'),
(default,'Dożynki','3','2015-08-15','18:00:00','21:00:00'),
(default,'Festiwal','4','2018-08-04','19:00:00','5:00:00'),
(default,'Noc Pod Latarnia','5','2015-05-10','21:00:00','23:59:00');

insert into faktury values 
('1','1863','2019-06-19','20000','23','1'),
('2','1168','2020-09-25','25000','23','2'),
('3','121','2019-12-31','1000','23','3'),
('4','1865','2020-12-31','1500','23','4'),
('5','1865','2015-11-15','30000','23','5'),
('6','1618','2018-09-04','50000','23','6'),
('7','1846','2015-12-10','10000','23','7');

insert into koszty values 
('1','1','5000','5000','5000','5000'),
('2','2','10000','5000','5000','5000'),
('3','3','100','500','300','100'),
('4','4','400','500','500','100'),
('5','5','5000','5000','5000','15000'),
('6','6','10000','10000','5000','25000'),
('7','7','2500','2500','4000','1000');

insert into sale_koncertowe values 
('1','Remiza','Grzybowo','Prosta','200'),
('2','Biala Dama','Mława','Sienkiewicza','25'),
('3','Bajkowy Dworek','Lelice','Dluga','300'),
('4','Kurka','Radzanow','Krotka','300'),
('5','Sala latarnik','Leszno','Sportowa','100');

insert into zespoly values 
(default,'Akcent','1','3'),
(default,'Jws','3','0'),
(default,'Enej','5','2'),
(default,'Wujek Henio z Zespolem','3','3'),
(default,'Fax','1','2'),
(default,'Gorale','2','4');

insert into koncerty_zespoly_sale_koncertowe values 
('1','1','1'),
('2','1','2'),
('3','2','3'),
('4','4','4'),
('5','5','5'),
('6','6','6'),
('7','2','3');

Zapytania
1. select * from koncert where sala='2'; /koncerty odbywajace sie w sali pod id 2
2. select nazwa, wokalisci from zespoly where wokalisci>2 / zespoly w ktorch jest wiecej niz 2 wokalistow
3. select avg(wynajecie_sali) as sredni_koszt_sali from koszty;
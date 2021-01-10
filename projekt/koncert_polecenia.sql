create table sale_koncertowe (
idsali int auto_increment primary key,
nazwa_sali varchar(45) not null,
miejscowosc varchar(45) not null,
ulica varchar(45) not null,
numer_ulicy int NOT NULL,
ilosc_miejsc int not null
);

create table koncert (
idkoncert int auto_increment primary key,
nazwa_koncertu varchar(45) not null,
sala int not null,
data date not null,
godzina_rozp time not null,
godzina_zak time not null,
foreign key (sala) references sale_koncertowe(idsali)
);

create table zespoly (
idzespoly int auto_increment primary key,
nazwa varchar(45) not null,
wokalisci int,
muzycy int
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
netto int not null,
brutto int,
koncert int unique not null,
foreign key (koncert) references koncert(idkoncert)
);

create table koncerty_zespoly (
koncert int,
zespoly int,
foreign key (koncert) references koncert(idkoncert),
foreign key (zespoly) references zespoly(idzespoly)
);

create table faktury_delete (
id_delete int auto_increment primary key,
idfaktury int NOT NULL,
nr_faktury int not null,
data_wystawienia date not null,
data_usuniecia date);

insert into sale_koncertowe values
(1,'Remiza','Grzybowo','Prosta',23,200),
(2,'Biala Dama','Mława','Sienkiewicza',67,25),
(3,'Bajkowy Dworek','Lelice','Dluga',35,300),
(4,'Kurka','Radzanow','Krotka',21,300),
(5,'Sala latarnik','Leszno','Sportowa',9,100),
(6,'Klub Ekwador','Manieczki','Dluga',15,250),
(7,'Klub Stodola','Olsztyn','Napelonska',3,350);

insert into koncert values 
(default,'KoronaParty',1,'2019-05-19','18:00:00','22:00:00'),
(default,'KoronaPartyV2',1,'2020-06-25','19:00:00','23:00:00'),
(default,'Sylwester Marzen',2,'2019-12-31','21:00:00','23:59:00'),
(default,'Sylwesterowa Zabawa',2,'2020-12-31','19:00:00','23:59:00'),
(default,'Dożynki',3,'2015-08-15','18:00:00','21:00:00'),
(default,'Festiwal',4,'2018-08-04','19:00:00','21:00:00'),
(default,'Noc Pod Latarnia',5,'2015-05-10','17:00:00','23:00:00');

insert into faktury values 
(1,1863,'2019-06-19',20000,24600,1),
(2,1168,'2020-09-25',25000,30750,2),
(3,121,'2019-12-31',1000,1230,3),
(4,1865,'2020-12-31',1500,1845,4),
(5,1865,'2015-11-15',30000,36800,5),
(6,1618,'2018-09-04',50000,61500,6),
(7,1846,'2015-12-10',10000,12300,7);

insert into koszty values 
(1,1,5000,5000,5000,5000),
(2,2,10000,5000,5000,5000),
(3,3,100,500,300,100),
(4,4,400,500,500,100),
(5,5,5000,5000,5000,15000),
(6,6,10000,10000,5000,25000),
(7,7,2500,2500,4000,1000);

insert into zespoly values 
(default,'Akcent',1,3),
(default,'Jws',3,0),
(default,'Enej',5,2),
(default,'Wujek Henio z Zespolem',3,3),
(default,'Fax',1,2),
(default,'Gorale',2,4);

insert into koncerty_zespoly values 
(1,1),
(1,2),
(2,1),
(3,2),
(3,5),
(4,4),
(4,1),
(4,2),
(5,6),
(6,6),
(6,4),
(7,2);


Zapytania
1. select * from koncert where sala='1'; /koncerty odbywajace sie w sali pod id 2
2. select nazwa_koncertu, data from koncert where data>'2020-03-20'; / koncerty ktore odbyly sie po ogloszeniu pandemi w Polsce
3. select nazwa, wokalisci from zespoly where wokalisci>2 / zespoly w ktorch jest wiecej niz 2 wokalistow
4. select avg(wynajecie_sali) as sredni_koszt_sali from koszty; /sredni koszt wynajecie sali
5. select koncert, count(zespoly) as liczba_zespolow from koncerty_zespoly group by koncert; / id koncertu i liczba zespołow jakie graja na danym koncercie
6. select k.nazwa_koncertu, z.nazwa as nazwa_zespolu from koncert k inner join koncerty_zespoly kz on k.idkoncert = kz.koncert inner join zespoly z on kz.zespoly = z.idzespoly; / nazwa konceru i zespoly jakie na nim graja
7. select idsali, nazwa_sali from sale_koncertowe where idsali not in (select sala from koncert); /sale ktore nie sa przypisane do zadnego koncertu
8. select z.idzespoly, z.nazwa from zespoly z left join koncerty_zespoly kz on z.idzespoly=kz.zespoly where kz.zespoly is NULL; / zespol ktory nie gra na zdanym koncercie
9. select SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(godzina_zak,godzina_rozp)))/count(idkoncert)) as średni_czas_koncertu from koncert; /sredni czas trwania koncertu
10. select zespoly, count(koncert) as liczba_koncertów from koncerty_zespoly group by zespoly; / nazwa zespoly i na ilu koncertach graja


create view zap1 as select * from koncert where sala='1';
create view zap2 as select data from koncert where data>'2020-03-20';
create view zap3 as select nazwa, wokalisci from zespoly where wokalisci>2;
create view zap4 as select avg(wynajecie_sali) as sredni_koszt_sali from koszty;
create view zap5 as select koncert, count(zespoly) as liczba_zespolow from koncerty_zespoly group by koncert;
create view zap6 as select k.nazwa_koncertu, z.nazwa as nazwa_zespolu from koncert k inner join koncerty_zespoly kz on k.idkoncert = kz.koncert inner join zespoly z on kz.zespoly = z.idzespoly;
create view zap7 as select idsali, nazwa_sali from sale_koncertowe where idsali not in (select sala from koncert);
create view zap8 as select z.idzespoly, z.nazwa from zespoly z left join koncerty_zespoly kz on z.idzespoly=kz.zespoly where kz.zespoly is NULL;
create view zap9 as select SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(godzina_zak,godzina_rozp)))/count(idkoncert)) as średni_czas_koncertu from koncert;
create view zap10 as select zespoly, count(koncert) as liczba_koncertów from koncerty_zespoly group by zespoly;
 
 
DELIMITER $$
CREATE TRIGGER before_insert_faktury
BEFORE INSERT ON faktury
FOR EACH ROW
BEGIN
  IF NEW.brutto is null
  THEN
    SET NEW.brutto = 1.23*NEW.netto;
  END IF;    
END
$$
DELIMITER ;

DELIMITER $$
create trigger after_delete_faktury
after delete on faktury
for each row
begin

INSERT into faktury_delete values
(default,OLD.idfaktury,OLD.nr_faktury,old.data_wystawienia,SYSDATE());

END $$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION ilosc_koncertow()
    RETURNS INTEGER
    DETERMINISTIC
BEGIN
    DECLARE ile INT;
    SELECT COUNT(*) INTO @ile FROM koncert;
    RETURN @ile;
END
$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE przychod(IN id int)
BEGIN
select (f.brutto - (k.dekoracje + k.oswietlenie + k.naglosnienie + wynajecie_sali)) as przychod from koszty k, faktury f, koncert kc where kc.idkoncert=k.koncert and kc.idkoncert=f.koncert and idfaktury = id;
END $$
DELIMITER ;

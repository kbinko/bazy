--1.1
--select * from pracownik;
--1.2
--select imie from pracownik;
--1.3
--select imie, nazwisko, dzial from pracownik;

--2.1
--SELECT imie, nazwisko, pensja FROM pracownik ORDER BY pensja DESC;
--2.2
--select imie, nazwisko from pracownik order by nazwisko, imie ASC
--2.3
--select nazwisko, dzial, stanowisko from pracownik order by dzial asc, stanowisko desc;

--3.1
--select distinct dzial from pracownik;
--3.2
--select distinct dzial, stanowisko from pracownik;
--3.3
--select distinct dzial, stanowisko from pracownik order by dzial, stanowisko desc;

--4.1 
--select imie, nazwisko from pracownik where imie = 'Jan';
--4.2
--select imie, nazwisko from pracownik where stanowisko = 'sprzedawca';
--4.3
--select imie, nazwisko,pensja from pracownik where pensja>=1500 order by pensja desc;

--5.1
--SELECT imie, nazwisko, dzial, stanowisko FROM pracownik WHERE dzial='obs³uga klienta' AND 
--stanowisko='sprzedawca';
--5.2
--select imie, nazwisko, dzial, stanowisko from pracownik where dzial='techniczny' and (stanowisko='kierownik' or stanowisko='sprzedawca');
--5.3
--select * from samochod where marka != 'fiat' and marka != 'ford';

--6.1
--select * from samochod where marka in ('mercedes', 'Seat', 'Opel');
--6.2
--select imie, nazwisko, data_zatr from pracownik where imie in('anna', 'marzena', 'alicja');
--6.3
--select imie, nazwisko, miasto from klient where miasto not in('warszawa', 'wroc³aw');

--7.1
--select imie, nazwisko from klient where imie like '%k%';
--7.2
--select imie, nazwisko from klient where nazwisko like 'D%ski';
--7.3
--select imie, nazwisko from klient where nazwisko like '_O%' or nazwisko like '_a%';

--8.1
--select * from samochod where poj_silnika between 1100 and 1600;
--8.2
--select * from pracownik where data_zatr between '1997-01-01' and '1997-12-31';
--8.3
--select * from samochod where przebieg between 10000 and 20000 or przebieg between 30000 and 40000;

--9.1 
--select * from pracownik where dodatek is null;
--9.2
--select * from klient where nr_karty_kredyt is not null;
--9.3
--select imie, nazwisko, coalesce(dodatek, 0) as dodatek from pracownik; 

--10.1
--select imie, nazwisko, pensja, coalesce(dodatek, 0) as dodatek, (pensja + coalesce(dodatek, 0)) as do_zaplaty from pracownik;
--10.2
--select imie, nazwisko, pensja, (pensja * 1.5) as nowa_pensja from pracownik;
--10.3
--select imie, nazwisko, (pensja + coalesce(dodatek, 0)) * 0.01 AS jeden_procent from pracownik order by jeden_procent asc;

--11.1 
--select top 1 imie, nazwisko from pracownik order by data_zatr;
--11.2
--select top 4 imie, nazwisko from pracownik order by nazwisko, imie;
--11.3
--select top 1 * from wypozyczenie order by data_wyp desc;

--12.1
--SELECT imie, nazwisko, data_zatr 
--FROM pracownik 
--WHERE MONTH(data_zatr)=5 
--ORDER BY nazwisko ASC, imie ASC; 
--12.2
--select imie, nazwisko, datediff(day, data_zatr, getdate()) as dni from pracownik order by dni desc;
--12.3 
--select marka, typ, year(getdate()) - year(data_prod) as lata from samochod; 

--13.1
--SELECT imie, nazwisko, LEFT(imie,1)+'. '+LEFT(nazwisko,1)+'.' AS inicjaly 
--FROM klient ORDER BY inicjaly, nazwisko, imie; 
--13.2
--select
--upper(left(imie, 1)) + lower(substring(imie, 2, len(imie))) as Imie,
--upper(left(nazwisko, 1)) + lower(substring(nazwisko, 2, len(nazwisko))) as Nazwisko
--from klient;
--13.3 
--select 
--imie, nazwisko,
--left(nr_karty_kredyt, len(nr_karty_kredyt) - 6) + 'xxxxxx' as numer_karty 
--from klient

--14.1 
--UPDATE pracownik SET dodatek=50 WHERE dodatek IS NULL;
--14.2
--update klient set imie='Jerzy', nazwisko='Nowak' where id_klient = 10;
--14.3
--update pracownik set dodatek = coalesce(dodatek, 0) + 100 where pensja < 1500;

--15.1
--delete from klient where id_klient = 17;
--15.2
--delete from wypozyczenie where id_klient = 17;
--15.3
--delete from samochod where przebieg > 60000;

--16.1
--INSERT INTO klient (id_klient,imie,nazwisko,ulica,numer,kod,miasto,telefon) 
--VALUES(121,'Adam','Cichy','Korzenna','12','00-950','Warszawa','123-454-321');
--16.2
--insert into samochod (id_samochod, kolor, marka, typ, poj_silnika, data_prod, przebieg)
--values(50, 'srebrny', 'skoda', 'octavia', 1896, '2012-09-01', 5000)
--16.3
--insert into pracownik (id_pracownik, imie, nazwisko, data_zatr, dzial, stanowisko, pensja, dodatek, telefon, id_miejsce)
--values (61, 'Alojzy', 'Mikos', '2010-08-11', 'zaopatrzenie', 'magazynier', 3000, 50, '501-501-501', 1)
--select * from pracownik

--17.1
--SELECT s.id_samochod, s.marka, s.typ, w.data_wyp, w.data_odd 
--FROM samochod s INNER JOIN wypozyczenie w ON s.id_samochod=w.id_samochod 
--WHERE w.data_odd IS NULL;
--17.2
--select k.imie, k.nazwisko, w.id_samochod, w.data_wyp
--from klient k join wypozyczenie w on k.id_klient = w.id_klient
--where w.data_odd is null order by k.nazwisko, k.imie
--17.3
--select k.imie, k.nazwisko, w.data_wyp as data_wpl_kaucji, w.kaucja
--from klient k join wypozyczenie w on k.id_klient = w.id_klient
--where w.kaucja is not null

--18.1
--SELECT k.imie, k.nazwisko, w.data_wyp, s.marka, s.typ 
--FROM klient k INNER JOIN wypozyczenie w ON k.id_klient=w.id_klient 
--INNER JOIN samochod s ON w.id_samochod=s.id_samochod 
--ORDER BY k.nazwisko, k.imie, s.marka, s.typ; 
--18.2
--SELECT m.ulica, m.numer, s.marka, s.typ
--FROM miejsce m
--JOIN wypozyczenie w ON m.id_miejsce = w.id_miejsca_wyp
--JOIN samochod s ON w.id_samochod = s.id_samochod
--ORDER BY m.ulica, m.numer, s.marka, s.typ asc;
--18.3
--select s.id_samochod, s.marka, s.typ, k.imie, k.nazwisko 
--from samochod s join wypozyczenie w on s.id_samochod=w.id_samochod
--join klient k on k.id_klient=w.id_klient 
--order by s.id_samochod, k.nazwisko, k.imie

--19.1
--select max(pensja) as max_pensja from pracownik
--19.2
--select AVG(pensja) as avg_pensja from pracownik
--19.3
--select min(data_prod) as min_data_prod from samochod

--20.1
--SELECT k.imie, k.nazwisko, COUNT(w.id_klient) AS ilosc_wypozyczen 
--FROM klient k LEFT JOIN wypozyczenie w ON k.id_klient=w.id_klient 
--GROUP BY k.imie, k.nazwisko, k.id_klient
--ORDER BY COUNT(w.id_klient) DESC; 
--20.2
--select s.id_samochod, s.marka, s.typ, count(w.id_samochod) as ilosc_wypozyczen
--from samochod s left join wypozyczenie w on s.id_samochod=w.id_samochod
--group by s.id_samochod, s.marka, s.typ
--order by ilosc_wypozyczen
--20.3
--select p.imie, p.nazwisko, count(w.id_wypozyczenie) as liczba_wypozyczen
--from pracownik p left join wypozyczenie w on p.id_pracownik=w.id_pracow_wyp
--group by p.imie, p.nazwisko order by liczba_wypozyczen desc;

--21.1
--SELECT k.imie, k.nazwisko, COUNT(w.id_klient) AS ilosc_wypozyczen 
--FROM klient k INNER JOIN wypozyczenie w ON k.id_klient=w.id_klient 
--GROUP BY k.imie, k.nazwisko, k.id_klient
--HAVING COUNT(w.id_klient)>=2 
--ORDER BY nazwisko ASC, imie ASC; 
--21.2
--select s.id_samochod, s.marka, s.typ, count(w.id_samochod) as ilosc_wypozyczen
--from samochod s join wypozyczenie w on s.id_samochod=w.id_samochod
--group by s.id_samochod, s.marka, s.typ
--having count(w.id_samochod) >= 5
--order by s.marka, s.typ asc
--21.3
--select p.imie, p.nazwisko, count(w.id_pracow_wyp) as ilosc_wypozyczen
--from pracownik p left join wypozyczenie w on p.id_pracownik = w.id_pracow_wyp
--group by p.imie, p.nazwisko
--having count(w.id_pracow_wyp) >= 20
--order by ilosc_wypozyczen, p.nazwisko, p.imie asc

--22.1
--SELECT imie, nazwisko, pensja FROM pracownik WHERE pensja=(SELECT MAX(pensja) FROM pracownik)
--22.2
--select imie, nazwisko, pensja from pracownik where pensja>(select avg(pensja) from pracownik)
--22.3
--select marka, typ, data_prod from samochod where data_prod=(select min(data_prod) from samochod);

--23.1
--SELECT marka, typ, data_prod
--FROM samochod
--WHERE id_samochod NOT IN (SELECT DISTINCT id_samochod FROM wypozyczenie);
--23.2
--select imie, nazwisko from klient 
--where id_klient not in(select distinct id_klient from wypozyczenie)
--order by nazwisko, imie asc
--23.3
--select imie, nazwisko from pracownik
--where id_pracownik not in (select distinct id_pracow_wyp from wypozyczenie)

--24.1
--SELECT s.id_samochod, s.marka, s.typ 
--FROM samochod s JOIN wypozyczenie w ON s.id_samochod=w.id_samochod 
--GROUP BY s.id_samochod, s.marka, s.typ 
--HAVING COUNT(w.id_samochod) = 
--( 
 --SELECT TOP 1 COUNT(w.id_samochod) AS ilosc 
 --FROM wypozyczenie w 
 --GROUP BY w.id_samochod 
 --ORDER BY ilosc DESC 
--) 
--ORDER BY s.marka ASC, s.typ ASC;
--24.2 
--SELECT k.id_klient, k.imie, k.nazwisko
--FROM klient k join wypozyczenie w on k.id_klient=w.id_klient
--group by k.id_klient, k.imie, k.nazwisko
--having count(w.id_klient) = 
--( 
	--select min(ilosc_wypozyczen) from
	--(
	--	select count(w.id_klient) as ilosc_wypozyczen
--		from wypozyczenie w
--		--group by w.id_klient
--	) as podzapytanie
--)
--order by k.nazwisko, k.imie
--24.3
--SELECT p.id_pracownik, p.nazwisko, p.imie
--FROM pracownik p
--WHERE p.id_pracownik IN
--(
    --SELECT TOP 1 w.id_pracow_wyp
    --FROM wypozyczenie w
   -- GROUP BY w.id_pracow_wyp
--)
--ORDER BY p.nazwisko, p.imie;

--25.1
--UPDATE pracownik SET pensja=1.1*pensja WHERE pensja < (SELECT AVG(pensja) FROM pracownik);
--25.2
--update pracownik set dodatek = coalesce(dodatek, 0) + 10 where id_pracownik in
--(
--	select id_pracow_wyp
--	from wypozyczenie
--	where month(data_wyp) = 5 and year(data_wyp) = year(getdate()) 
--);
--25.3
--update pracownik set pensja = 0.95*pensja where id_pracownik not in
--(
--	select id_pracow_wyp
--	from wypozyczenie 
--	where year(data_wyp) = 1999
--)

--26.1
/*
delete from klient where id_klient not in
(
	select distinct id_klient
	from wypozyczenie
);
*/
--26.2
/*
delete from samochod where id_samochod not in
(
	select distinct id_samochod from wypozyczenie
); 
*/
--26.3
/*
delete from pracownik where id_pracownik not in 
(
	select distinct id_pracow_wyp
	from wypozyczenie 
);
*/

--27.1
/*
--a)
SELECT imie, nazwisko FROM klient 
UNION 
SELECT imie, nazwisko FROM pracownik 
ORDER BY 2, 1; 
--b)
SELECT imie, nazwisko FROM klient 
UNION ALL 
SELECT imie, nazwisko FROM pracownik 
ORDER BY 2, 1;
*/
--27.2
/*
select imie, nazwisko from pracownik 
intersect
select imie, nazwisko from klient;
*/
--27.3
/*
select imie, nazwisko from klient
except 
select imie, nazwisko from pracownik
order by nazwisko, imie
*/

/*
--28.1
CREATE TABLE pracownik2( 
 id_pracownik INT IDENTITY(1,1) PRIMARY KEY, 
 imie VARCHAR(15) NOT NULL, 
 nazwisko VARCHAR(20) NOT NULL, 
 pesel CHAR(11) UNIQUE, 
 data_zatr DATETIME DEFAULT GETDATE(), 
 pensja MONEY CHECK(pensja>=1000) 
);
--28.2
create table naprawa2(
 id_naprawa int identity (1,1) primary key,
 data_przyjecia datetime check(data_przyjecia <= getdate()),
 opis_usterki varchar(300) not null check(len(opis_usterki) > 10),
 zaliczka money check(zaliczka >=100 and zaliczka <= 1000)
);
--28.3
create table wykonane_naprawy2(
id_pracownik int,
id_naprawa int,
data_naprawy datetime default getdate(),
opis_naprawy varchar(300) not null,
cena money,
foreign key (id_pracownik) references pracownik2(id_pracownik),
foreign key (id_naprawa) references naprawa2(id_naprawa)
);
*/

--29.1
/*
ALTER TABLE student2 ALTER COLUMN nazwisko VARCHAR(20) NOT NULL; 
ALTER TABLE student2 ADD CONSTRAINT unikatowy_nr_indeksu UNIQUE (nr_indeksu); 
ALTER TABLE student2 ADD CONSTRAINT sprawdz_stypendium CHECK (stypendium>=1000); 
ALTER TABLE student2 ADD imie VARCHAR(15) NOT NULL;
*/
--29.2
/*
alter table dostawca2 add constraint unikatowa_nazwa unique (nazwa);
alter table towar2 add nazwa varchar(20) not null;
alter table towar2 add constraint unikatowy_kod_kreskowy unique (kod_kreskowy);
alter table towar2 add constraint fk_id_dostawca foreign key (id_dostawca) references dostawca2(id_dostawca);
*/
--29.3
/*
alter table kraj2 alter column nazwa varchar(30) not null;
alter table gatunek2 alter column nazwa varchar(30) not null;
alter table zwierze2 add constraint fk_id_gatunek foreign key (id_gatunek) references gatunek2(id_gatunek);
alter table zwierz2 add constraint fk_id_kraj foreign key (id_kraj) references kraj2(id_kraj);
*/

--30.1
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='przedmiot2') 
DROP TABLE przedmiot2; 
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='kategoria2') 
DROP TABLE kategoria2; 
--30.2
alter table osoba2 drop column imie2;
--30.3
alter table uczen2
drop column imie2

--31.1
CREATE TABLE wlasciciel2( 
 id_wlasciciel INT IDENTITY(1,1)PRIMARY KEY, 
 imie VARCHAR(15) NOT NULL CHECK(LEN(imie)>2), 
 nazwisko VARCHAR(15) NOT NULL CHECK(LEN(nazwisko)>2), 
 data_ur DATE NOT NULL DEFAULT GETDATE(), 
 ulica VARCHAR(50), 
 numer VARCHAR(8), 
 kod CHAR(6) NOT NULL CHECK(LEN(kod)=6), 
 miejscowosc VARCHAR(30) NOT NULL CHECK(LEN(miejscowosc)>1) 
); 
CREATE TABLE zwierze2( 
 id_zwierze INT IDENTITY(1,1) PRIMARY KEY, 
 id_wlasciciel INT REFERENCES wlasciciel2(id_wlasciciel) ON DELETE SET NULL, 
 rasa VARCHAR(30) NOT NULL CHECK(LEN(rasa)>2), 
 data_ur DATE NOT NULL DEFAULT GETDATE(), 
 imie VARCHAR(15) NOT NULL CHECK(LEN(imie)>2) 
); 
--31.2
alter table film2_gatunek2 
add constraint fk_film2_gatunek2_film foreign key (id_film) references film2(id_film) 
on delete cascade;

alter table film2_garunek2
add constraint fk_film2_gatunek2_gatunek foreign key (id_gatunek) references gatunek2(id_gatunek)
on delete cascade

--31.3
alter table pracownik2
add constraint fk_pracownik2_stanowisko2 foreign key (id_stanowisko) references stanowisko2(id_stanowisko)
on delete set null on update cascade;
--A1. Dla ka�dej miejscowo�ci (tabela adres) oblicz ilu klient�w z niej pochodzi. Uwzgl�dnij wszystkie miejscowo�ci.
--Wynik posortuj malej�co po obliczonej ilo�ci, a w przypadku takiej samej ilo�ci rosn�co po nazwie miejscowo�ci.

--SELECT a.miejscowosc, COUNT(k.id_klient) AS liczba_klientow
--FROM adres a
--JOIN klient k ON a.id_adres = k.id_adres
--GROUP BY a.miejscowosc
--ORDER BY liczba_klientow DESC, a.miejscowosc ASC;


--A2. Znajd� nazwy producent�w (tabela producent), za kt�rych towary klienci zap�acili ponad 50 tys. z�. brutto.
--Wy�wietl tylko posortowane alfabetycznie nazwy producent�w.

--SELECT p.nazwa
--FROM producent p
--JOIN produkt pr ON p.id_producent = pr.id_producent
--JOIN koszyk k ON pr.id_produkt = k.id_produkt
--GROUP BY p.nazwa
--HAVING SUM(k.cena_netto * (1 + k.podatek / 100.0) * k.ilosc_sztuk) > 50000
--ORDER BY p.nazwa;

--A3. Usu� producent�w, kt�rzy nie maj� �adnego produktu.

--DELETE FROM producent
--WHERE id_producent NOT IN (SELECT id_producent FROM produkt);


--A4. Dla ka�dego roku (tabela zam�wienie, kolumna data_zam�wienia), oblicz ile by�o z�o�onych zam�wie�. Wynik posortuj rosn�co wzgl�dem roku. U�yj funkcji YEAR

--SELECT YEAR(data_zamowienia) AS rok, COUNT(*) AS liczba_zamowien
--FROM zamowienie
--GROUP BY YEAR(data_zamowienia)
--ORDER BY rok ASC;

--A5. Stw�rz widok zawieraj�cy zestawienie nazw kategorii i nazw kupionych produkt�w z tych kategorii.
--Wykorzystaj powy�szy widok, aby obliczy� ile razy si� powtarza ka�da krotka w widoku.

--CREATE VIEW ZestawienieKategoriiProduktow AS
--SELECT kat.nazwa AS nazwa_kategorii, pr.nazwa AS nazwa_produktu
--FROM kategoria kat
--JOIN podkategoria pk ON kat.id_kategoria = pk.id_kategoria
--JOIN produkt pr ON pk.id_podkategoria = pr.id_podkategoria;

--widok:

--SELECT nazwa_kategorii, nazwa_produktu, COUNT(*) AS powtorzenia
--FROM ZestawienieKategoriiProduktow
--GROUP BY nazwa_kategorii, nazwa_produktu;

--A1. Dla ka¿dej miejscowoœci (tabela adres) oblicz ilu klientów z niej pochodzi. Uwzglêdnij wszystkie miejscowoœci.
--Wynik posortuj malej¹co po obliczonej iloœci, a w przypadku takiej samej iloœci rosn¹co po nazwie miejscowoœci.

--SELECT a.miejscowosc, COUNT(k.id_klient) AS liczba_klientow
--FROM adres a
--JOIN klient k ON a.id_adres = k.id_adres
--GROUP BY a.miejscowosc
--ORDER BY liczba_klientow DESC, a.miejscowosc ASC;


--A2. ZnajdŸ nazwy producentów (tabela producent), za których towary klienci zap³acili ponad 50 tys. z³. brutto.
--Wyœwietl tylko posortowane alfabetycznie nazwy producentów.

--SELECT p.nazwa
--FROM producent p
--JOIN produkt pr ON p.id_producent = pr.id_producent
--JOIN koszyk k ON pr.id_produkt = k.id_produkt
--GROUP BY p.nazwa
--HAVING SUM(k.cena_netto * (1 + k.podatek / 100.0) * k.ilosc_sztuk) > 50000
--ORDER BY p.nazwa;

--A3. Usuñ producentów, którzy nie maj¹ ¿adnego produktu.

--DELETE FROM producent
--WHERE id_producent NOT IN (SELECT id_producent FROM produkt);


--A4. Dla ka¿dego roku (tabela zamówienie, kolumna data_zamówienia), oblicz ile by³o z³o¿onych zamówieñ. Wynik posortuj rosn¹co wzglêdem roku. U¿yj funkcji YEAR

--SELECT YEAR(data_zamowienia) AS rok, COUNT(*) AS liczba_zamowien
--FROM zamowienie
--GROUP BY YEAR(data_zamowienia)
--ORDER BY rok ASC;

--A5. Stwórz widok zawieraj¹cy zestawienie nazw kategorii i nazw kupionych produktów z tych kategorii.
--Wykorzystaj powy¿szy widok, aby obliczyæ ile razy siê powtarza ka¿da krotka w widoku.

--CREATE VIEW ZestawienieKategoriiProduktow AS
--SELECT kat.nazwa AS nazwa_kategorii, pr.nazwa AS nazwa_produktu
--FROM kategoria kat
--JOIN podkategoria pk ON kat.id_kategoria = pk.id_kategoria
--JOIN produkt pr ON pk.id_podkategoria = pr.id_podkategoria;

--widok:

--SELECT nazwa_kategorii, nazwa_produktu, COUNT(*) AS powtorzenia
--FROM ZestawienieKategoriiProduktow
--GROUP BY nazwa_kategorii, nazwa_produktu;

--D1 [6 pkt]
--Znajd� producent�w (nazwa producenta, identyfikator producenta), dla kt�rych
--nazwa nie zaczyna si� od sp�g�oski.
--Wynik posortuj leksykograficznie po nazwie producenta.
SELECT nazwa, id_producent 
FROM producent
WHERE nazwa LIKE '[aeiouy]%'  -- Zak�adamy, �e 'y' mo�e by� traktowane jako samog�oska
ORDER BY nazwa;


--D2 [6 pkt]
--Dla ka�dego statusu (tabela status kolumna nazwa), wy�wietl informacj�
--ile razy zosta� on przyj�ty (zobacz tabela zamowienie_status).
--Uwzgl�dnij te� te statusy, kt�re ani razu nie zosta�y przyj�te.
--Wynik posortuj malej�co po obliczonej ilo�ci, a dla takiej samej
--ilo�ci posortuj leksykograficznie po nazwie statusu.
--Rozwi�zanie:
SELECT s.nazwa, COUNT(zs.id_status) AS Liczba_Przyjec
FROM status s
LEFT JOIN zamowienie_status zs ON s.id_status = zs.id_status
GROUP BY s.nazwa
ORDER BY Liczba_Przyjec DESC, s.nazwa;


--D3 [8 pkt]
--Znajd� producenta (jednego lub kilku, wystarczy wy�wietli� nazw� producenta),
--kt�ry posiada najwi�ksz� ilo�� produkt�w w tabeli produkt.
--Prosz� nie u�ywa� konstrukcji TOP 1 WITH TIES.
--Rozwi�zanie:
WITH ProducentIlosc AS (
    SELECT id_producent, COUNT(*) AS IloscProduktow
    FROM produkt
    GROUP BY id_producent
)
SELECT p.nazwa
FROM ProducentIlosc pi
JOIN producent p ON pi.id_producent = p.id_producent
WHERE pi.IloscProduktow = (SELECT MAX(IloscProduktow) FROM ProducentIlosc);

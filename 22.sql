--D1 [6 pkt]
--ZnajdŸ producentów (nazwa producenta, identyfikator producenta), dla których
--nazwa nie zaczyna siê od spó³g³oski.
--Wynik posortuj leksykograficznie po nazwie producenta.
SELECT nazwa, id_producent 
FROM producent
WHERE nazwa LIKE '[aeiouy]%'  -- Zak³adamy, ¿e 'y' mo¿e byæ traktowane jako samog³oska
ORDER BY nazwa;


--D2 [6 pkt]
--Dla ka¿dego statusu (tabela status kolumna nazwa), wyœwietl informacjê
--ile razy zosta³ on przyjêty (zobacz tabela zamowienie_status).
--Uwzglêdnij te¿ te statusy, które ani razu nie zosta³y przyjête.
--Wynik posortuj malej¹co po obliczonej iloœci, a dla takiej samej
--iloœci posortuj leksykograficznie po nazwie statusu.
--Rozwi¹zanie:
SELECT s.nazwa, COUNT(zs.id_status) AS Liczba_Przyjec
FROM status s
LEFT JOIN zamowienie_status zs ON s.id_status = zs.id_status
GROUP BY s.nazwa
ORDER BY Liczba_Przyjec DESC, s.nazwa;


--D3 [8 pkt]
--ZnajdŸ producenta (jednego lub kilku, wystarczy wyœwietliæ nazwê producenta),
--który posiada najwiêksz¹ iloœæ produktów w tabeli produkt.
--Proszê nie u¿ywaæ konstrukcji TOP 1 WITH TIES.
--Rozwi¹zanie:
WITH ProducentIlosc AS (
    SELECT id_producent, COUNT(*) AS IloscProduktow
    FROM produkt
    GROUP BY id_producent
)
SELECT p.nazwa
FROM ProducentIlosc pi
JOIN producent p ON pi.id_producent = p.id_producent
WHERE pi.IloscProduktow = (SELECT MAX(IloscProduktow) FROM ProducentIlosc);

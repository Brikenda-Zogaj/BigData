--GRESA
USE mondialDB;
SELECT DISTINCT r.name AS river_name, c.name AS country_name
FROM river r
JOIN geo_river gr ON r.name = gr.river
JOIN country c ON gr.country = c.code
WHERE c.code IN (
    SELECT gr2.country
    FROM geo_river gr2
    JOIN country c2 ON gr2.country = c2.code
    WHERE c2.code NOT IN (
        SELECT country 
        FROM ismember 
        WHERE organization = 'EU'
    )
    AND c2.code IN (
        SELECT country
        FROM geo_sea
    )
    GROUP BY gr2.country
    HAVING COUNT(DISTINCT gr2.river) > 10
)
ORDER BY r.name, c.name;

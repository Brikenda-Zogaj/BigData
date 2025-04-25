USE mondialDB;
CREATE OR REPLACE VIEW canada_capitals_with_rivers AS
SELECT
    ci.name AS capital_city,
    ci.population AS population,
    COUNT(DISTINCT r.name) AS number_of_rivers
FROM
    province prov
JOIN
    city ci ON prov.capital = ci.name
JOIN
    located lr ON ci.name = lr.city
JOIN
    river r ON lr.river = r.name
WHERE
    prov.country = 'CDN'
GROUP BY
    ci.name, ci.population
HAVING
    COUNT(DISTINCT r.name) >= 1
ORDER BY
    ci.name;
SELECT * FROM canada_capitals_with_rivers;


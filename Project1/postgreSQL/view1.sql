CREATE VIEW canada_capitals_with_rivers AS
SELECT
    ci.name AS capital_city,
    ci.population::INTEGER AS population,  -- CAST në INTEGER
    COUNT(DISTINCT r.name)::INTEGER AS number_of_rivers -- CAST në INTEGER
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
    COUNT(DISTINCT r.name) >= 1;

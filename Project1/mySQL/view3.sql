USE mondialDB;

CREATE OR REPLACE VIEW lumi_me_i_gjate_ballkanin_perendimor AS
SELECT 
    r.name AS emri_lumit,
    ROUND(r.length, 2) AS gjatesia_km,
    GROUP_CONCAT(DISTINCT c.name ORDER BY c.name SEPARATOR ', ') AS shtetet,
    IFNULL(GROUP_CONCAT(DISTINCT ci.name ORDER BY ci.name SEPARATOR ', '), 'Nuk ka të dhëna') AS qytetet,
    COUNT(DISTINCT c.name) AS numri_shteteve
FROM 
    river r
JOIN 
    geo_river gr ON r.name = gr.river
JOIN 
    country c ON gr.country = c.code
JOIN 
    encompasses e ON c.code = e.country
LEFT JOIN 
    located l ON r.name = l.river
LEFT JOIN 
    city ci ON l.city = ci.name
WHERE 
    e.continent = 'Europe' 
    AND c.name IN (
        'Albania', 'Bosnia and Herzegovina', 'Croatia', 'Kosovo',
        'North Macedonia', 'Montenegro', 'Serbia', 'Slovenia'
    )
    AND r.length > 50
GROUP BY 
    r.name, r.length
HAVING 
    COUNT(DISTINCT c.name) >= 1
ORDER BY 
    r.length DESC;
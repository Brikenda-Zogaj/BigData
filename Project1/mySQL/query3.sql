USE mondialDB;

SELECT 
    r.Name AS emri_lumit,
    ROUND(r.Length, 2) AS gjatesia_km,
    GROUP_CONCAT(DISTINCT c.name ORDER BY c.name SEPARATOR ', ') AS shtetet,
    IFNULL(GROUP_CONCAT(DISTINCT ci.name ORDER BY ci.name SEPARATOR ', '), 'Nuk ka të dhëna') AS qytetet
FROM 
    river r
JOIN 
    geo_river gr ON r.Name = gr.river
JOIN 
    country c ON gr.country = c.code
JOIN 
    encompasses e ON c.code = e.country
LEFT JOIN 
    located l ON r.Name = l.river
LEFT JOIN 
    city ci ON l.city = ci.name
WHERE 
    e.continent = 'Europe' 
    AND c.name IN (
        'Albania', 'Bosnia and Herzegovina', 'Croatia', 'Kosovo',
        'North Macedonia', 'Montenegro', 'Serbia', 'Slovenia'
    )
    AND r.Length > 50
GROUP BY 
    r.Name, r.Length
HAVING 
    COUNT(DISTINCT c.name) >= 1
ORDER BY 
    r.Length DESC;
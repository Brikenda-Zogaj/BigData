SELECT 
    r.name AS emri_lumit,
    ROUND(r.length::numeric, 2) AS gjatesia_km,
    STRING_AGG(DISTINCT c.name, ', ' ORDER BY c.name) AS shtetet,
    COALESCE(STRING_AGG(DISTINCT ci.name, ', ' ORDER BY ci.name), 'Nuk ka të dhëna') AS qytetet
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
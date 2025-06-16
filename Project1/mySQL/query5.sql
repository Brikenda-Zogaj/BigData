--YLLKA

USE mondialDB;
SELECT 
    r.Name AS River_Name,
    GROUP_CONCAT(DISTINCT c.Name ORDER BY c.Name SEPARATOR ', ') AS EU_Countries,
    GROUP_CONCAT(DISTINCT ci.Name ORDER BY ci.Name SEPARATOR ', ') AS Cities
FROM 
    river r
JOIN 
    geo_river gr ON r.Name = gr.River
JOIN 
    country c ON gr.Country = c.Code
JOIN 
    city ci ON (gr.Country = ci.Country AND gr.Province = ci.Province)
JOIN 
    encompasses e ON c.Code = e.Country
WHERE 
    e.Continent = 'Europe'
    AND EXISTS (
        SELECT 1 FROM isMember 
        WHERE Country = c.Code AND Organization = 'EU'
    )
GROUP BY 
    r.Name
HAVING 
    COUNT(DISTINCT c.Code) > 1
ORDER BY 
    River_Name;

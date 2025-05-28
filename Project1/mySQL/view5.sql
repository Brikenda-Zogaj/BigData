USE mondialDB;

CREATE VIEW Lumenjte_EUr AS
SELECT 
    r.Name AS Emri_Lumit,
    GROUP_CONCAT(DISTINCT c.Name ORDER BY c.Name SEPARATOR ', ') AS Shtetet_EU,
    GROUP_CONCAT(DISTINCT ci.Name ORDER BY ci.Name SEPARATOR ', ') AS Qytetet
FROM 
    river r
JOIN geo_river gr ON r.Name = gr.River
JOIN country c ON gr.Country = c.Code
JOIN city ci ON (gr.Country = ci.Country AND gr.Province = ci.Province)
JOIN isMember im ON c.Code = im.Country
WHERE 
    im.Organization = 'EU'
GROUP BY 
    r.Name
HAVING 
    COUNT(DISTINCT c.Code) > 1
ORDER BY 
    r.Name;
    
    
    
    
SELECT * FROM Lumenjte_EU;
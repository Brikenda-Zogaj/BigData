CREATE VIEW Lumenjte_EU AS
SELECT 
    r.Name AS Emri_Lumit,
    STRING_AGG(DISTINCT c.Name, ', ' ORDER BY c.Name) AS Shtetet_EU,
    STRING_AGG(DISTINCT ci.Name, ', ' ORDER BY ci.Name) AS Qytetet
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


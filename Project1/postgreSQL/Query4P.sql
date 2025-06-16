--HAKI
SELECT DISTINCT s.Name
FROM Sea s

LEFT JOIN islandIn i ON s.Name = i.Sea

JOIN geo_Sea gs ON s.Name = gs.Sea

JOIN isMember m ON gs.Country = m.Country

JOIN Organization o ON m.Organization = o.Abbreviation

WHERE i.Island IS NULL
  AND o.Name IN ('NATO', 'European Union')

GROUP BY s.Name
HAVING COUNT(DISTINCT gs.Country) = COUNT(DISTINCT CASE WHEN o.Name IN ('NATO', 'European Union') THEN gs.Country END);





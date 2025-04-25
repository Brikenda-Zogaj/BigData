SELECT 
    country,
    gdp,
    population,
    calc_gdp_per_capita(gdp::NUMERIC, population) AS gdp_per_capita
FROM 
    countries_data
WHERE 
    gdp IS NOT NULL AND population IS NOT NULL
LIMIT 10;

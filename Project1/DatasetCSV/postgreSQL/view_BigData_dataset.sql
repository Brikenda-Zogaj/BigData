CREATE OR REPLACE VIEW v_country_gdp_comparison AS
SELECT
    cd.country AS csv_country,
    c.name AS mondial_country,
    cd.region,
    cd.population AS csv_population,
    c.population AS mondial_population,
    cd.gdp AS csv_gdp,
    ROUND((cd.gdp * 1000000)::NUMERIC / NULLIF(cd.population, 0), 2) AS gdp_per_capita
FROM 
    countries_data cd
JOIN 
    country c ON TRIM(LOWER(cd.country)) = TRIM(LOWER(c.name))
WHERE 
    cd.gdp IS NOT NULL AND cd.population IS NOT NULL;

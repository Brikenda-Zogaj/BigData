USE BigData_Datasets;

CREATE OR REPLACE VIEW v_country_gdp_comparison AS
SELECT
    `countries of the world`.`Country` AS csv_country,
    c.name AS mondial_country,
    `countries of the world`.`Region` AS region,
    `countries of the world`.`Population` AS csv_population,
    c.population AS mondial_population,
    `countries of the world`.`GDP ($ per capita)` AS csv_gdp,
    ROUND((`countries of the world`.`GDP ($ per capita)` * 1000000) / 
          NULLIF(`countries of the world`.`Population`, 0), 2) AS gdp_per_capita
FROM 
    `countries of the world`
JOIN 
    mondialDB.country c 
    ON TRIM(LOWER(`countries of the world`.`Country`)) = TRIM(LOWER(c.name))
WHERE 
    `countries of the world`.`GDP ($ per capita)` IS NOT NULL 
    AND `countries of the world`.`Population` IS NOT NULL;


-- Test
SELECT * FROM v_country_gdp_comparison
ORDER BY gdp_per_capita DESC
LIMIT 10;


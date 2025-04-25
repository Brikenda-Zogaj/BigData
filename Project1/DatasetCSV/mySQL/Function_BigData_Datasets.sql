USE BigData_Datasets;

DELIMITER //

CREATE FUNCTION calc_gdp_per_capita(
    gdp_million DOUBLE,
    population INT
)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE result DOUBLE;

    IF population = 0 THEN
        SET result = NULL;
    ELSE
        SET result = ROUND((gdp_million * 1000000) / population, 2);
    END IF;

    RETURN result;
END;
//

DELIMITER ;


SELECT 
    Country, 
    `GDP ($ per capita)`, 
    Population,
    calc_gdp_per_capita(`GDP ($ per capita)`, Population) AS gdp_calc
FROM 
    `countries of the world`
WHERE 
    `GDP ($ per capita)` IS NOT NULL AND Population IS NOT NULL
LIMIT 10;









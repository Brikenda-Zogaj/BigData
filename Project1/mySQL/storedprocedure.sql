USE mondialDB;
DELIMITER //

CREATE PROCEDURE sp_get_canada_capitals(
    IN p_min_population INT,
    IN p_max_population INT,
    IN p_min_rivers INT
)
BEGIN
    SELECT 
        capital_city,
        population,
        number_of_rivers
    FROM 
        canada_capitals_with_rivers
    WHERE 
        population BETWEEN p_min_population AND p_max_population
        AND number_of_rivers >= p_min_rivers;
END //

DELIMITER ;
CALL sp_get_canada_capitals(10000, 1000000, 1);

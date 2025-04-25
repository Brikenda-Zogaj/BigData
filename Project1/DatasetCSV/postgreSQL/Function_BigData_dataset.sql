CREATE OR REPLACE FUNCTION calc_gdp_per_capita(
    gdp_million NUMERIC,
    population INT
)
RETURNS NUMERIC AS $$
BEGIN
    IF population = 0 THEN
        RETURN NULL;
    END IF;
    
    RETURN ROUND((gdp_million * 1000000) / population, 2);
END;
$$ LANGUAGE plpgsql;

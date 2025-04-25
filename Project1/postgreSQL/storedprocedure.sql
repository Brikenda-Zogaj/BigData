CREATE OR REPLACE FUNCTION sp_get_canada_capitals(
    p_min_population INTEGER,
    p_max_population INTEGER,
    p_min_rivers INTEGER
)
RETURNS TABLE (
    capital_city VARCHAR,
    population INTEGER,
    number_of_rivers INTEGER
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        v.capital_city,
        v.population,
        v.number_of_rivers
    FROM
        canada_capitals_with_rivers AS v
    WHERE
        v.population BETWEEN p_min_population AND p_max_population
        AND v.number_of_rivers >= p_min_rivers;
END;
$$ LANGUAGE plpgsql;

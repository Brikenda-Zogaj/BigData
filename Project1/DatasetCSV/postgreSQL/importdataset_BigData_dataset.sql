COPY countries_data
FROM 'C:/countries of the world.csv'
WITH (
  FORMAT csv,
  HEADER true,
  DELIMITER ','
);

CREATE TABLE Dim_Country (
  CountryID VARCHAR(4) PRIMARY KEY,
  CountryName VARCHAR(100),
  Population INT
);

CREATE TABLE Dim_Continent (
  ContinentID VARCHAR(20) PRIMARY KEY,
  Area FLOAT(10)
);
CREATE TABLE Dim_Religion (
  ReligionName VARCHAR(100) PRIMARY KEY
);

CREATE TABLE country_continent (
    CountryCode VARCHAR(4),
    Continent VARCHAR(20),
    PRIMARY KEY (CountryCode, Continent)
);
CREATE INDEX idx_country_id ON Dim_Country(CountryID);
CREATE INDEX idx_country_name ON Dim_Country(CountryName);


CREATE INDEX idx_continent_id ON Dim_Continent(ContinentID);

CREATE INDEX idx_religion_name ON Dim_Religion(ReligionName);

CREATE INDEX idx_fr_country ON Facts_Religion(CountryID);
CREATE INDEX idx_fr_continent ON Facts_Religion(ContinentID);
CREATE INDEX idx_fr_religion ON Facts_Religion(ReligionID);
CREATE INDEX idx_fr_percentage ON Facts_Religion(Percentage);
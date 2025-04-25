CREATE TABLE Country
(Name VARCHAR(50) NOT NULL UNIQUE,
 Code VARCHAR(4) CONSTRAINT CountryKey PRIMARY KEY,
 Capital VARCHAR(50),
 Province VARCHAR(50),
 Area DECIMAL CONSTRAINT CountryArea
   CHECK (Area >= 0),
 Population DECIMAL CONSTRAINT CountryPop
   CHECK (Population >= 0));
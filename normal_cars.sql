DROP DATABASE IF EXISTS normal_cars;
DROP USER IF EXISTS normal_user;
CREATE USER normal_user;
CREATE DATABASE normal_cars OWNER normal_user;

\c normal_cars;
\i scripts/denormal_data.sql;

CREATE TABLE makes (
    id SERIAL PRIMARY KEY,
    code VARCHAR (50) NOT NULL,
    title VARCHAR (50) NOT NULL
);

CREATE TABLE models (
    id SERIAL PRIMARY KEY,
    code VARCHAR (50) NOT NULL,
    title VARCHAR (50) NOT NULL
);

CREATE TABLE years (
    id SERIAL PRIMARY KEY,
    years VARCHAR (4) NOT NULL
);

CREATE TABLE cars (
    id SERIAL PRIMARY KEY,
    makesId INTEGER REFERENCES makes(id),
    modelsId INTEGER REFERENCES models(id),
    yearsId INTEGER REFERENCES years(id)
);

INSERT INTO makes (code, title) 
SELECT DISTINCT make_code, make_title 
FROM car_models
ORDER BY make_title ASC;

-- SELECT * FROM makes;
-- SELECT * FROM car_models;

INSERT INTO models (code, title)
SELECT DISTINCT model_code, model_title
FROM car_models
ORDER BY model_title ASC;

-- SELECT * FROM models;

INSERT INTO years (years)
SELECT DISTINCT year 
FROM car_models
ORDER BY year ASC;

-- SELECT * FROM years;

INSERT INTO cars (makesId, modelId, yearsId)
SELECT DISTINCT makesId
FROM cars
ORDER BY makesId ASC;





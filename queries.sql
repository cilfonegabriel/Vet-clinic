/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '12-31-2019';
SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Pikachu' OR name = 'Agumon';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

begin
    SET TRANSACTION READ WRITE;
        UPDATE animals SET species = 'unspecified';
        ROLLBACK;
end;

begin
  UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
  UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
  COMMIT;
end;

begin
  DELETE FROM animals;
  ROLLBACK;
end;

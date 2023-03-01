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


BEGIN
	DELETE FROM animals WHERE date_of_birth > '01-01-2022';
	SAVEPOINT DELETED_AFTER_JAN_2022;
	UPDATE animals SET weight_kg = weight_kg * -1;
	ROLLBACK TO DELETED_AFTER_JAN_2022;
	UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
	COMMIT;
END;


SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species;

SELECT * FROM animals LEFT JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Melody Pond';
SELECT * FROM animals LEFT JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT * FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;
SELECT species.name, COUNT(*) FROM species LEFT JOIN animals ON species.id = animals.species_id GROUP BY species.id;
SELECT animals.* FROM animals LEFT JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Jennifer Orwell' AND animals.species_id = (SELECT id FROM species WHERE species.name LIKE 'Digimon');
SELECT animals.* FROM animals
LEFT JOIN owners ON animals.owner_id = owners.id
WHERE full_name = 'Dean Winchester' AND escape_attempts = 0;
SELECT full_name, COUNT(animals.*) FROM owners LEFT JOIN animals ON owners.id = animals.owner_id  GROUP BY full_name ORDER BY COUNT(animals.*) DESC;


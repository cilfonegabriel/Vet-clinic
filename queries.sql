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

-- Who was the last animal seen by William Tatcher?
SELECT animals.*, visits.visits_date FROM animals LEFT JOIN visits ON animals.id = visits.animal_id LEFT JOIN vets ON visits.vet_id =vets.id WHERE vets.id = (SELECT id FROM vets WHERE vets.name = 'William Tatcher' ORDER BY visit_date DESC;

-- How many different animals did Stephanie Mendez see?
SELECT vets.name, COUNT(animals.*) FROM animals LEFT JOIN visits ON animals.id = visits.animal_id LEFT JOIN vets ON visits.vet_id = vets.id WHERE vets.id = (SELECT id FROM vets WHERE vets.name = 'Stephanie Méndez') GROUP BY vets.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id LEFT JOIN species ON specializzations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.*, visits.visit_date FROM animals LEFT JOIN visits ON animals.id = visits.animal_id LEFT JOIN vets ON visits.vet_id = vets.id WHERE vets.id = (SELECT id FROM vets WHERE vets.name = 'Stephanie Méndez') AND visits.visit_date BETWEEN '01-04-2020' AND '30-08-2020' ORDER BY visit_date DESC;
-- What animal has the most visits to vets?
SELECT animals.name, COUNT (animals.id) FROM animals LEFT JOIN visits ON animals.id = visits.animal_id GROUP BY animals.id ORDER BY COUNT (animals.id) DESC;

-- Who was Maisy Smith's first visit?
SELECT animals.*, visits.visit_date FROM animals LEFT JOIN visits ON animals.id = visits.animal_id LEFT JOIN vets ON visits.vet_id = vets.id WHEREvets.id = (SELECT id FROM vets WHERE vets.name = 'Maisy Smith') ORDER BY visit_date ASC;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.*, vets.*, visits.visit_date FROM animals LEFT JOIN visits ON animals.id = visits.animal_id LEFT JOIN vets ON visits.vet_id = vets.id ORDER BY visit_date DESC;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM visits LEFT JOIN vets ON visits.vet_id = vets.id LEFT JOIN specializations ON specializations.vet_id = vets.id LEFT JOIN specializations ON specializations.vet_id = vets.id WHERE (SELECT species_id FROM animals WHERE animals.id = visits.animal_id) != species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(animals.*) FROM animals LEFT JOIN visits ON animals.id = visits.animal_id LEFT JOIN vets ON visits.vet_id = vets.id LEFT JOIN species ON animals.species_id = species.id WHERE vets.id = (SELECT id ROM vets WHERE vets.name = 'Maisy Smith')GROUP BY species.name ORDER BY COUNT(animals.*) DESC;

/* Populate database with sample data. */

INSERT INTO animals VALUES (DEFAULT, 'Agumon', '02-03-2020', 0, TRUE, 10.23);
INSERT INTO animals VALUES (DEFAULT, 'Gabumon', '11-15-2018', 2, TRUE, 8.0);
INSERT INTO animals VALUES (DEFAULT, 'Pikachu', '01-07-2021', 1, FALSE, 15.04);
INSERT INTO animals VALUES (DEFAULT, 'Devimon', '05-12-2017', 5, TRUE, 11.0);
INSERT INTO animals VALUES (DEFAULT, 'Charmander','02-08-2020', 0, FALSE, -11.0 );
INSERT INTO animals VALUES (DEFAULT, 'Plantmon','09-15-2021', 2, TRUE, -5.7 );
INSERT INTO animals VALUES (DEFAULT, 'Squirtle','04-02-1993', 3, FALSE, -12.13 );
INSERT INTO animals VALUES (DEFAULT, 'Angemon','06-12-2005', 1, TRUE, -45.0 );
INSERT INTO animals VALUES (DEFAULT, 'Boarmon','06-07-2005', 7, TRUE, 20.4 );
INSERT INTO animals VALUES (DEFAULT, 'Blossom','10-13-1998', 3, TRUE, 17.0 );
INSERT INTO animals VALUES (DEFAULT, 'Ditto','05-14-2022', 4, TRUE, 22.0 );

INSERT INTO owner VALUES (DEFAULT, 'Sam Smith', 34);
INSERT INTO owner VALUES (DEFAULT, 'Jenniffer Orwell', 19);
INSERT INTO owner VALUES (DEFAULT, 'Bob', 45);
INSERT INTO owner VALUES (DEFAULT, 'Melody Pond', 77);
INSERT INTO owner VALUES (DEFAULT, 'Dean Winchester', 14);
INSERT INTO owner VALUES (DEFAULT, 'Jodie Whittaker', 38);

INSERT INTO species VALUES (DEFAULT, 'Pokemon');
INSERT INTO species VALUES (DEFAULT, 'Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1 WHERE name LIKE 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name LIKE 'Gabumon';
UPDATE animals SET owner_id = 2 WHERE name LIKE 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name LIKE 'Devimon';
UPDATE animals SET owner_id = 3 WHERE name LIKE 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name LIKE 'Charmander';
UPDATE animals SET owner_id = 4 WHERE name LIKE 'Squirtle';
UPDATE animals SET owner_id = 4 WHERE name LIKE 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name LIKE 'Angemon';
UPDATE animals SET owner_id = 5 WHERE name LIKE 'Boarmon';

INSERT INTO vets VALUES (DEFAULT, 'William Tatcher', 45, '04-23-2000');
INSERT INTO vets VALUES (DEFAULT, 'Maisy Smith', 26, '01-17-2019');
INSERT INTO vets VALUES (DEFAULT, 'Stephanie Mendez', 64, '05-04-1981');
INSERT INTO vets VALUES (DEFAULT, 'Jack Harkness', 38, '06-08-2008');

/* Specialties input */
INSERT INTO specializations (species_id, vet_id) VALUES (2,1), (1,3), (2,3), (1,4);

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (1, 1, '24-05-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (1, 3, '22-07-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (2, 4, '02-02-2021');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (5, 2, '05-01-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (5, 2, '08-03-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (5, 2, '14-05-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (3, 3, '04-05-2021');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (8, 4, '24-02-2021');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (9, 2, '21-12-2019');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (9, 1, '10-05-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (9, 2, '07-04-2021');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (10, 3, '29-09-2019');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (7, 4, '03-10-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (7, 4, '04-11-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (4, 2, '24-01-2019');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (4, 2, '15-05-2019');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (4, 2, '27-02-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (4, 2, '03-05-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (6, 3, '24-05-2020');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES (6, 1, '11-01-2021');

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

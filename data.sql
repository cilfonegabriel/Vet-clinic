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

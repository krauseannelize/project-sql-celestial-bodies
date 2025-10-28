# freeCodeCamp: Celestial Bodies Database
## Step by step

### Log in to PostgreSQL

```bash
psql --username=freecodecamp --dbname=postgres
```

### Create universe database

```sql
CREATE DATABASE universe;
```

### Connect to universa database

```bash
\c universe
```

### Create table: constellation

```sql
CREATE TABLE constellation (
    constellation_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    iau_abbreviation VARCHAR(5) UNIQUE NOT NULL,
    area_square_degrees NUMERIC,
    celestial_hemisphere VARCHAR(10),
    meaning TEXT
);
```

### Create table: galaxy

```sql
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    type VARCHAR(30),
    size VARCHAR(30),
    distance_ly INT,
    diameter_ly INT,
    constellation_id INT NOT NULL REFERENCES constellation(constellation_id)
);
```

### Create table: star

```sql
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    evolutionary_stage VARCHAR(30),
    age_billions_years NUMERIC,
    temperature_kelvin INT,
    part_of_cluster BOOLEAN,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id)
);
```

### Create table: planet

```sql
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    type VARCHAR(30),
    orbital_period_years NUMERIC,
    surface_temperature_celsius INT,
    has_life BOOLEAN,
    has_water BOOLEAN,
    star_id INT NOT NULL REFERENCES star(star_id)
);
```

### Create table: moon

```sql
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    orbital_period_days NUMERIC,
    is_tidally_locked BOOLEAN,
    planet_id INT NOT NULL REFERENCES planet(planet_id)
);
```

### Add data: constellation

```sql
INSERT INTO constellation (
    name, iau_abbreviation, area_square_degrees, celestial_hemisphere, meaning)
    VALUES
    ('Sagittarius', 'Sgr', 867, 'Southern', 'Sagittarius is Latin for "archer" and is commonly represented as a centaur drawing a bow.'),
    ('Andromeda', 'And', 722, 'Northern', 'Andromeda is known as "the Chained Lady" or "the Chained Woman". It is named for Andromeda, daughter of Cassiopeia, in the Greek myth, who was chained to a rock to be eaten by the sea monster Cetus.'),
    ('Ursa Major', 'UMa', 1280, 'Northern', 'Ursa Major is Latin for "Great Bear". It is one of the most recognizable constellations in the northern sky, containing the Big Dipper asterism.'),
    ('Mensa', 'Men', 153, 'Southern', 'Mensa is Latin for "table" or "altar". It was originally named "Mons Mensae" (Table Mountain) by Nicolas Louis de Lacaille, after Table Mountain in South Africa.'),
    ('Tucana', 'Tuc', 295, 'Southern', 'Tucana is named after the toucan, a South American bird.'),
    ('Cassiopeia', 'Cas', 598, 'Northern', 'Cassiopeia is named after the vain queen Cassiopeia in Greek mythology, the wife of Cepheus and mother of Andromeda. It is easily recognized by its distinctive "W" shape.');
```

### Add data: galaxy

```sql
INSERT INTO galaxy (
    name, type, size, distance_ly, diameter_ly, constellation_id)
    VALUES
    ('Milky Way', 'Barred Spiral', 'Intermediate/Typical', 0, 100000, 1),
    ('Ursa Major III', 'Dwarf Irregular', 'Dwarf', 330000, 1000, 3),
    ('Large Magellanic Cloud', 'Dwarf Irregular', 'Dwarf', 158200, 14000, 4),
    ('Small Magellanic Cloud', 'Dwarf Irregular', 'Dwarf', 200000, 7000, 5),('Andromeda', 'Spiral', 'Intermediate/Typical', 2537000, 220000, 2),
    ('Maffei 1', 'Elliptical', 'Giant', 10000000, 80000, 6);
```

### Add data: star

```sql
INSERT INTO star (
    name, evolutionary_stage, age_billions_years, temperature_kelvin, part_of_cluster, galaxy_id)
    VALUES
    ('The Sun', 'G2V', 4.603, 5778, FALSE, 1),
    ('TRAPPIST-1', 'Red Dwarf', 7.6, 2550, TRUE, 1),
    ('Proxima Centauri', 'Red Dwarf', 4.85, 3050, FALSE, 1),
    ('GJ 1214', 'Red Dwarf', 8.0, 3250, FALSE, 1),
    ('Kepler-186', 'Red Dwarf', 4.0, 3800, FALSE, 1),
    ('υ Andromedae', 'F-type', 3.18, 6300, FALSE, 5);
```

### Add data: planet

```sql
INSERT INTO planet (
    name, type, orbital_period_years, surface_temperature_celsius, has_life, has_water, star_id)
    VALUES
    ('Mercury', 'Terrestrial', 0.24, 167, FALSE, FALSE, 1),
    ('Venus', 'Terrestrial', 0.62, 464, FALSE, FALSE, 1),
    ('Earth', 'Terrestrial', 1.00, 15, TRUE, TRUE, 1),
    ('Mars', 'Terrestrial', 1.88, -63, FALSE, TRUE, 1),
    ('Jupiter', 'Gas Giant', 11.86, -145, FALSE, FALSE, 1),
    ('Saturn', 'Gas Giant', 29.46, -178, FALSE, FALSE, 1),
    ('TRAPPIST-1b', 'Terrestrial', 0.0151, 227, FALSE, FALSE, 2),
    ('TRAPPIST-1c', 'Terrestrial', 0.0225, 221, FALSE, TRUE, 2),
    ('Proxima b', 'Terrestrial', 0.03, -39, FALSE, TRUE, 3),
    ('GJ 1214 b', 'Water World', 0.623, 280, FALSE, TRUE, 4),
    ('Kepler-186 f', 'Terrestrial', 0.36, -85, FALSE, TRUE, 5),
    ('upsilon Andromedae b', 'Hot Jupiter', 0.0048, NULL, FALSE, FALSE, 6);
```

### Add data: moons

```sql
INSERT INTO moon (
    name, orbital_period_days, is_tidally_locked, planet_id)
    VALUES
    ('The Moon', 27.3, TRUE, 3),
    ('Phobos', 0.3, TRUE, 4),
    ('Deimos', 1.3, TRUE, 4),
    ('Io', 1.8, TRUE, 5),
    ('Europa', 3.6, TRUE, 5),
    ('Ganymede', 7.2, TRUE, 5),
    ('Callisto', 16.7, TRUE, 5),
    ('Amalthea', 0.5, TRUE, 5),
    ('Titan', 15.9, TRUE, 6),
    ('Enceladus', 1.4, TRUE, 6),
    ('Mimas', 0.9, TRUE, 6),
    ('Tethys', 1.9, TRUE, 6),
    ('Dione', 2.7, TRUE, 6),
    ('Rhea', 4.5, TRUE, 6),
    ('Iapetus', 79.3, TRUE, 6),
    ('Hyperion', 21.3, FALSE, 6),
    ('Thebe', 0.7, TRUE, 5),
    ('Adrastea', 0.3, TRUE, 5),
    ('Metis', 0.4, TRUE, 5),
    ('Elara', 259.6, FALSE, 5);
```

### Exit psql

```bash
\q
```

### Create a backup (dump) of universe database

```bash
pg_dump -cC --inserts -U freecodecamp universe > universe.sql
```

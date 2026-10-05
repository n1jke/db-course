BEGIN;

CREATE TABLE university (
    id INTEGER PRIMARY KEY,
    name VARCHAR(120) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL
);

ALTER TABLE faculty
    ADD COLUMN university_id INTEGER NOT NULL
        REFERENCES university (id);

CREATE TABLE buildings (
    id INTEGER PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    address VARCHAR(255) NOT NULL,
    university_id INTEGER NOT NULL,
    CONSTRAINT fk_buildings_university
        FOREIGN KEY (university_id) REFERENCES university (id)
);

CREATE TABLE audiences (
    id INTEGER PRIMARY KEY,
    number VARCHAR(10) NOT NULL,
    floor INTEGER,
    capacity INTEGER,
    building_id INTEGER NOT NULL,
    CONSTRAINT uq_audiences_building_number UNIQUE (building_id, number),
    CONSTRAINT fk_audiences_building
        FOREIGN KEY (building_id) REFERENCES buildings (id)
);

CREATE TABLE cafeterias (
    id INTEGER PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    building_id INTEGER NOT NULL,
    CONSTRAINT fk_cafeterias_building
        FOREIGN KEY (building_id) REFERENCES buildings (id)
);

CREATE TABLE buffets (
    id INTEGER PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    building_id INTEGER NOT NULL,
    CONSTRAINT fk_buffets_building
        FOREIGN KEY (building_id) REFERENCES buildings (id)
);

COMMIT;

---- create above / drop below ----

BEGIN;

DROP TABLE audiences;
DROP TABLE cafeterias;
DROP TABLE buffets;
DROP TABLE buildings;
ALTER TABLE faculty DROP COLUMN university_id;
DROP TABLE university;

COMMIT;
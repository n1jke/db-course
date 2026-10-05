BEGIN;

CREATE TABLE faculty (
    id INTEGER PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE prepods (
    id INTEGER PRIMARY KEY,
    last_name VARCHAR(120) NOT NULL,
    first_name VARCHAR(120),
    faculty_id INTEGER NOT NULL,
    CONSTRAINT fk_prepods_faculty
        FOREIGN KEY (faculty_id) REFERENCES faculty (id)
);

CREATE TABLE subjects (
    id INTEGER PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    faculty_id INTEGER,
    CONSTRAINT fk_subjects_faculty
        FOREIGN KEY (faculty_id) REFERENCES faculty (id)
);

CREATE TABLE type_study_load (
    id NUMERIC(10, 0) PRIMARY KEY,
    name VARCHAR(120) NOT NULL UNIQUE
);

CREATE TABLE study_load (
    id CHAR(20) PRIMARY KEY,
    hours NUMERIC,
    subject_id INTEGER NOT NULL,
    type_study_id NUMERIC(10, 0) NOT NULL,
    CONSTRAINT chk_study_load_hours CHECK (hours >= 0),
    CONSTRAINT fk_study_load_subject
        FOREIGN KEY (subject_id) REFERENCES subjects (id),
    CONSTRAINT fk_study_load_type
        FOREIGN KEY (type_study_id) REFERENCES type_study_load (id)
);

CREATE TABLE groups (
    id INTEGER PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    head_group INTEGER,
    faculty_id INTEGER NOT NULL,
    CONSTRAINT fk_groups_faculty
        FOREIGN KEY (faculty_id) REFERENCES faculty (id)
);

CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    last_name VARCHAR(60) NOT NULL,
    first_name VARCHAR(30),
    group_id INTEGER,
    CONSTRAINT fk_students_group
        FOREIGN KEY (group_id) REFERENCES groups (id)
);

-- GROUPS and STUDENTS reference each other, so this FK is added after both tables exist.
ALTER TABLE groups
    ADD CONSTRAINT fk_groups_head_student
    FOREIGN KEY (head_group) REFERENCES students (id);

CREATE TABLE lessons (
    group_id INTEGER NOT NULL,
    prepod_id INTEGER NOT NULL,
    study_id CHAR(20) NOT NULL,
    CONSTRAINT pk_lessons PRIMARY KEY (group_id, prepod_id, study_id),
    CONSTRAINT fk_lessons_group
        FOREIGN KEY (group_id) REFERENCES groups (id),
    CONSTRAINT fk_lessons_prepod
        FOREIGN KEY (prepod_id) REFERENCES prepods (id),
    CONSTRAINT fk_lessons_study_load
        FOREIGN KEY (study_id) REFERENCES study_load (id)
);

CREATE TABLE rating (
    id INTEGER PRIMARY KEY,
    date DATE NOT NULL,
    val NUMERIC,
    student_id INTEGER NOT NULL,
    study_id CHAR(20) NOT NULL,
    prepods_id INTEGER NOT NULL,
    is_absent CHAR(1) DEFAULT 'N',
    CONSTRAINT chk_rating_val CHECK (val > 3 AND val <= 10),
    CONSTRAINT fk_rating_student
        FOREIGN KEY (student_id) REFERENCES students (id),
    CONSTRAINT fk_rating_study_load
        FOREIGN KEY (study_id) REFERENCES study_load (id),
    CONSTRAINT fk_rating_prepod
        FOREIGN KEY (prepods_id) REFERENCES prepods (id)
);

COMMIT;

---- create above / drop below ----

BEGIN;

DROP TABLE rating;
DROP TABLE lessons;
DROP TABLE study_load;
DROP TABLE groups;
DROP TABLE students;
DROP TABLE subjects;
DROP TABLE prepods;
DROP TABLE type_study_load;
DROP TABLE faculty;

COMMIT;

BEGIN;

-- 4. Добавить факультеты КСИС и ФИТУ. 
-- 1-м шагом т.к в groupd есть fk на faculty а у него на university.
INSERT INTO university (id, name, address) VALUES
    (1, 'БГУИР', 'Минск, ул. П. Бровки, 6');

INSERT INTO faculty (id, name, university_id) VALUES
    (1, 'КСИС', 1),
    (2, 'ФИТУ', 1);

-- 1. Добавить новую группу с номером 123456.
INSERT INTO groups (id, name, faculty_id) VALUES
    (123456, '123456', 1);

-- 2. Внести в группу 123456 студентов Иванова и Петрова.
INSERT INTO students (id, last_name, first_name, group_id) VALUES
    (1, 'Иванов', 'Иван', 123456),
    (2, 'Петров', 'Петр', 123456);

-- 3. Назначить студента Иванова старостой группы.
UPDATE groups SET head_group = 1 WHERE id = 123456;

-- 5. Добавить преподавателей Васечкина и Петечкина на факультеты КСИС и ФИТУ соответственно.
INSERT INTO prepods (id, last_name, first_name, faculty_id) VALUES
    (1, 'Васечкин', 'Василий', 1),
    (2, 'Петечкин', 'Петр', 2);

-- 6. Назначить Васечкину ведение предмета «Введение в специальность» для группы 123456.
-- Добавить предмет, тип нагрузки и нагрузку.
INSERT INTO subjects (id, name, faculty_id) VALUES
    (1, 'Введение в специальность', 1);

INSERT INTO type_study_load (id, name) VALUES
    (1, 'Лекции');

INSERT INTO study_load (id, hours, subject_id, type_study_id) VALUES
    ('intro_lectures', 26, 1, 1);

INSERT INTO lessons (group_id, prepod_id, study_id) VALUES
    (123456, 1, 'intro_lectures');

-- 7. Поставить Иванову оценку 10, отметить отсутствие Петрова на данном занятии.
INSERT INTO rating (id, date, val, student_id, study_id, prepods_id, is_absent) VALUES
    (1, DATE '2026-10-04', 10, 1, 'intro_lectures', 1, 'N'),
    (2, DATE '2026-10-04', NULL, 2, 'intro_lectures', 1, 'Y');

-- 8. Добавить минимум 4 предмета и минимум 5 студентов с оценками.
INSERT INTO students (id, last_name, first_name, group_id) VALUES
    (3, 'Сидоров', 'Алексей', 123456),
    (4, 'Смирнов', 'Андрей', 123456),
    (5, 'Козлова', 'Анна', 123456);

INSERT INTO subjects (id, name, faculty_id) VALUES
    (2, 'МДиСУБД', 1),
    (3, 'АВС', 1),
    (4, 'СППР', 1),
    (5, 'ОСиСП', 1);

INSERT INTO study_load (id, hours, subject_id, type_study_id) VALUES
    ('db_lectures', 64, 2, 1),
    ('avs_lectures', 32, 3, 1),
    ('sppr_lectures', 32, 4, 1),
    ('osisp_lectures', 64, 5, 1);

INSERT INTO lessons (group_id, prepod_id, study_id) VALUES
    (123456, 1, 'db_lectures'),
    (123456, 1, 'avs_lectures'),
    (123456, 1, 'sppr_lectures'),
    (123456, 1, 'osisp_lectures');

-- По 3 оценки каждому из 5 студентов по каждому из 5 предметов.
INSERT INTO rating (id, date, val, student_id, study_id, prepods_id, is_absent) VALUES
    -- Введение в специальность.
    (3, DATE '2026-10-06', 10, 1, 'intro_lectures', 1, 'N'),
    (4, DATE '2026-10-07', 7, 1, 'intro_lectures', 1, 'N'),
    (5, DATE '2026-10-08', 8, 1, 'intro_lectures', 1, 'N'),
    (6, DATE '2026-10-06', 7, 2, 'intro_lectures', 1, 'N'),
    (7, DATE '2026-10-07', 8, 2, 'intro_lectures', 1, 'N'),
    (8, DATE '2026-10-08', 9, 2, 'intro_lectures', 1, 'N'),
    (9, DATE '2026-10-06', 8, 3, 'intro_lectures', 1, 'N'),
    (10, DATE '2026-10-07', 9, 3, 'intro_lectures', 1, 'N'),
    (11, DATE '2026-10-08', 10, 3, 'intro_lectures', 1, 'N'),
    (12, DATE '2026-10-06', 9, 4, 'intro_lectures', 1, 'N'),
    (13, DATE '2026-10-07', 10, 4, 'intro_lectures', 1, 'N'),
    (14, DATE '2026-10-08', 7, 4, 'intro_lectures', 1, 'N'),
    (15, DATE '2026-10-06', 10, 5, 'intro_lectures', 1, 'N'),
    (16, DATE '2026-10-07', 7, 5, 'intro_lectures', 1, 'N'),
    (17, DATE '2026-10-08', 8, 5, 'intro_lectures', 1, 'N'),

    -- МДиСУБД.
    (18, DATE '2026-10-06', 7, 1, 'db_lectures', 1, 'N'),
    (19, DATE '2026-10-07', 8, 1, 'db_lectures', 1, 'N'),
    (20, DATE '2026-10-08', 9, 1, 'db_lectures', 1, 'N'),
    (21, DATE '2026-10-06', 8, 2, 'db_lectures', 1, 'N'),
    (22, DATE '2026-10-07', 9, 2, 'db_lectures', 1, 'N'),
    (23, DATE '2026-10-08', 10, 2, 'db_lectures', 1, 'N'),
    (24, DATE '2026-10-06', 9, 3, 'db_lectures', 1, 'N'),
    (25, DATE '2026-10-07', 10, 3, 'db_lectures', 1, 'N'),
    (26, DATE '2026-10-08', 7, 3, 'db_lectures', 1, 'N'),
    (27, DATE '2026-10-06', 10, 4, 'db_lectures', 1, 'N'),
    (28, DATE '2026-10-07', 7, 4, 'db_lectures', 1, 'N'),
    (29, DATE '2026-10-08', 8, 4, 'db_lectures', 1, 'N'),
    (30, DATE '2026-10-06', 7, 5, 'db_lectures', 1, 'N'),
    (31, DATE '2026-10-07', 8, 5, 'db_lectures', 1, 'N'),
    (32, DATE '2026-10-08', 9, 5, 'db_lectures', 1, 'N'),

    -- АВС.
    (33, DATE '2026-10-06', 8, 1, 'avs_lectures', 1, 'N'),
    (34, DATE '2026-10-07', 9, 1, 'avs_lectures', 1, 'N'),
    (35, DATE '2026-10-08', 10, 1, 'avs_lectures', 1, 'N'),
    (36, DATE '2026-10-06', 9, 2, 'avs_lectures', 1, 'N'),
    (37, DATE '2026-10-07', 10, 2, 'avs_lectures', 1, 'N'),
    (38, DATE '2026-10-08', 7, 2, 'avs_lectures', 1, 'N'),
    (39, DATE '2026-10-06', 10, 3, 'avs_lectures', 1, 'N'),
    (40, DATE '2026-10-07', 7, 3, 'avs_lectures', 1, 'N'),
    (41, DATE '2026-10-08', 8, 3, 'avs_lectures', 1, 'N'),
    (42, DATE '2026-10-06', 7, 4, 'avs_lectures', 1, 'N'),
    (43, DATE '2026-10-07', 8, 4, 'avs_lectures', 1, 'N'),
    (44, DATE '2026-10-08', 9, 4, 'avs_lectures', 1, 'N'),
    (45, DATE '2026-10-06', 8, 5, 'avs_lectures', 1, 'N'),
    (46, DATE '2026-10-07', 9, 5, 'avs_lectures', 1, 'N'),
    (47, DATE '2026-10-08', 10, 5, 'avs_lectures', 1, 'N'),

    -- СППР.
    (48, DATE '2026-10-06', 9, 1, 'sppr_lectures', 1, 'N'),
    (49, DATE '2026-10-07', 10, 1, 'sppr_lectures', 1, 'N'),
    (50, DATE '2026-10-08', 7, 1, 'sppr_lectures', 1, 'N'),
    (51, DATE '2026-10-06', 10, 2, 'sppr_lectures', 1, 'N'),
    (52, DATE '2026-10-07', 7, 2, 'sppr_lectures', 1, 'N'),
    (53, DATE '2026-10-08', 8, 2, 'sppr_lectures', 1, 'N'),
    (54, DATE '2026-10-06', 7, 3, 'sppr_lectures', 1, 'N'),
    (55, DATE '2026-10-07', 8, 3, 'sppr_lectures', 1, 'N'),
    (56, DATE '2026-10-08', 9, 3, 'sppr_lectures', 1, 'N'),
    (57, DATE '2026-10-06', 8, 4, 'sppr_lectures', 1, 'N'),
    (58, DATE '2026-10-07', 9, 4, 'sppr_lectures', 1, 'N'),
    (59, DATE '2026-10-08', 10, 4, 'sppr_lectures', 1, 'N'),
    (60, DATE '2026-10-06', 9, 5, 'sppr_lectures', 1, 'N'),
    (61, DATE '2026-10-07', 10, 5, 'sppr_lectures', 1, 'N'),
    (62, DATE '2026-10-08', 7, 5, 'sppr_lectures', 1, 'N'),

    -- ОСиСП.
    (63, DATE '2026-10-06', 10, 1, 'osisp_lectures', 1, 'N'),
    (64, DATE '2026-10-07', 7, 1, 'osisp_lectures', 1, 'N'),
    (65, DATE '2026-10-08', 8, 1, 'osisp_lectures', 1, 'N'),
    (66, DATE '2026-10-06', 7, 2, 'osisp_lectures', 1, 'N'),
    (67, DATE '2026-10-07', 8, 2, 'osisp_lectures', 1, 'N'),
    (68, DATE '2026-10-08', 9, 2, 'osisp_lectures', 1, 'N'),
    (69, DATE '2026-10-06', 8, 3, 'osisp_lectures', 1, 'N'),
    (70, DATE '2026-10-07', 9, 3, 'osisp_lectures', 1, 'N'),
    (71, DATE '2026-10-08', 10, 3, 'osisp_lectures', 1, 'N'),
    (72, DATE '2026-10-06', 9, 4, 'osisp_lectures', 1, 'N'),
    (73, DATE '2026-10-07', 10, 4, 'osisp_lectures', 1, 'N'),
    (74, DATE '2026-10-08', 7, 4, 'osisp_lectures', 1, 'N'),
    (75, DATE '2026-10-06', 10, 5, 'osisp_lectures', 1, 'N'),
    (76, DATE '2026-10-07', 7, 5, 'osisp_lectures', 1, 'N'),
    (77, DATE '2026-10-08', 8, 5, 'osisp_lectures', 1, 'N');

COMMIT;

-- 9. Очистить базу.
TRUNCATE TABLE rating, lessons, study_load, groups, students, subjects, prepods,
    type_study_load, faculty, audiences, cafeterias, buffets, buildings, university
    RESTART IDENTITY;

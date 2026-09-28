# Информационная система университета

## Инфологическая модель: сущности, связи и названия полей

| Сущность | Описание |
|---|---|
| `UNIVERSITY` | Высшее учебное заведение |
| `BUILDINGS` | Здания университета |
| `AUDIENCES` | Аудитории в зданиях университета |
| `CAFETERIAS` | Столовые в зданиях университета |
| `BUFFETS` | Буфеты в зданиях университета |
| `FACULTY` | Справочник факультетов |
| `GROUPS` | Справочник учебных групп |
| `STUDENTS` | Справочник студентов |
| `PREPODS` | Справочник преподавателей |
| `SUBJECTS` | Справочник учебных дисциплин |
| `TYPE_STUDY_LOAD` | Справочник типов учебной нагрузки |
| `STUDY_LOAD` | Учебная нагрузка по дисциплине и типу занятий |
| `LESSONS` | Занятия, связывающие группу, преподавателя и учебную нагрузку |
| `RATING` | Оценки студентов |

```mermaid
erDiagram
    UNIVERSITY ||--o{ FACULTY : has
    UNIVERSITY ||--o{ BUILDINGS : owns
    BUILDINGS ||--o{ AUDIENCES : contains
    BUILDINGS ||--o{ CAFETERIAS : contains
    BUILDINGS ||--o{ BUFFETS : contains
    FACULTY ||--o{ GROUPS : includes
    FACULTY ||--o{ PREPODS : employs
    FACULTY o|--o{ SUBJECTS : assigns
    GROUPS ||--o{ LESSONS : has
    PREPODS ||--o{ LESSONS : teaches
    STUDY_LOAD ||--o{ LESSONS : defines
    GROUPS o|--o{ STUDENTS : includes
    STUDENTS o|--o{ GROUPS : heads
    STUDENTS ||--o{ RATING : receives
    PREPODS ||--o{ RATING : gives
    STUDY_LOAD ||--o{ RATING : describes
    SUBJECTS ||--o{ STUDY_LOAD : has
    TYPE_STUDY_LOAD ||--o{ STUDY_LOAD : categorizes

    UNIVERSITY {
        field ID
        field NAME
        field ADDRESS
    }
    BUILDINGS {
        field ID
        field NAME
        field ADDRESS
        field UNIVERSITY_ID
    }
    AUDIENCES {
        field ID
        field NUMBER
        field FLOOR
        field CAPACITY
        field BUILDING_ID
    }
    CAFETERIAS {
        field ID
        field NAME
        field BUILDING_ID
    }
    BUFFETS {
        field ID
        field NAME
        field BUILDING_ID
    }
    FACULTY {
        field ID
        field NAME
        field UNIVERSITY_ID
    }
    GROUPS {
        field ID
        field NAME
        field HEAD_GROUP
        field FACULTY_ID
    }
    STUDENTS {
        field ID
        field LAST_NAME
        field FIRST_NAME
        field GROUP_ID
    }
    PREPODS {
        field ID
        field LAST_NAME
        field FIRST_NAME
        field FACULTY_ID
    }
    SUBJECTS {
        field ID
        field NAME
        field FACULTY_ID
    }
    TYPE_STUDY_LOAD {
        field ID
        field NAME
    }
    STUDY_LOAD {
        field ID
        field hours
        field SUBJECT_ID
        field TYPE_STUDY_ID
    }
    LESSONS {
        field GROUP_ID
        field PREPOD_ID
        field STUDY_ID
    }
    RATING {
        field ID
        field DATE
        field VAL
        field STUDENT_ID
        field STUDY_ID
        field PREPODS_ID
        field IS_ABSENT
    }
```

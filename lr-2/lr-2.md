## схема базы данных для дата-центров

## 1. Инфологическая модель: сущности и связи

На первом уровне отображаются только основные сущности и отношения между ними.

```mermaid
erDiagram
    DATACENTER ||--|{ RACK : contains
    RACK ||--o{ SERVER : hosts
    TEAM ||--o{ SERVER : owns
```

## 2. Инфологическая модель: сущности, связи и названия полей

```mermaid
erDiagram
    DATACENTER ||--|{ RACK : contains
    RACK ||--o{ SERVER : hosts
    TEAM ||--o{ SERVER : owns

    DATACENTER {
        field datacenter_id
        field name
        field location
        field created_at
    }
    RACK {
        field rack_id
        field datacenter_id
        field rack_name
        field unit_count
        field power_cap
        field row
    }
    SERVER {
        field server_id
        field rack_id
        field team_id
        field rack_position
        field hostname
        field serial_number
        field status
        field cpu_cores
        field ram_gb
        field disk_gb
        field os_name
        field installed_at
    }
    TEAM {
        field team_id
        field name
        field department
    }
```

## 3. Даталогическая модель: поля и ключи

```mermaid
erDiagram
    DATACENTER ||--|{ RACK : contains
    RACK ||--o{ SERVER : hosts
    TEAM ||--o{ SERVER : owns

    DATACENTER {
        field datacenter_id PK
        field name
        field location
        field created_at
    }
    RACK {
        field rack_id PK
        field datacenter_id FK
        field rack_name
        field unit_count
        field power_cap
        field row
    }
    SERVER {
        field server_id PK
        field rack_id FK
        field team_id FK
        field rack_position
        field hostname
        field serial_number
        field status
        field cpu_cores
        field ram_gb
        field disk_gb
        field os_name
        field installed_at
    }
    TEAM {
        field team_id PK
        field name
        field department
    }
```

## 4. Даталогическая модель: типы данных и ограничения

```mermaid
erDiagram
    DATACENTER ||--|{ RACK : contains
    RACK ||--o{ SERVER : hosts
    TEAM ||--o{ SERVER : owns

    DATACENTER {
        uuid datacenter_id PK "NOT NULL, UNIQUE"
        text name  "NOT NULL, 1-64 characters"
        text location "NOT NULL, 1-128 characters"
        timestamptz created_at "NOT NULL, <= current time"
    }
    RACK {
        uuid rack_id PK "NOT NULL, UNIQUE"
        uuid datacenter_id FK "NOT NULL"
        text rack_name "NOT NULL, 1-32 characters"
        integer unit_count "NOT NULL, > 0"
        integer power_cap "NOT NULL, > 0"
        text row "NOT NULL, 1-16 characters"
    }
    SERVER {
        uuid server_id PK "NOT NULL, UNIQUE"
        uuid rack_id FK "NOT NULL"
        uuid team_id FK "NOT NULL"
        integer rack_position "NOT NULL, > 0"
        text hostname "NOT NULL, 1-64 characters"
        text serial_number  "NOT NULL, 1-64 characters"
        text status "NOT NULL, ENUM"
        integer cpu_cores "NOT NULL, > 0"
        integer ram_gb "NOT NULL, > 0"
        integer disk_gb "NOT NULL, > 0"
        text os_name "NOT NULL, 1-64 characters"
        timestamptz installed_at "NOT NULL, <= current time"
    }
    TEAM {
        uuid team_id PK "NOT NULL, UNIQUE"
        text name "NOT NULL, 1-64 characters"
        text department "NOT NULL, 1-64 characters"
    }
```

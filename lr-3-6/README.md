# Лабораторные работы №3–6

# Tools
- [PostgreSQL 15](https://www.postgresql.org/)
- [Tern](https://github.com/jackc/tern)
- [Docker](https://www.docker.com/)

## Запуск

```bash
cd lr-3-6
cp .env.example .env
make db-up
```

В `.env` задаются `DOCKER_HUB` — реестр образов без завершающего `/`, `POSTGRES_DB` — имя бд и `POSTGRES_PASSWORD` — пароль. По умолчанию используются образы из `docker.io`.

## Команды

| Команда | Действие |
|---|---|
| `make db-start` | Запустить БД |
| `make db-up` | Запустить БД и применить миграции |
| `make db-migrate` | Применить новые миграции к работающей БД |
| `make db-rollback` | Откатить последнюю миграцию |
| `make db-rollback n=<number of migrations>` | Откатить <number of migrations> последних миграций |
| `make db-new name=<migration name>` | Создать следующий файл миграции |
| `make db-stop` | Остановить БД, сохранив данные |
| `make db-down` | Удалить контейнеры с данными |
| `make db-reset` | Удалить данные и заново применить все миграции |

Миграции лежат в `migrations/` и создаются через `tern`/`make db-new`.

## Подключение

В DBeaver(или аналогичных инструментах) и укажи `localhost:5435`, пользователя `postgres`, имя базы и пароль из `.env`. Таблицы находятся в схеме `public`.

Для SQL консоли можно зайти в контейнер:

```bash
docker compose exec postgres sh -c 'psql -U postgres -d "$POSTGRES_DB"'
docker compose ps
docker compose logs -f postgres
```

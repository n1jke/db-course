COMPOSE := docker compose

.PHONY: db-start db-up db-migrate db-new db-stop db-down db-reset

db-start:
	$(COMPOSE) up -d postgres

db-up:
	$(COMPOSE) up -d postgres
	$(COMPOSE) run --rm migrations

db-migrate:
	$(COMPOSE) run --rm migrations

# make db-new name=<name>
db-new:
	@test -n "$(name)" || (echo "Usage: make db-new name=add_some_table" && exit 1)
	go run github.com/jackc/tern/v2@v2.1.1 new $(name) --migrations migrations

db-stop:
	$(COMPOSE) stop postgres

db-down:
	$(COMPOSE) down -v

db-reset: db-down db-up
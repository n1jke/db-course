COMPOSE := docker compose
n ?= 1

.PHONY: db-start db-up db-migrate db-rollback db-new db-stop db-down db-reset

db-start:
	$(COMPOSE) up -d postgres

db-up:
	$(COMPOSE) up -d postgres
	$(COMPOSE) run --rm migrations

db-migrate:
	$(COMPOSE) run --rm migrations

# make db-rollback n=<number of migrations>
db-rollback:
	@case "$(n)" in ''|*[!0-9]*|0*) echo "Usage: make db-rollback n=<positive integer>"; exit 1;; esac
	$(COMPOSE) run --rm migrations --destination=-$(n)

# make db-new name=<name>
db-new:
	@test -n "$(name)" || (echo "Usage: make db-new name=add_some_table" && exit 1)
	go run github.com/jackc/tern/v2@v2.1.1 new $(name) --migrations migrations

db-stop:
	$(COMPOSE) stop postgres

db-down:
	$(COMPOSE) down -v

db-reset: db-down db-up

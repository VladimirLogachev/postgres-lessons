# postgres-lessons

Exercises from the "PostgreSQL. Основы языка SQL" book

Queries are compatible with one of these example databases:

- https://edu.postgrespro.ru/demo-small-20161013.zip
- https://edu.postgrespro.ru/demo-medium-20161013.zip
- https://edu.postgrespro.ru/demo-big-20161013.zip

Unpack one of them, put to `db` directory, and run:

```sh
docker-compose up

# psql
docker-compose exec db psql -U admin -d demo

code solutions/
stack run

```

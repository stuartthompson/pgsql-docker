# PGSQL Docker

This repository is used to demonstrate how to run PostgreSql in a docker container and use the psql client tools in a separate container.

## Key Commands

The following are the key commands used in this example:

- mkdir ~/dev/data/pgsql-test
- docker run --name pgsql-test -v ~/dev/data/pgsql-test:/var/lib/postgresql/data -e POSTGRES_PASSWORD=test -d postgres
- docker run -it --rm --link pgsql-test:pg --name pg-tools -v /Users/s.thompson/dev/src/github.com/stuartthompson/pgsqlscripttest:/scripts postgres psql -h pg -U postgres

## Example Walkthrough

The following steps walk through the process of creating a data directory, running a PostgreSql compute container, and running psql client tools in a container.

### Create a Data Directory

The following command creates a data directory. This is where PostgreSql will store the data.
mkdir ~/dev/data/pgsql-test

### Run a PostgreSql Compute Container

This command runs PostgreSql in a Docker container:
docker run --name pgsql-test -v ~/dev/data/pgsql-test:/var/lib/postgresql/data -e POSTGRES_PASSWORD=test -d postgres

### Run psql Client Tools in a Container

This command runs the psql client tools in a container and mounts a volume containing database scripts:
docker run -it --rm --link pgsql-test:pg --name pg-tools -v /Users/s.thompson/dev/src/github.com/stuartthompson/pgsqlscripttest:/scripts postgres psql -h pg -U postgres

### Run a script from within the Client Tools Container

The following command should be typed within the psql client tools. It runs the create-schema.sql script.
\i /scripts/create-schema.sql


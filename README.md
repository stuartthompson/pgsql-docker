# PGSQL Docker

This repository is used to demonstrate how to run PostgreSql in a docker container and use the psql client tools in a separate container.

## Key Commands

The following are the key commands used in this example:

- mkdir ~/dev/data/pgsql-docker
- docker run --name pgsql-compute -v ~/dev/data/pgsql-docker:/var/lib/postgresql/data -e POSTGRES_PASSWORD=test -d postgres
- docker run -it --rm --link pg-compute:pg-compute --name pg-tools -v ~/dev/src/github.com/stuartthompson/pgsql-docker:/scripts postgres psql -h pg-compute -U postgres
- \i /scripts/create-schema.sql

## Example Walkthrough

The following steps walk through the process of creating a data directory, running a PostgreSql compute container, and running psql client tools in a container.

### Create a Data Directory

The following command creates a data directory. This is where PostgreSql will store the data.
mkdir ~/dev/data/pgsql-docker

### Run a PostgreSql Compute Container

This command runs PostgreSql in a Docker container:
docker run --name pgsql-compute -v ~/dev/data/pgsql-docker:/var/lib/postgresql/data -e POSTGRES_PASSWORD=test -d postgres

### Run psql Client Tools in a Container

This command runs the psql client tools in a container and mounts a volume containing database scripts:
docker run -it --rm --link pg-compute:pg-compute --name pg-tools -v ~/dev/src/github.com/stuartthompson/pgsql-docker:/scripts postgres psql -h pg-compute -U postgres

### Run a script from within the Client Tools Container

The following command should be typed within the psql client tools. It runs the create-schema.sql script.
\i /scripts/create-schema.sql


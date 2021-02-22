# Postgres install

To make this tutorial playable anywhere (and play with PostgreSQL versions), we'll use
docker.

First, check that `docker` is installed by verifying its version :

`docker --version`{{execute}}

Then locally install PostgreSQL client :

`sudo apt-get -y install postgresql-client`{{execute}}

Next, pull and boot PostgreSQL:

```
sudo docker pull postgres:13.1
sudo docker run --rm --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 postgres:13.1
```{{execute}}

Finally connect and create a demo database:

```
export PGPASSWORD=docker
psql -h localhost -U postgres -d postgres -c "create database demo"
psql -h localhost -U postgres demo
```{{execute}}

We are done, let's put the interesting thing now : deal with the database.
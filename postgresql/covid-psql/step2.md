Next, pull and boot PostgreSQL:

```
sudo docker pull postgres:13.1
sudo docker run --rm --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/covid19-action-plan-nc/data:/tmp postgres:13.1
```{{execute}}

Finally connect and create a demo database:

```
export PGPASSWORD=docker
psql -h localhost -U postgres -d postgres -c "create database covidnc"
```{{execute}}

Then connect :

```
psql -h localhost -U postgres covidnc
```{{execute}}

We are done, let's put the interesting thing now : deal with the database.
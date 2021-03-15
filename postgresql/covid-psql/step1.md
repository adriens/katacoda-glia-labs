To make this tutorial playable anywhere (and play with PostgreSQL versions), we'll use
docker.

First, check that `docker` is installed by verifying its version :

`docker --version`{{execute}}

Then locally install PostgreSQL client :

```
sudo apt-get update
sudo apt-get -y install postgresql-client git
```{{execute}}

Get the target data

```
cd
git clone https://github.com/adriens/covid19-action-plan-nc.git
```{{execute}}
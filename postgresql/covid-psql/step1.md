To make this tutorial playable anywhere (and play with PostgreSQL versions), we'll use
docker.

First, check that `docker` is installed by verifying its version :

`docker --version`{{execute}}

Then locally install PostgreSQL client :

```
sudo apt-get update
sudo apt-get -y install postgresql-client git tree boxes
```{{execute}}

Get the target data

```
git clone https://github.com/adriens/covid19-action-plan-nc.git
clear
tree covid19-action-plan-nc/
cd covid19-action-plan-nc
```{{execute}}

Now, browse the data (`csv`) history :

```
git log --oneline
```{{execute}}

then quit the output :

`q`{{execute}}

Let's say, we only want the history from the *two last weeks* :

```
git log --after="2 week ago"
```{{execute}}

Then quit and go back to home directory :

```
q
cd
clear```{{execute}}
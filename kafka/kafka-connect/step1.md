
Description : Some tools installation.

## Install unzip, cURL and Wget

```
sudo apt-get install -y unzip curl wget
```{{execute T1}}

## Install docker

make this tutorial playable anywhere, we'll use [`docker`](https://www.docker.com/).

Then properly install it:

```
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
```{{execute T1}}

`docker` is finally installed :

`docker --version`{{execute T1}}

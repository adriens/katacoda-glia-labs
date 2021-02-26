
The install processus is very straightforward :

Update our repo :

```
sudo apt-get update
```{{execute}}

Then install the required sofwares :

```
sudo apt-get install -y tree curl virtualbox vagrant
```{{execute}}

Then test Vagrant has been installed by asking its version :

```
vagrant --version
```{{execute}}
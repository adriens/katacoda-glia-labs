Install the required software :

First Python requirements :

```
sudo apt-get install -y python3-pip
```{{execute}}

Then finally the required packages, and of course [termgraph](https://github.com/mkaz/termgraph)

```
sudo pip3 install colorama
sudo pip3 install termgraph
```{{execute}}

Finallny test that termgraph is properly installed :

```
clear
termgraph --version
termgraph --help
```{{execute}}
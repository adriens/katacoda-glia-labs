All we need on our system is:

```
sudo apt-get -y install git jq tree
```{{execute}}

Then, install [JSON Lint](https://www.npmjs.com/package/jsonlint) :

```
npm install jsonlint -g
```{{execute}}


Next get its version :

```
jsonlint --version 
```{{execute}}

and finally its help :

```
jsonlint -h 
```{{execute}}

Also, get some json samples :

```
git clone https://github.com/adriens/json_hall_of_shame 
cd json_hall_of_shame
tree
```{{execute}}

This is it. We are ready to lint json(s).

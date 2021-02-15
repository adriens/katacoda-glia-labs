First add somme utilities :

`sudo apt-get install -y tree`{{execute}}

Next, add Nodesource repo so we can manage [NodeJS](https://nodejs.org/en/) the proper way.

Let's install `Node.js v15.x` :

`curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -`{{execute}}

Once the [NodeSource repository](https://github.com/nodesource/distributions) is enabled,
install Node.js and [npm](https://www.npmjs.com/) by running :

`sudo apt-get install -y nodejs`{{execute}}

Verify that the Node.js :

`node --version`{{execute}}

and npm :

`npm --version`{{execute}}

were successfully installed by printing their versions.
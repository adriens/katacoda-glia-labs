After you run the following two commands, you will have a fully
running virtual machine in [VirtualBox](https://www.virtualbox.org/)
 running [Ubuntu 18.04 LTS 64-bit](https://app.vagrantup.com/hashicorp/boxes/bionic64).

First, create a dedicated demo directory :

```
mkdir quickstart
cd quickstart
pwd
```{{execute}}

Then, initialize Vagrant :

```
vagrant init hashicorp/bionic64
```{{execute}}

Boot the virtual machine (in fact, in our case, download the bow then run it) :

```
vagrant up
```{{execute}}

Login into the virtual machine :

```
vagrant ssh
```{{execute}}

Play with some commands

```
cat /etc/issue
```{{execute}}

Then logout :

`^D`{{execute ctrl-seq}}

Now let's say you are not interested by this virtual machine anymore and want to get
a clean and new machine, like a kind of fresh install.

Therefore, just :

```
vagrant destroy
```{{execute}}


Now imagine every project you've ever worked on being this easy to set up!
With Vagrant, `vagrant up` is all you need to work on any project, to install
every dependency that project needs, and to set up any networking or synced
folders, so you can continue working from the comfort of your own machine.

The rest of this scenario will walk you through setting up a more complete project.

You have just created your first virtual environment with Vagrant.
The first step in configuring any Vagrant project is to create
a [Vagrantfile](https://www.vagrantup.com/docs/vagrantfile/).

The Vagrantfile allows you to:

1. Mark the root directory of your project. Many of the configuration options in Vagrant
are relative to this root directory.
2. Describe the kind of machine and resources you need to run your project, as well
as what software to install and how you want to access it.

Vagrant has a built-in command for initializing a directory, `vagrant init`,
which can take a box name and URL as arguments. Initialize the directory
and specify the `hashicorp/bionic64` box.

```
vagrant init hashicorp/bionic64
```{{execute}}

You now have a `Vagrantfile` in your current directory :

```
ls -ltr
```{{execute}}

Take a look at the Vagrantfile contents :

```
cat Vagrantfile
```{{execute}}

It contains some pre-populated comments and examples.
In following tutorials you will modify this file. 

The Vagrantfile is meant to be committed to version control with your project, if
you use version control. This way, every person working with that project can benefit
from Vagrant without any upfront work.
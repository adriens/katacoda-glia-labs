On the virtual machine, list the files in the vagrant **home directory**.

```
cd
ls -la
```{{execute}}

**Tip: When you `vagrant ssh` into your machine, you're in `/home/vagrant`,
which is a different directory from the synced `/vagrant` directory.
**

Take a loot at `/vagrant` :

```
ls -la /vagrant
```{{execute}}

This is where the magic happens.

Believe it or not, the `Vagrantfile` that you see inside the virtual machine is actually 
the same `Vagrantfile` that is on your actual host machine.

Check it out :

```
cat /vagrant/Vagrantfile
```{{execute}}


Let's test the sync !

Create a file in from within the Virtual Machine :

```
touch /vagrant/It-s_a_kind_of_magic
```{{execute}}

Exit from the virtual machine :

`^D`{{execute ctrl-seq}}

and discover what happened :

```
ls -ltr
```{{execute}}

The file `It-s_a_kind_of_magic` is now on your host machine : **Vagrant kept the folders in sync.**

With [synced folders](https://www.vagrantup.com/docs/synced-folders/), you can continue
to use your own editor on your host machine and have the files sync into the guest machine.
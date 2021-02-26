You have a virtual machine running a basic copy of Ubuntu. You can edit files
locally and have them synced into the virtual machine. In this tutorial you
will serve those files using a webserver.

You could just SSH into the guest machine and install a webserver, but you
would have to repeat this process every time you shut down and brought this
environment back up.

Vagrant can instead automatically install software when
you `vagrant up` so that the guest machine can be repeatably created and ready-to-use.

On our guest server, where the `Vagrantfile` relies, let's prepare a directory where 
where [Apache](https://httpd.apache.org/) will look for your content.

```
mkdir html
```{{execute}}

Next create a file called `index.html` in the new directory, and populate
it with the content for the index page :

```

```{{execute}}

Next, write a write a provisioning script :

We will setup [Apache](http://httpd.apache.org/) using a shell script for this
tutorial. Create the following shell script and save it as `bootstrap.sh` in
the same directory as your `Vagrantfile` :

```

```{{execute}}

This script will :

1. download and start Apache,
2. create a symlink between your synced files directory and the location where Apache
will look for content to serve.

# Configure Vagrant

Next, configure Vagrant to run this shell script when setting up the machine,
by editing the Vagrantfile :

```
cat <<EOF >Vagrantfile
  Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.provision :shell, path: "bootstrap.sh"
end
EOF
```{{execute}}


It which should now look like this :

```
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.provision :shell, path: "bootstrap.sh"
end
```

The `provision` line tells Vagrant to use the `shell` provisioner to
setup the machine, with the `bootstrap.sh` file.

The file path is relative to the location of the project root (where the `Vagrantfile` is).

# Provision the webserver

If your machine were not already up, `vagrant up` would create your machine and Vagrant
would automatically provision it.

But, because the guest machine is already running from a previous step,
you need to `reload` your machine.

Check Vagrant is already up :

```
vagrant status
```{{execute}}

Then reload it so the porvisioning can occur :

```
vagrant reload --provision
```{{execute}}

This will quickly restart your virtual machine, skipping the initial import step.
The provision flag on the reload command instructs Vagrant to run the provisioners,
since usually Vagrant will only do this on the first `vagrant up`.

After Vagrant completes running, the web server will be up and running.

You cannot see the website from your own browser (yet), but you can verify
that the provisioning works by loading a file from within the machine :

SSH into the guest machine :

```
vagrant ssh
```{{execute}}

Then get the HTML file that was created during provisioning :

```
wget -qO- 127.0.0.1
```{{execute}}

This works because in the shell script above you installed Apache and setup the
default DocumentRoot of Apache to point to your `/vagrant` directory, which is the
default synced folder setup by Vagrant.

Continue to the next step where you will forward a port on your guest machine
so that you can access the website that the guest machine is serving.

Therefore, logout :

`^D`{{execute ctrl-seq}}

and go one step further.
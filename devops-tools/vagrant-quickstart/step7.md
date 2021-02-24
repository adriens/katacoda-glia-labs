You now have a web server running with the ability to modify files
from our host and have them automatically synced to the guest.

In this step, you will use *Vagrant's networking features* to provide
access to the guest machine from our host machine.

# Configure port forwarding

Port forwarding allows you to specify ports on the guest machine to share
via a port on the host machine. This allows you to access a port on your own
machine, but actually have all the network traffic forwarded to a specific port
on the guest machine.

Set up a forwarded port so you can access Apache in your guest, 
by adding it to the Vagrantfile under the line you added to run your
bootstrap script.

Below is the full file with port forwarding added :

```
cat <<EOF >Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network :forwarded_port, guest: 80, host: 4567
end
EOF
```

Reload so that these changes can take effect :

```
vagrant reload
```{{execute}}

Access the served files :

Once the machine is running again, take look at the web page served by your box :

```
curl http://127.0.0.1:4567
```{{execute}}

... and finally from your browser, where you will find a web page that is being
served from the guest virtual machine.

http://127.0.0.1:4567

https://[[HOST_SUBDOMAIN]]-[[KATACODA_HOST]]-4567.environments.katacoda.com/

Create a local file :

```
cd ~/demo
touch SURPRISE_DUDE
```{{execute}}

Then open a lftp session on the ftp server, put `SURPRISE_DUDE` file then exit :

```
lftp -d -u rasta,didi -p 21 127.0.0.1:21
put SURPRISE_DUDE
ls
exit
```{{execute}}

👍You've just uploaded the file `SURPRISE_DUDE` to the remote `root` dir of the Ftp server.

👉At this stage you have dealed with interactive shell, now assume you want to do the same operations from script for automation process.

Let's cleanup our demo directory :

```
cd ~/demo
rm -rf *
clear
ls
```{{execute}}
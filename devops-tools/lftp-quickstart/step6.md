Now, let's get a single file from a one-lined script :


Let's mirror the remote `SchemaCrawler` directory into the local `local_backup` for backup purposes for example, and allowing the mirror process to run **4 concurrent threads to boost its performances** :

```
lftp -c "open ftp://rasta:didi@127.0.0.1:21; mirror --parallel=4 SchemaCrawler local_backup"
```{{execute}}

Then take a look at what you got :

```
cd local_backup/
ls
```{{execute}}

Now, let's see if you want a single file.

Cleanup our demo directory :

```
cd ~/demo
rm -rf *
clear
ls
```{{execute}}

Then get a specifi file :

```
lftp -c "open ftp://rasta:didi@127.0.0.1:21; get SURPRISE_DUDE"
```{{execute}}

And here you are.

Now, wouldn'it be cool if you did not had to provide connection parameters and just run even more
lighter `lftp` commands ?

Let's make some cleanup :

```
cd ~/demo
rm -rf *
clear
ls
```{{execute}}

And discover configuration files usage.
Now, let's say we want to maintain a local copy of the remote directory, said the other
way : *we want a local mirror of the remote ftp directory*.



Log back on ftp and get all files in a single shot, then exit :


```
lftp -d -u rasta,didi -p 21 127.0.0.1:21
mirror
exit
```{{execute}}

Finally after a quite long synchronization process (we'll see later how to speedup the process), check what we got locally :

`tree`{{execute}}

:ok_hand: Both dirs have been mirrored.

Now let's say, we moved away one of our local files and wait for a new one from the remote server :

```
cd ~/demo
rm schemacrawler-16.14.1-distribution.zip schemacrawler-16.14.1-distribution.zip.SHA-512
ls -la schemacrawler-16.14.1-distribution* 
```{{execute}}

Now let's see what happens :

```
lftp -d -u rasta,didi -p 21 127.0.0.1:21
mirror
exit
```{{execute}}

And see what we got :

```
ls -la schemacrawler-16.14.1-distribution* 
```{{execute}}

We got all the files back.
```
lftp
bookmark add mykatacoda ftp://rasta:didi@127.0.0.1:21
```{{execute}}

Then list your bookmarks :

```
bookmark list
exit
```{{execute}}

**Please notice that passwords are stored in plain-text and this could represent a security risk if the machine we are working on cannot be trusted.**

Since now, the pasword is locally stored under your `/home` directory :

```
cat  ~/.local/share/lftp/bookmarks | grep mykatacoda
```{{execute}}

Next, just do this to get files :

```
clear
ls
lftp -c "open mykatacoda ; get SURPRISE_DUDE"
ls
```{{execute}}


And so on with all others commands.

To make this from pure code, even bookmark, simply add a bookmark :

```
echo "newbookmark      ftp://rasta:didi@127.0.0.1:21" >> ~/.local/share/lftp/bookmarks
```{{execute}}

And see if you see the bookark from the `lftp` side :

```
lftp
bookmark list
exit
```{{execute}}

Clean up the demo directory :

```
cd ~/demo
rm -rf *
clear
ls
```{{execute}}

Then get the file from the newly created bookmark :

```
lftp -c "open newbookmark ; get SURPRISE_DUDE"
ls
```{{execute}}
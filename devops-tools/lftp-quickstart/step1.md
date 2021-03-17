First install required packages :

```
sudo apt-get install -y git lftp
```{{execute}}

Then prepare the remote ftp server we are going to use during our demo.

Prepare the directories :

```
cd
mkdir ftpfiles
cd ftpfiles
```{{execute}}

Now, put some data in it.

This time we won't use `curl` but `lftp` as it can also deal with http.

Open a `lftp` session : 

`lftp`{{execute}}

then get the files :

```
get https://github.com/schemacrawler/SchemaCrawler/releases/download/v16.14.1/schemacrawler-16.14.1-distribution.zip
get https://github.com/schemacrawler/SchemaCrawler/releases/download/v16.14.1/schemacrawler-16.14.1-distribution.zip.SHA-512
exit
```{{execute}}

You now have the files locally :

`ls -ltr`{{execute}}

And validate checksums :

```
sha512sum schemacrawler-16.14.1-distribution.zip
cat schemacrawler-16.14.1-distribution.zip.SHA-512
```{{execute}}

Now put some more files in the test directory :

```
git clone https://github.com/schemacrawler/SchemaCrawler.git
```{{execute}}

Take a quick glance at how our directory looks like :

`tree -L 2`{{execute}}
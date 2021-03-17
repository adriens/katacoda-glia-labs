Now run a ftp server :

```
sudo docker run -d -v $HOME/ftpfiles/:/home/vsftpd -p 20:20 -p 21:21 -p 47400-47470:47400-47470 -e FTP_USER=rasta -e FTP_PASS=didi -e PASV_ADDRESS=127.0.0.1 --name ftp bogem/ftp
sudo docker ps
```{{execute}}

Check we have nothing locally :

```
cd
mkdir demo
cd demo
clear
ls -la
```{{execute}}


Now connect and see whats on the remote server:

```
lftp -d -u rasta,didi -p 21 127.0.0.1:21
```{{execute}}

And see what we have :

```
ls
cd Schemacrawler
ls
```{{execute}}
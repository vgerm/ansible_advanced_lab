# Build hands-on lab for Automation with Ansible - Advanced training

Trainer: Vladimir Germanov

## 1. Steps to open Ansible playground

### 1.1. Open <a href="https://labs.play-with-docker.com/" target="_blank">PWD playground</a>

### 1.2. Start

### 1.3. Add new instance

## 2. Clone git repo

```bash
$ git clone https://github.com/vgerm/ansible_advanced_lab.git lab
$ cd lab
$ ./lab.sh -h
-h, --help | prints this help message
-d, --destroy | destroy all containers
-a, --ansible | build ansible lab
-e, --empty | build empty lab
-c, --check | check status of the lab
```

## 3. Build EMPTY lab

```bash
$ cd lab
$ ./lab.sh -e
Building lab_empty...
Creating network "lab_empty" with the default driver
Pulling server01 (vgerm/centos7-ssh:latest)...
latest: Pulling from centos7-ssh
c181936b24e2: Pull complete
dab9f87f3be2: Pull complete
f2574f520162: Pull complete
611cdb5201d1: Pull complete
b364f5f5cbdf: Pull complete
3d58f8d7db93: Pull complete
64d6bf8445ce: Pull complete
Digest: sha256:8e5651349550cb2137c55e68424973e6508eb6f9cf0d04ca7e04f20a36ea5fc7
Status: Downloaded newer image for vgerm/centos7-ssh:latest
Pulling server03 (vgerm/deb9-ssh:latest)...
latest: Pulling from deb9-ssh
bc9ab73e5b14: Pull complete
788c9c797c59: Pull complete
d4f8e23e8225: Pull complete
05558ec8437c: Pull complete
06b98ffa233d: Pull complete
eca63fcee21c: Pull complete
Digest: sha256:5bc1ac27a2ee99a29fc3924f1c9f2a0b04b93fe03a058eb26c198b4590e56983
Status: Downloaded newer image for vgerm/deb9-ssh:latest
Pulling ansible (vgerm/centos7-c9:latest)...
latest: Pulling from centos7-c9
c181936b24e2: Already exists
dab9f87f3be2: Already exists
f2574f520162: Already exists
611cdb5201d1: Already exists
b364f5f5cbdf: Already exists
3d58f8d7db93: Already exists
64d6bf8445ce: Already exists
5b44a62f4143: Pull complete
312ed11354c7: Pull complete
b27786936a87: Pull complete
Digest: sha256:d460c58b4e0e48c205369e02b6924a187c418a826c6c75c60146e1c828b7b226
Status: Downloaded newer image for vgerm/centos7-c9:latest
Creating ansible ... done
Creating server01 ... 
Creating ansible ... 
Creating server03 ... 

$ ./lab.sh -c
Status of lab...
  Name           Command          State               Ports             
------------------------------------------------------------------------
ansible    /usr/sbin/init         Up      22/tcp, 0.0.0.0:3000->3000/tcp
server01   /usr/sbin/init         Up      22/tcp, 0.0.0.0:18000->80/tcp 
server02   /usr/sbin/init         Up      22/tcp                        
server03   /lib/systemd/systemd   Up      22/tcp                        
```

## 4. Destroy EMPTY lab

```bash
$ ./lab.sh -d
Destroying empty lab...
Stopping server03 ... done
Stopping ansible  ... done
Stopping server01 ... done
Stopping server02 ... done
Removing server03 ... done
Removing ansible  ... done
Removing server01 ... done
Removing server02 ... done
Removing network lab_empty

$ ./lab.sh -c
Status of lab...
```

## 5. Build ANSIBLE lab

```bash
$ ./lab.sh -a
Building lab_ansible...
Creating network "lab_ansible" with the default driver
Creating server03 ... done
Creating server01 ... 
Creating server03 ... 
Creating server02 ... 

$ ./lab.sh -c
tatus of lab...
  Name           Command          State               Ports             
------------------------------------------------------------------------
ansible    /usr/sbin/init         Up      22/tcp, 0.0.0.0:3000->3000/tcp
server01   /usr/sbin/init         Up      22/tcp, 0.0.0.0:18000->80/tcp 
server02   /usr/sbin/init         Up      22/tcp                        
server03   /lib/systemd/systemd   Up      22/tcp                        
```

## 6. Connect to the exposed port 3000 (from Ansible playground)

### 6.1. Configure Themes

### 6.2. Configure 'Soft tabs'

### 6.3. Configure Font Size

## 7. Download course demos and exercises

### 7.1. New terminal (Alt+T)

```bash
$ get_course_examples.sh
Enter your name (e.g. Vladimir Germanov): Vladimir Germanov
Enter your e-mail (e.g. vladimir@example.com): vladimir@example.com
```

## 8. Destroy ANSIBLE lab

```bash
$ ./lab.sh -d
Destroying ansible lab...
Stopping server03 ... done
Stopping server02 ... done
Stopping ansible  ... done
Stopping server01 ... done
Removing server03 ... done
Removing server02 ... done
Removing ansible  ... done
Removing server01 ... done

$ ./lab.sh -c
Status of lab...
```

# Destroy your lab

## 1. Destroy lab

```bash
$ ./lab.sh -d
Destroying (empty|ansible) lab...
Stopping server01 ... done
Stopping ansible  ... done
Stopping server02 ... done
Stopping server03 ... done
Removing server01 ... done
Removing ansible  ... done
Removing server02 ... done
Removing server03 ... done
Removing network lab_empty

$ ./lab.sh -c
Status of lab...
```

## 2. Remove all docker containers and images

```bash
$ docker rm $(docker ps -a -q) &&>> /dev/null
$ docker rmi $(docker images -a -q) &&>> /dev/null
$ docker image ls
```

## 3. Steps to close Ansible playground

### 3.1. Delete instance

### 3.2. Close session
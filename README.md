Resolución Desafío 13
Automatización de la construcción de DockerFiles con Jenkins y GitHub Actions


Link del repositorio: 
https://github.com/romancete85/eduit.git  branch: Jenkins


link del desafío: 
https://drive.google.com/drive/folders/1lFcm7Ag4LJ2NTq8TQBB9eoq2Rxboh_Lk?usp=sharing

Registry Docker:
https://hub.docker.com/repository/docker/romanfandrich/alien-tetris/tags


Introducción
En este desafío, construiremos un pipeline automatizado para la construcción de DockerFiles utilizando Jenkins y GitHub Actions. El pipeline se encargará de:
Tomar el código de la aplicación desde un repositorio público de GitHub.
Construir una imagen Docker a partir del DockerFile.
Ejecutar un contenedor utilizando la imagen construida.
Publicar la imagen en un repositorio de DockerHub.
Implementar componentes adicionales como hadolint, testing y triggers.
1. Jenkins Pipeline
1.1 Archivo Jenkinsfile
Cree un archivo Jenkinsfile en el repositorio de GitHub de su aplicación. El archivo debe contener el siguiente código:


Diagrama del pipeline




Consola de Jenkins en Localhost



pipeline



Blue Ocean



Docker Hub



Output

Lanzada por el usuario Roman Fandrich administrator

[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins
in C:\ProgramData\Jenkins\.jenkins\workspace\test docker 2
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Clone git)
[Pipeline] git
The recommended git tool is: NONE
No credentials specified
 > git.exe rev-parse --resolve-git-dir C:\ProgramData\Jenkins\.jenkins\workspace\test docker 2\.git # timeout=10
Fetching changes from the remote Git repository
 > git.exe config remote.origin.url https://github.com/romancete85/eduit.git # timeout=10
Fetching upstream changes from https://github.com/romancete85/eduit.git
 > git.exe --version # timeout=10
 > git --version # 'git version 2.42.0.windows.2'
 > git.exe fetch --tags --force --progress -- https://github.com/romancete85/eduit.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git.exe rev-parse "refs/remotes/origin/Jenkins^{commit}" # timeout=10
Checking out Revision 793d9d8937ae3de491977b4104ebb794678c88bb (refs/remotes/origin/Jenkins)
 > git.exe config core.sparsecheckout # timeout=10
 > git.exe checkout -f 793d9d8937ae3de491977b4104ebb794678c88bb # timeout=10
 > git.exe branch -a -v --no-abbrev # timeout=10
 > git.exe branch -D Jenkins # timeout=10
 > git.exe checkout -b Jenkins 793d9d8937ae3de491977b4104ebb794678c88bb # timeout=10
Commit message: "Create dockerfile"
 > git.exe rev-list --no-walk 793d9d8937ae3de491977b4104ebb794678c88bb # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (BUILD Image)
[Pipeline] script
[Pipeline] {
[Pipeline] isUnix
[Pipeline] withEnv
[Pipeline] {
[Pipeline] bat

C:\ProgramData\Jenkins\.jenkins\workspace\test docker 2>docker build -t "romanfandrich/alien-tetris:8" . 
#0 building with "default" instance using docker driver

#1 [internal] load build definition from dockerfile
#1 transferring dockerfile: 586B 0.0s done
#1 DONE 0.0s

#2 [internal] load metadata for docker.io/romanfandrich/alien-tetris:latest
#2 DONE 0.0s

#3 [internal] load .dockerignore
#3 transferring context: 2B done
#3 DONE 0.0s

#4 [1/1] FROM docker.io/romanfandrich/alien-tetris:latest
#4 CACHED

#5 exporting to image
#5 exporting layers done
#5 writing image sha256:cfda9678cc6e909577f9d566a6d71481689d3263f03ff288cf9d7ff2c7197f09 done
#5 naming to docker.io/romanfandrich/alien-tetris:8 0.0s done
#5 DONE 0.0s

What's Next?
  View a summary of image vulnerabilities and recommendations → docker scout quickview
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy image)
[Pipeline] script
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] withDockerRegistry
$ docker login -u romanfandrich -p ******** https://index.docker.io/v1/
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
Login Succeeded
[Pipeline] {
[Pipeline] isUnix
[Pipeline] withEnv
[Pipeline] {
[Pipeline] bat

C:\ProgramData\Jenkins\.jenkins\workspace\test docker 2>docker tag "romanfandrich/alien-tetris:8" "romanfandrich/alien-tetris:8" 
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] isUnix
[Pipeline] withEnv
[Pipeline] {
[Pipeline] bat

C:\ProgramData\Jenkins\.jenkins\workspace\test docker 2>docker push "romanfandrich/alien-tetris:8" 
The push refers to repository [docker.io/romanfandrich/alien-tetris]
6e2015d409d8: Preparing
ce495f7b0b7d: Preparing
9c70f446fbe2: Preparing
5be225e16e44: Preparing
3d04ead9b400: Preparing
af5598fef05f: Preparing
8fbd5a835e5e: Preparing
75061be64847: Preparing
d4fc045c9e3a: Preparing
8fbd5a835e5e: Waiting
af5598fef05f: Waiting
75061be64847: Waiting
d4fc045c9e3a: Waiting
5be225e16e44: Layer already exists
ce495f7b0b7d: Layer already exists
9c70f446fbe2: Layer already exists
3d04ead9b400: Layer already exists
6e2015d409d8: Layer already exists
af5598fef05f: Layer already exists
8fbd5a835e5e: Layer already exists
75061be64847: Layer already exists
d4fc045c9e3a: Layer already exists
8: digest: sha256:74cc824d17bec147a1eeb48b8428387315e856996fafb84bfe884b4a17304a88 size: 2198
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // withDockerRegistry
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Run Container)
[Pipeline] script
[Pipeline] {
[Pipeline] bat

C:\ProgramData\Jenkins\.jenkins\workspace\test docker 2>docker rmi romanfandrich/alien-tetris:8 
Untagged: romanfandrich/alien-tetris:8
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS


Documentación Consultada:

https://muditmathur121.medium.com/integrate-docker-with-jenkins-declarative-pipeline-to-deploy-an-application-7ca1ce7c4780

forums.urbackup.org/t/automate-urbackup-server-docker-builds/10556

github.com/Jhima1/myspringpetclinic


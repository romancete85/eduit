# Docker Tutorial

Este tutorial cubre los comandos básicos y avanzados para trabajar con Docker, desde la gestión de imágenes y contenedores hasta la creación de servidores web y la configuración de Docker Compose.

## Instalación de Docker

Antes de comenzar, asegúrate de tener Docker instalado en tu sistema.

## Comandos Útiles

### Inicializar una Imagen Extraída desde Docker Hub

```sh
docker run -p 8080:80 wordpress
```

### Listar iamgenes

```sh
docker images
```

### Eliminar Imágenes
```sh
docker rmi tag:version

```

### Gestión de Contenedores
### Listar Contenedores
```sh
docker container ls
docker ps
docker container list
```

## Listar Contenedores Activos
```sh
docker ps --all
docker ps -a
```

## niciar un Contenedor
```sh
docker container start <container_id>
```

## Parar un Contenedor
```sh
docker container stop <container_id>
```
## Eliminar un Contenedor
```sh
docker container rm <container_id>
```

## Creación de un Servidor Web
### Crear Servicio a Desplegar
```sh
docker run -d --name my-apache-app -p 8080:80 httpd:2.4
```
## Probar desde el Navegador
### Accede a http://localhost:8080 para ver el servidor en acción.

## Manipular Archivos en el Server (Modo Interactivo)
```sh
docker exec -it my-apache-app bash
```

## Modificar el index.html
```sh
echo "<h1>Curso Edu IT</h1>" > /usr/local/apache2/htdocs/index.html
cat /usr/local/apache2/htdocs/index.html
```
## Crear Imágenes Propias Mediante Dockerfile
### Crear la Estructura de Archivos
### Crea un Dockerfile y los complementos necesarios.

## Crear Imagen
```sh
docker build -t helloeduit .
```
El parámetro -t nos permite etiquetar la imagen y una versión, representada por :v1, :v2.1, etc. El . indica el contexto de build, la raíz desde donde se utilizarán los archivos, generalmente el directorio actual.

## Verificar la Imagen Creada
```sh
docker images ls
```

## Lanzar la Aplicación
```sh
docker run --rm -p 4000:80 helloeduit
```
El parámetro --rm borra automáticamente el contenedor una vez parado.


## Arrancar la Aplicación ALien Tetris
### Accede a http://localhost:80 para ver la aplicación en acción.

# Docker Compose
## Crear la Estructura para Desplegar los Componentes
### Crea un archivo docker-compose.yml y los archivos necesarios para configurar los servicios.

## Iniciar Docker Compose
```sh
docker compose up
```
## Parar Docker Compose
```sh
docker compose stop
```
## Listar Servicios en Docker Compose
```sh
docker compose ps
```
## Eliminar  Docker Compose
```sh
docker compose down
```
## Bibliografía

Para más información, visita la documentación oficial de Docker Compose:
Docker Compose Getting Started


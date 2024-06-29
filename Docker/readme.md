DOCKER
Instalar paquete previamente.

Comandos utiles:

Inicializar una imagen extraida desde docker hub:

docker run -p 8080:80 wordpress 
Listar imagenes:

docker images
Eliminar imagenes:

docker rmi <tag:version>
CONTENEDORES
Listar contenedores:

docker container ls
docker ps
docker container list
Listar contenedores ACTIVOS:

docker ps --all o -a
Iniciar un contenedor:

docker container start <contenedor>
Parar un contenedor:

docker container stop <contenedor>
Eliminar contenedor:

docker container rm <contenedor>
CREACIÓN DE SERVIDOR WEB
Crear servicio a deployar:

docker run -d --name my-apache-app -p 8080:80 httpd:2.4
Probar desde el navegador:

1713382384856.png

Manipular archivos en el server, modo interactivo:

docker exec -it my-apache-app bash
<my-apache-app> es el nombre del contenedor
Modificamos el index.html para verificar si efectivamente se puede realizar cambios en el contenedor:

echo "<h1> Curso Edu IT </h1>" > index.html
cat index.html
1713383904717.png

1713383924860.png

CREAR IMAGENES PROPIAS MEDIANTE DOCKERFILE
Primeramente, crear la esctructura de archivos, dockerfile y complementos.

Crear imagen:

docker build -t helloeduit .
El parámetro -t nos permite etiquetar la imagen y una verión, represntada por dos puntos, :v1, :v2.1 Y el . nos indica el build context, la raiz desde donde va a utilizar los archivos, el directorio actual

Verificamos la imagen creada:

docker imagen ls
1713384573845.png

Lanzamos la app:

docker run --rm -p 4000:80 helloeduit
EL parametro --rm borra automáticamente el contenedor una vez parado.

Arranca la aplicación Flask:

1713384745335.png

Comprobación de la app:

1713384775868.png

DOCKER COMPOSE
Crear estructura para poder deployar los componentes.

Iniciar docker compose:

docker compose up
Parar:

docker compose stop
Listar:

docker compose ps
Eliminar:

docker compose down
BIBLIOGRAFÍA
https://docs.docker.com/compose/gettingstarted/

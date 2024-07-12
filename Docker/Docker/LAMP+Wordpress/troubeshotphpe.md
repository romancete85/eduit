# El problema principal es que el conteneder de php,  lo que está causando el error "Forbidden" en Apache.

## en el directorio /var/www/html,  Aquí la  solucion:

## Paso 1: Crear un Archivo de Índice
Vamos a crear un archivo de índice básico para asegurarnos de que Apache tenga algo que servir.

### Acceder al contenedor web:
```sh
docker exec -it 9df1aa3cb0a1 /bin/bash
```
### Crear un archivo index.php:
```sh
echo "<?php phpinfo(); ?>" > /var/www/html/index.php
```
## Paso 2: Verificar los Permisos
### Asegúrate de que los permisos de los archivos y directorios en /var/www/html sean correctos.

```sh
chmod -R 755 /var/www/html
chown -R www-data:www-data /var/www/html
```
## Paso 3: Configurar Apache (Opcional)
### Aunque la configuración de Apache parece estar correcta, puedes añadir la directiva ServerName para evitar mensajes de advertencia.

### Editar el archivo de configuración principal de Apache:
```sh
echo "ServerName localhost" >> /etc/apache2/apache2.conf
```
### Reiniciar Apache:
```sh
service apache2 restart
```
## Paso 4: Verificar el Estado del Contenedor
### Asegúrate de que el contenedor web está funcionando correctamente y vuelve a comprobar el acceso desde tu navegador.
# Desafío 16 - Seguridad en Linux: Server Hacking con LAMP + WordPress

## Objetivos
1. Implementar autenticación y autorización en un entorno LAMP con WordPress.

## Planificar (Plan)
- **Autenticación:**
  - Política de contraseñas.
  - Configuración de SSH y Google Authenticator.
- **Autorización:**
  - Configuración de sudo.
  - Permisos del sistema de archivos.
  - Configuración de Apache y firewall.

## Hacer (Do)
### Autenticación
1. **Política de Contraseñas:**
   ```sh
   # Configuración en /etc/login.defs
   PASS_MAX_DAYS   90
   PASS_MIN_DAYS   10
   PASS_MIN_LEN    12
   PASS_WARN_AGE   7
 ```

## 2 servicio SSH
```sh
ssh-keygen -t rsa -b 4096
ssh-copy-id user@server
sudo nano /etc/ssh/sshd_config
# Configurar:
PasswordAuthentication no
PermitRootLogin no
sudo systemctl restart sshd
```
## Google Authenicator
```sh
sudo apt-get install libpam-google-authenticator
google-authenticator
sudo nano /etc/pam.d/sshd
# Añadir:
auth required pam_google_authenticator.so
```
## Autorizacion:

### Configuración de sudo:
```sh
sudo visudo
# Añadir:
username ALL=(ALL) ALL
```
### Permisos del Sistema de Archivos:
```sh
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
```

### Configuración de Apache 2 Index:

```sh
sudo nano /etc/apache2/apache2.conf
# Añadir/Modificar:
<Directory /var/www/>
    Options -Indexes
</Directory>
sudo systemctl restart apache2
```
### Configuración del Firewall:
```sh
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
```

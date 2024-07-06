# DESAFÍO 16 - INTRODUCCIÓN A LA SEGURIDAD INFORMÁTICA

## En este desafío trabajaré con WINDOWS SERVER 2019 provisionado con vagrant


### Link del repositorio: 


### Link del desafío: 
https://drive.google.com/drive/folders/1PhsOmqbRU2AVrGPHUPaNoquGCWXUA8Ot?usp=sharing

Configuración Inicial en Vagrant
Instalar Vagrant y VirtualBox:
Descarga e instala Vagrant desde vagrant up.com.
Descarga e instala VirtualBox desde virtualbox.org.
Crear un archivo Vagrantfile:
Crea una carpeta para tu proyecto y dentro de ella, un archivo Vagrantfile con el siguiente contenido:

```ruby

# Vagrantfile
Vagrant.configure("2") do |config|
    # Configuración básica
    config.vm.box = "gusztavvargadr/windows-server" # Reemplaza con la caja que prefieras
 
    # Configuración de red
    config.vm.network "private_network", ip: "10.0.10.201"


    # Configuración de memoria y CPU
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "6048" # Memoria RAM
      vb.cpus = 4        # Número de CPUs
      vb.name = "vagrantWS" #nombre VM
    end
   
    # Configuración de HOSTNAME
    config.vm.hostname = "WSVAGRANT"


    # Configuración de SYNCH FILES
    config.vm.synced_folder "C:/Users/roman/Desktop/DEVOPS/GITHUB/365DEVOPS/Vagrant w/share", "C:/carpeta_compartida"


    # Configuración de acceso RDP con puertos adicionales
    config.vm.network "forwarded_port", guest: 3389, host: 3389, id: "rdp1"
    config.vm.network "forwarded_port", guest: 3389, host: 3390, id: "rdp2"
 
    # Configuración de provisionamiento
    config.vm.provision "shell", inline: <<-SHELL
      # Aquí puedes agregar comandos para la provisión inicial
      Write-Host "Provisioning Windows Server"
      # Ejemplo: Instalar características de Windows
      Install-WindowsFeature -Name Web-Server -IncludeManagementTools
      # Ejemplo: Crear un usuario administrador
      New-LocalUser -Name "admin" -Password "admin" -Description "Administrador de Windows" -ErrorAction Stop
      # Ejemplo: Crear un grupo administrador
      New-LocalGroup -Name "Administradores" -Description "Grupo de administradores" -ErrorAction Stop
      # Ejemplo: Agregar el usuario administrador al grupo administradores
      Add-LocalGroupMember -Group "Administradores" -Member "admin" -ErrorAction Stop
      # Ejemplo: Configurar el firewall para permitir RDP
      Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
      # Ejemplo: iNSTALAR -net FRAMEWORK 3.5
      Install-WindowsFeature -Name NET-Framework-Core -IncludeManagementTools
    SHELL
 
  end
```

### Levantar la VM:
Abre una terminal, navega a la carpeta de tu proyecto y ejecuta:
```bash
vagrant up
```

Una vez levantada la VM, conéctate a ella:
```bash
vagrant rdp
```
## Configuración de User Account Control (UAC)

Configurar UAC para que siempre solicite confirmación:
En server manager, buscamos  la Directiva de seguridad local.
Nos dirigimos a  Configuración de seguridad > Directivas locales > Opciones de seguridad.
En Control de cuentas de usuario: Comportamiento de la solicitud de elevación para administradores en modo de aprobación de administrador y seteamos en: Solicitar credenciales en el escritorio seguro.
	



## Remote Desktop
Habilitar Remote Desktop:
En Inicio y busca Configuración de sistema.
Navegamos a Configuración avanzada del sistema > Pestaña Remoto.
Marcamos la opción Permitir conexiones remotas a este equipo.

### Crear usuario bonustrack:
En computer management, nos dirigimos a Local User and groups, y generamos el nuevo usuario:
	
Asignamos permisos básicos de User
	

Le damos permisos de conexión por RDP
	
### Opción con PowerShell

 Ejecutamos como administrador:

```powershell
New-LocalUser -Name "bonustrack" -Description "Cuenta de bonustrack" -NoPassword
```
Asignar permisos básicos al usuario bonustrack:
En PowerShell:
```powershell
Add-LocalGroupMember -Group "Users" -Member "bonustrack"
```
Conceder privilegios para Remote Desktop al usuario bonustrack:
En PowerShell:
```powershell
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "bonustrack"
```


### Directivas de Seguridad
Habilitar la complejidad de contraseñas:
En Directiva de seguridad local, navegamos a Configuración de seguridad > Directivas de cuenta > Directiva de contraseñas.


## Configurar políticas de contraseñas:
En Directiva de seguridad local, navegamos a Configuración de seguridad > Directivas de cuenta > Directiva de contraseñas y seteamos:
Duración máxima de la contraseña: 0 (para que no expire).
Longitud mínima de la contraseña: 10 caracteres.
Aplicar historial de contraseñas: 10 contraseñas anteriores.
Configuramos La contraseña debe cumplir los requisitos de complejidad en Habilitada.

		
Umbral de bloqueo de cuenta: 7 intentos fallidos.
Duración del bloqueo de cuenta: 10 minutos.
					
## Windows Defender
Habilitar Windows Defender:
Abre Configuración de Windows y navega a Actualización y seguridad > Seguridad de Windows > Protección contra virus y amenazas.

Nos aseguramos de que Windows Defender está habilitado.

### Descargar y analizar raffle.exe:
Descarga el archivo desde el enlace proporcionado y guárdalo en tu máquina virtual.
Realiza un análisis con Windows Defender en el archivo descargado.
	Se renombra con la extensión correcta .EXE y se ejecuta, Windows Firewall lo detecta.
	
### Subir archivo a VirusTotal:
Abre VirusTotal en tu navegador.
Sube el archivo raffle.exe y revisa los resultados del análisis.

## Hashes
### Crear archivo prueba1.txt:
Creamos un archivo de texto llamado prueba1.txt con el contenido "EducaciónIT".
Calcular hashes con HashMyFiles:
Descargamos e instalamos HashMyFiles.
Abrimos HashMyFiles y arrastramos el archivo prueba1.txt para calcular los valores hash (MD5, SHA-1, SHA-256).

MD5: 6425bd24c440f63e476e3aafe5ef4ece
SHA1:3f068336a9858cba38f0ecfae4a0ce7cca6d090c
SHA-256: de80a2e3eb898b423d8739f1c05598af4888f7bd0183e07acf3f665ab9e9efdb

### Creamos archivo prueba2.txt:
Creamos el segundo archivo de texto llamado prueba2.txt con el contenido "EducaciónIT1".
Recalculamos hashes y verificamos cambios:
Usamos HashMyFiles para calcular los valores hash de prueba2.txt y comparamos los resultados con prueba1.txt.

Prueba2.txt.txt	a2d5caf3641ba1b88d8ecf8431a3bb75	744efff9577e4ca8533ac689a26a1eb7658b2327	d1d5f9cd	4efa75fd60d2c1ac96aec23488c29e39b981b237b645330b5458a4cfce0272d8	620235ac8a07f9d41d26c1ac963388cbc71a10ba3d50274d862a464d95f204ed0e509bcf0b2d1cff7638b92c3cb64fd501f02c876d1626e4b21682dbf72873f8	aa9b7038691ac257e53e5c4d8438894cdb829801571b847810f66e4b42a77abc95aeaf4ed7fe1e41c9b034a106895db9	C:\Users\vagrant\Desktop\Prueba2.txt.txt	7/6/2024 3:56:08 PM	7/6/2024 3:55:43 PM	7/6/2024 3:56:08 PM	13				txt	A	

prueba1.txt.txt	6425bd24c440f63e476e3aafe5ef4ece	3f068336a9858cba38f0ecfae4a0ce7cca6d090c	61f44cb3	de80a2e3eb898b423d8739f1c05598af4888f7bd0183e07acf3f665ab9e9efdb	0c0184eb4eb61a3e4f73f6de53aa4cd3f75b0f6ff131d275cbc201fe088522ae73211820aad7e6af1883f2c6f4a17f13bdfb52a86fa309cbe4e20aa5b5a685c1	bcff0c49e41c5032ea6e37f16cdb3209fafa64bfcd7ced14cb2bae043110ed3eace252ecbf45799d3b6ee4f07ffa3a94	C:\Users\vagrant\Desktop\prueba1.txt.txt	7/6/2024 3:48:50 PM	7/6/2024 3:48:28 PM	7/6/2024 3:48:50 PM	12				txt	A	



## Volúmenes de Discos Cifrados
Crear volumen cifrado con VeraCrypt:
Descarga e instala VeraCrypt.
Abre VeraCrypt y crea un nuevo volumen con las siguientes configuraciones:
Tipo de volumen: Volumen de archivo.
Algoritmo de cifrado: AES.
Algoritmo de hash: SHA-512.
Tamaño del volumen: 10 MB.


### Montar y almacenar archivo en el volumen cifrado:
Montamos el volumen creado y guardamos el archivo prueba1.txt dentro del volumen.

### Verificar integridad del archivo:
Desmontamos y volvemos a montar el volumen para asegurarte de que los archivos siguen intactos.

### Almacenamiento de Contraseñas
Usar KeePassXC:
Descargamos e instalamos KeePassXC.
Creamos una nueva base de datos de contraseñas.


### Almacenar credenciales:
Añadimos una entrada con los siguientes datos:
Usuario: Prueba1
Contraseña: AlgoSuperSeguro.7823

### Verificar almacenamiento:
Cerramos KeePass
Abrimomos nuevamente Keppas e ingreamos la contraseña anteriormente generada
para verificar que las credenciales estén presentes.





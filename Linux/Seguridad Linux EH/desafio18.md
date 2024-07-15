
# Desafío 18 - Ethical Hacking

## Objetivo
Realizar pruebas de penetración en http://vulnweb.com para identificar vulnerabilidades.

## Pasos Realizados

## 1. Identificación de Sitios Web Hospedados

  ```sh
  site:vulnweb.com
  ```

### Resultados:
http://testphp.vulnweb.com
http://testasp.vulnweb.com
http://admin.vulnweb.com
http://musicstore.vulnweb.com
http://blog.vulnweb.com

## 2. Información del Dominio Principal

### Comando DIG:
```sh
dig vulnweb.com
```

### Comando WHOIS:

```sh
whois vulnweb.com
```


## 3. Identificación de Direcciones IP
Comandos:
```sh
dig testphp.vulnweb.com
dig testasp.vulnweb.com
dig admin.vulnweb.com
dig musicstore.vulnweb.com
dig blog.vulnweb.com
```

### Resultados:
testphp.vulnweb.com: IP1
testasp.vulnweb.com: IP2
admin.vulnweb.com: IP3
musicstore.vulnweb.com: IP4
blog.vulnweb.com: IP5

## 4. Geolocalización de IPs
Comandos:
```sh
geoiplookup IP1
geoiplookup IP2
geoiplookup IP3
geoiplookup IP4
geoiplookup IP5
```

### Resultados:
IP1: Location1
IP2: Location2
IP3: Location3
IP4: Location4
IP5: Location5

## 5. Información Adicional con NMAP y SHODAN
Comandos NMAP:
```sh
nmap -sV IP1
nmap -sV IP2
nmap -sV IP3
nmap -sV IP4
nmap -sV IP5
```

Comandos SHODAN:
```sh
shodan host IP1
shodan host IP2
shodan host IP3
shodan host IP4
shodan host IP5
```

### Resultados:
Puertos abiertos, servicios y versiones. etc
### ejemplo:

```terminal
❯ nmap -sV 44.228.249.3
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-07-13 15:34 -03
Nmap scan report for ec2-44-228-249-3.us-west-2.compute.amazonaws.com (44.228.249.3)
Host is up (0.19s latency).
Not shown: 999 filtered tcp ports (no-response)
PORT   STATE SERVICE VERSION
80/tcp open  http    nginx 1.19.0

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 34.20 seconds
```

### 


Solucionar problema de dpkg y adm 64 al querer hacer sudo apt upgrade

sudo rm /var/cache/debconf/*.dat
sudo rm /var/lib/dpkg/lock
sudo systemctl restart debconf
sudo mv /usr/sbin/telinit /usr/sbin/telinit.bak
sudo ln -s /usr/bin/true /usr/sbin/telinit
sudo dpkg --configure -a
sudo apt-get update
sudo apt-get upgrade
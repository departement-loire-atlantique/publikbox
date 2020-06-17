# publikbox

## Pré-requis
Installer [vagrant](https://www.vagrantup.com/downloads.html) et [virtualbox](https://www.virtualbox.org/wiki/Downloads)

## Mode opératoire

Cloner le repo et se placer dans le repertoire du repo : 
```
$ git clone https://github.com/departement-loire-atlantique/publikbox.git && cd publikbox
```
Demarrer la machine virtuelle :
```
$ vagrant box add cg44/publikbox publikbox.box
$ vagrant up
```
Les services publik seront automatiquement installés. Ils ont étés installés avec l'utilisateur login:pwd `publik:publik` et sont exposés sur le port 4040 de la machine host. Par example voici l'url pour accéder à combo : https://combo.dev.publik.love:4040

## Quelques commandes utiles

> Si vous êtes sur windows lancer toutes vos commandes dans l'interpreteur `git bash` qui a l'avantage d'embarquer un client ssh. (utile pour la commande `vagrant ssh`)
- `vagrant up` : demarre et construit la VM si celle-ci n'existe pas
- `vagrant halt` : arrête la VM
- `vagrant destroy` : arrête et supprime la VM ainsi que toutes ses ressources
- `vagrant ssh` : connecte à la VM via ssh (le compte de connexion est vagrant:vagrant. Ensuite pour changer de compte il faut passer par la commande `su - publik` et le mot de passe est `publik`)

## Bibliographie

[Guide du développeur d'Entr'Ouvert](https://doc-publik.entrouvert.com/dev/installation-developpeur/)


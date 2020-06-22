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
$ vagrant up
```
Les services publik y seront déjà installés. Ils ont étés installés avec l'utilisateur système login:pwd `publik:publik`.

Quelques informations récupérées depuis la [documentation d'Entr'Ouvert](https://doc-publik.entrouvert.com/dev/installation-developpeur/):

> Publik est accessible à cette adresse : https://combo.dev.publik.love/.
> 
> ```
> Utilisateur : admin@localhost
> Mot de passe : admin
> ```` 
> Après votre première authentification, si vous ne voyez pas d'entrée "Fabrique de formulaires" et/ou "Fabrique de workflows" dans le menu, une visite sur la page suivante devrait résoudre le problème : https://wcs.dev.publik.love/login .
> 
> Sur les pages "Fabrique de formulaires" vous sera indiqué la nécessité de "définir des rôles", rendez vous sur https://authentic.dev.publik.love/manage/roles/ pour créer un rôle.


## Quelques commandes utiles

> Si vous êtes sur windows lancez toutes vos commandes dans l'interpreteur `git bash` qui a l'avantage d'embarquer un client ssh. (utile pour la commande `vagrant ssh`)
- `vagrant up` : demarre et construit la VM si celle-ci n'existe pas
- `vagrant halt` : arrête la VM
- `vagrant destroy` : arrête et supprime la VM ainsi que toutes ses ressources
- `vagrant ssh` : connecte à la VM via ssh (le compte de connexion est vagrant:vagrant. Ensuite pour changer de compte il faut passer par la commande `su - publik` et le mot de passe est `publik`)

## Bibliographie

[Guide du développeur d'Entr'Ouvert](https://doc-publik.entrouvert.com/dev/installation-developpeur/)


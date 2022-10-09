# Simple projet en Symfony 6 - 2e partie

<hr>

Première partie : [La création de l'application](./Simplecrud.md)
Seconde partie : **L'hébergement**
Troisième partie : CI/CD (bientôt)

[La démo de l'application](http://164.92.137.13/) - [Le dépot de la démo](https://gitlab.com/lozit/simplecrud)
<hr>

## Hébergement

Avant de commencer, il est important de comprendre une chose. Ce que nous voyons ici est grandement simplifié. La configuration et la maintenance d'un serveur est un metier à part entière et il devrait être confié à un spécialiste dans une optique de production.

Par contre, pour mettre en ligne une démo d'une application, il n'y a pas de soucis.

### Création d'un VPS (a venir)

=> _On crée une clée SSH_
=> _On crée une Droplet sur DigitalOcean_

### Installation de base

On se connecte sur la droplet en SSH.
Utilisez sudo si vous n'êtes pas root :

```BASH
# On mets à jour le système
apt update && apt upgrade -y 

# On installe le serveur web
apt-get install -y nginx

# On installe les utilitaires necessaires
apt-get install -y zip git libzip-dev
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2   
locale-gen en_US.UTF-8

# On rajoute un repository qui va permettre d'installer la dernière version de PHP
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list
wget -qO - https://packages.sury.org/php/apt.gpg | gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/debian-php-8.gpg --import
chmod 644 /etc/apt/trusted.gpg.d/debian-php-8.gpg

# Après un ajout de repository, on refait une update
apt update && apt upgrade -y

# On installe PHP
apt-get install -y php8.1

# On installe les extensions dont on a besoin
apt-get install -y php8.1-fpm 
apt-get install -y php8.1-SimpleXML
apt-get install -y php8.1-mbstring
apt-get install -y php8.1-intl
apt-get install -y php8.1-pgsql

# On installe composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

# On installe la CLI Symfony
curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
apt-get install -y symfony-cli

# On configure GIT
git config --global user.email "you@example.com"
git config --global user.name "Votre Nom"

# On install PostgreSQL
apt-get install -y postgresql postgresql-contrib

```

On test en tapant l'adresse du droplet dans un navigateur, on doit avoir quelque chose.

Pour installer un site Symfony sur le serveur :

```BASH

# On crée un projet Symfony 
cd /var/www/html

# On crée un projet comme dsur notre propre machine
symfony new monprojettest --webapp

```

Il faudra ensuite configurer le serveur web. Nous utilisons Nginx.

Nginx possède deux dossiers :

- `/etc/nginx/sites-availlable/` qui correspond aux sites disponibles
- `/etc/nginx/sites-enabled/` qui correspond aux sites activés

Sites disponibles : la configuration est là, mais le site n'est pas en ligne
Sites activés : sites en ligne

Dans le premier dossier, on va créer un fichier par site que l'on veut rendre disponible.
Dans le second, on va créer des lien symboliques (avec `ln -s`) vers les sites que l'on veut mettre en ligne.

Il existe une configuration officielle pour configurer un site Symfony sur Nginx : [https://symfony.com/doc/current/setup/web_server_configuration.html#nginx](https://symfony.com/doc/current/setup/web_server_configuration.html#nginx)

Nous allons donc créer un fichier dans le dossier `sites-availlable` : `nano /etc/nginx/sites-availlable/monprojettest` dans lequel vous allez collez la [configuration officielle](https://symfony.com/doc/current/setup/web_server_configuration.html#nginx).

Nous allons changer trois choses :

- le chemin vers le dossier de notre site : attribut `root` dans le fichier config, dans lequel nous allons mettre `root /var/www/html/monprojettest/public`
Dans Symfony, c'est bien le projet public qu'il faut pointer
- Nous allons commenter la ligne `server_name` car nous n'avons pas encore de nom de domaine configuré.
- Nous allons mettre le bon chemin vers PHP : attribut `fastcgi_pass` dont nous allons changer la version de 7.4 à 8.1.

Celà nous donne un fichier `/etc/nginx/sites-availlable/monprojettest` comme ceci :

```BASH

server {
    # server_name domain.tld www.domain.tld;
    root /var/www/html/monprojettest/public;

    location / {
        # try to serve file directly, fallback to index.php
        try_files $uri /index.php$is_args$args;
    }

    # optionally disable falling back to PHP script for the asset directories;
    # nginx will return a 404 error when files are not found instead of passing the
    # request to Symfony (improves performance but Symfony's 404 page is not displayed)
    # location /bundles {
    #     try_files $uri =404;
    # }

    location ~ ^/index\.php(/|$) {
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi_params;

        # optionally set the value of the environment variables used in the application
        # fastcgi_param APP_ENV prod;
        # fastcgi_param APP_SECRET <app-secret-id>;
        # fastcgi_param DATABASE_URL "mysql://db_user:db_pass@host:3306/db_name";

        # When you are using symlinks to link the document root to the
        # current version of your application, you should pass the real
        # application path instead of the path to the symlink to PHP
        # FPM.
        # Otherwise, PHP's OPcache may not properly detect changes to
        # your PHP files (see https://github.com/zendtech/ZendOptimizerPlus/issues/126
        # for more information).
        # Caveat: When PHP-FPM is hosted on a different machine from nginx
        #         $realpath_root may not resolve as you expect! In this case try using
        #         $document_root instead.
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        fastcgi_param DOCUMENT_ROOT $realpath_root;
        # Prevents URIs that include the front controller. This will 404:
        # http://domain.tld/index.php/some-path
        # Remove the internal directive to allow URIs like this
        internal;
    }

    # return 404 for all other php files not matching the front controller
    # this prevents access to other php files you don't want to be accessible.
    location ~ \.php$ {
        return 404;
    }

    error_log /var/log/nginx/project_error.log;
    access_log /var/log/nginx/project_access.log;
}

```

Ensuite, nous supprimons le lien symbolique dans `site-enabled`et nous en créons un vers notre fichier `monprojettest`

```BASH

cd /etc/nginx/sites-enabled/
rm default
ln -s /etc/nginx/sites-available/monprojettest
```

Il ne nous reste plus qu'a redémarrer nginx : `/etc/init.d/nginx restart` et d'accéder à notre site en tapant l'adresse IP de la droplet dans un navigateur.

### Quelques commandes de base

- Démarrer le serveur web Nginx : `/etc/init.d/nginx start` ou `systemctl start nginx`
- Stopper le serveur web Nginx : `/etc/init.d/nginx stop` ou `systemctl stop nginx`
- Redémarrer le serveur web Nginx : `/etc/init.d/nginx restart` ou `systemctl restart nginx`
- Savoir si Nginx tourne ou pas : `systemctl status nginx`
- Démarrer la base de données PostgreSQL : `pg_ctlcluster 13 main start` ou `systemctl start postgresql`
- Stopper la base de données PostgreSQL : `pg_ctlcluster 13 main stop` ou `systemctl stop postgresql`
- Redémarrer la base de données PostgreSQL : `pg_ctlcluster 13 main restart` ou `systemctl restart postgresql`
- Savoir si PostgreSQL tourne ou pas : `systemctl status postgresql`

### On vérifies les différentes installations en affichant les versions

- Nginx : `nginx -v`
- PostgreSQL : `sudo -u postgres psql -c "SELECT version();"`
- PHP : `php -v`
- Symfony : `symfony -V`
- Composer : `composer -V`

### Créer un utilisateur et une base de données pour PostgreSQL

- On crée l'utilisateur : `sudo su - postgres -c "createuser monuser"`
- On crée la base : `sudo su - postgres -c "createdb mabase"`
- On se connecte à PostgreSQL pour la suite : `sudo -u postgres psql`
- On donne les droits sur la base à l'utilisateur : `GRANT ALL PRIVILEGES ON DATABASE mabase TO monuser;`
- On définie le mot de passe pour l'utilisateur : `alter user monuser password 'monpassword';`
- Pour quitter psql : `\q`

### Autoriser l'accès à la base de données à l'extérieur du serveur

Par défaut, seules les applications tournant sur le même serveur que la base de données peuvent y accéder.
C'est une bonne pratique, permettant de limiter les potentiels piratages.
Pour des raisons pédagogiques, on peut vouloir désactiver la fonction pour pouvoir se connecter à la base de données avec [Dbeaver](https://dbeaver.io) par exemple.

Pour autoriser l'accès, il faut donc ajouter `listen_addresses = '*'` dans le fichier de configuration de PostgreSQL `/etc/postgresql/13/main/postgresql.conf` dans la section `CONNECTIONS AND AUTHENTICATION`

Puis on édite le fichier `/etc/postgresql/13/main/pg_hba.conf` et on rajoute la ligne suivante à la fin du fichier :

```BASH
host  all monuser 0.0.0.0/0 md5
```

On redémarre PostgreSQL et on peut se connecter à la base avec un logiciel comme DBeaver.

### Installer votre application Symfony

#### Créer une clef SSH

Nous avons plusieurs moyens de nous connecter à GIT. Le plus simple à l'utilisation est d'utiliser une clef SSH.

Le principe, vous allez créer deux fichiers : l'un est votre clé privée, qui vous permet de vous identifier.
L'autre est une clé publique, qui permet de vérifier que votre clé privée est valide.

Le principe est qu'on peut vérifier la clé privée à partir de la clé publique, mais qu'à partir de la clé publique on ne peut pas générer une clé privée.

C'est donc un fichier (la clef privée) qui vous sert de login et mot de passe. On comprend donc aussi que ce n'est pas un fichier à donner à tout le monde.

Nous allons donc utiliser une clef privée pour se connecter à Gitlab. Pour que ça marche, on devra donner notre clé publique à Gitlab (pour qu'il puisse vérifier notre clef privée).

Sur votre ordinateur :

```bash
ssh-keygen -t ed25519 -C "nom de votre projet"
```

À la question `Enter file in which to save the key` vous mettez un nom lié à votre projet.
Exemple dans mon cas : `/Users/guillaumeferrari/.ssh/monprojet`
Ne mettez pas de passphrase (laissez vide deux fois).

Vous allez avoir deux nouveaux fichiers :

- la clef privée ici : `/Users/guillaumeferrari/.ssh/monprojet`
- la clef publique ici : `/Users/guillaumeferrari/.ssh/monprojet.pub`

##### Mettre la clé sur gitlab

- Récupérez le contenu de votre clef publique : `cat /Users/guillaumeferrari/.ssh/monprojet.pub` et copier la clef
- Allez sur la page : <https://gitlab.com/-/profile/keys> et coller dans le champs `key`

#### Mettre la clé sur votre serveur

- Récupérez le contenu de votre clef privée : `cat /Users/guillaumeferrari/.ssh/monprojet.pub` et copier la clef
- Créez un fichier sur votre serveur : `nano ~/.ssh/monprojet` et collez le contenu de votre clef privée.
- Créer un fichier : `nano ~/.ssh/config` dans lequel on va dire que pour se connecter a gitlab.com on doit utiliser la clef privée `monprojet`

```bash
Host gitlab.com
  HostName gitlab.com
  IdentityFile ~/.ssh/monprojet
  User git
```

#### Git clone

Maintenant que tout est prêt, on va pouvoir installer notre application Symfony. Nous allons utiliser GIT pour récupérer les sources. Bien entendu, remplacez dans les commandes suivantes l'adresse du dépot par le votre.

```BASH
# On se place dans le dossier /var/www
# Vous pouvez choisir d'installer votre site à cet endroit, ou bien créer un sous-répertoire
cd /var/www
git clone git@gitlab.com:lozit/simplecrud.git
cd simplecrud 
```

On crée un fichier env.local `nano env.local` dans lequel on mets la connection avec la base de données et dans lequel on dit qu'on est sur une version de production :

```BASH
APP_ENV=prod
DATABASE_URL="postgresql://monuser:monpassword@localhost:5432/mabase"
```

Et ensuite on installe l'application norlmalement

```BASH
composer install
symfony console d:m:m
```

#### On configure Nginx

Enfin, on fait pointer notre serveur vers le nouveau répertoire de notre application : `/var/www/simplecrud/public`

en ditant le fichier de Nginx : `nano /etc/nginx/sites-enabled/monprojettest` et en changeant `root /var/www/html/monprojettest/public;` par `root /var/www/simplecrud/public;`

Et après un `systemctl restart nginx` on doit voir notre site en allant sur l'adresse ip du serveur.
Dans mon cas : [http://164.92.137.13/](http://164.92.137.13/)

<hr>

Première partie : [La création de l'application](./Simplecrud.md)
La suite :  CI/CD (A venir)

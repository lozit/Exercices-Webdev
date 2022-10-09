# Simple projet en Symfony 6 - 1ere partie

L'objectif est de créer un projet simple en Symfony, découvrant les fonctions de bases du framework, puis de configurer un serveur pour l'héberger et finalement mettre en place une pipeline CI/CD.

Je vous guide avec les différentes commandes, mais je vous laisse faire le code à chaque fois.

Aidez-vous de la [documentation](https://symfony.com/doc/current/index.html) et du [livre officiel](https://symfony.com/doc/6.0/the-fast-track/fr/index.html) pour essayer d'avancer.

Vous pouvez voir sur le [site de démo](http://164.92.137.13/) ce que l'on va construire.

Vous pouvez étudier aussi le [dépot du site de démo](https://gitlab.com/lozit/simplecrud) pour vous guider.

<hr>

Première partie : **La création de l'application**
Seconde partie : [L'hébergement](./Simplecrud-2.md)
Troisième partie : CI/CD (bientôt)

[La démo de l'application](http://164.92.137.13/) - [Le dépot de la démo](https://gitlab.com/lozit/simplecrud)
<hr>

## Création de l'application

Nous allons créer un CRUD simple pour une bibliothèque.

Pour le moment, nous allons gérer uniquement des livres.
Un livre est composé des éléments suivants : Un titre, un résumé, un nombre de pages, un genre (Narratif, Poétique, Théâtral, Épistolaire, Argumentatif)

Bien entendu, c'est très simplifié pour l'exercice.

### Démarrage du projet

Créer le projet
`symfony new simplecrud --version=6.0 --php=8.1 --webapp --docker --cloud`

Aller dans le dossier du projet
`cd simplecrud`

Démarrer le serveur web
`symfony server:start -d`

Consulter les log
`symfony server:log`

### Configuration de la base de données avec Docker

Configurer un nom de Base de données, de User et de Mot de passe dans `/docker-compose.yml`

Modifier `DATABASE_URL` dans le fichier `.env`
Vous pouvez aussi créer un fichier `.env.local` qui correspond à votre config locale (et qui sera ignoré dans Git).

Démarrer Docker Compose
`docker-compose up -d`

Voir l'état des conteneurs
`docker-compose ps`

Voir les logs des conteneurs
`docker-compose logs`

Accéder à la base de données locales PostgreSQL en executer `psql` dans le conteneur
`docker-compose exec database psql app app`

### Mettre en place GIT avec GITLAB

Creez un compte si ce n'est pas déja fait sur [gitlab.com](https://gitlab.com)

Installez [Gitlab CLI](https://gitlab.com/gitlab-org/cli#installation)

Authentifiez-vous avec `glab auth login`

`git add .` pour ajouter toutes les modifications au projet

`git commit -m 'Initialisation du projet'` pour le premier commit

`glab repo create` pour créer un repo sur Gitlab

`git push origin main` pour push le projet sur Gitlab

### Résumé de l'application à réaliser

Vous devez donc créer un controleur `Bibliotheque` et une entité `Livre` ainsi que des formulaires et pages pour gérer votre CRUD.

Il vous faut donc :

- une page qui liste tous les livres.
- une page pour créer un livre.
- un page qui affiche le détail d'un livre.
- une route qui permet d'effacer un livre et qui redirige ensuite sur la liste de tous les livres.
- une page qui permet d'éditer un livre.
- une page pour se connecter, puisque seules les personnes connectées peuvent ajouter/éditer/supprimer.

### Commandes de bases

Liste des commandes du make bundle :
`symfony console list make`

Créer un contrôleur :
`symfony console make:controller BibliothequeController`
Va créer :
`src/Controller/BibliothequeController.php`

Créer des classe d'entités
`symfony console make:entity Livre`

```bash
titre : string / 255 / no
resume : text / yes
nbpages : integer / no
genre : string / 255 / no
```

Migrer la base de données
`symfony console make:migration`

Mettre à jour la base de données locale
`symfony console doctrine:migrations:migrate`

Générer un formulaire
`symfony console make:form LivreFormType Livre`

### Sécuriser l'interface d'administration

`symfony console make:user Admin` pour créer une entité user

Puis suivre : <https://symfony.com/doc/current/security.html>

Créer un contrôleur :
`symfony console make:controller Login`

Ajouter un user :

Créer un hash de votre mot de passe : `symfony console security:hash-password`

executer la requete SQL suivante dans psql ou avec un logiciel comme DBeaver :

```SQL
INSERT INTO admin (id, username, roles, password) VALUES (nextval('admin_id_seq'), 'admin', '["ROLE_ADMIN"]','$argon2id$v=19$m=65536,t=4,p=1$BQG+jovPcunctc30xG5PxQ$TiGbx451NKdo+g9vLtfkMy4KjASKSOcnNxjij4gTX1s');
```

Vous venez de créer un administrateur avec les identifiants admin/admin si vous avez copiez coller le code. Sinon vous pouvez remplacer le password par le hash créé plus haut.

<hr>

La suite :  [L'hébergement](./Simplecrud-2.md)

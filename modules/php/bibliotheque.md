# Exercices de création d'une application de gestion de bibliothèque

## L'application

Nous voulons créer un logiciel de gestion de notre bibliothèque. L'application servira à gérer les inscriptions, faire le suivi des emprunts de livres, donner des informations sur les livres (voir [exercice merise](../merise/bibliotheque.md)).

Nous allons effectuer une série d'exercices qui vont nous emmener progressivement vers la réalisation de cette application.
Nous allons aborder les thèmes suivants :

- La connexion à la base de données avec PDO
- La POO (programmation orientée objet)
- Le CRUD (Create Read Update Delete)
- le MVC (Modele Vue Controlleur)

## Exercices

### Exercice 1 - Classe Formulaire

- Créez une classe **formulaire** pour créer des formulaire. Utilisez votre [classe formulaire](./objets.md) créée précédament. Ajoutez-y un attribut pour définir si un champs est obligatoire ou pas.

### Exercice 2 - Table Livre

- Créer une table **livre** avec les informations suivantes : Titre du livre, Auteur, résumé du livre, URL photo, date de parution,Nombre d'exemplaires dans la bibliothèque, nombre d'exemplaires restants, le code emplacement (alpha-numérique de 6 caractères).
- En utilisant PDO (pour vous aider : https://phpdelusions.net/pdo/), et votre classe formulaire, créez un formulaire pour insérer les données dans la base.
- Le titre, L'auteur, la date de parution, le nombre d'exemplaires dans la bibliothèque et le code emplacement sont obligatoires.
- Affichez tous les livres de la bibliotheque.

### Exercice 3 - Classe Livre

Créer une classe **Livre** avec :

- Les propriétés correspondantes à la table livre
- Une méthode enregistrer() qui va enregistrer le livre dans la base de données.
- lire($id) qui va chercher les données du livre qui a id = $id et qui met à jour toutes les propriétés de l'instance

```
$monlivre = lire(2) // pour charger les données du livre dont l'id=2
$montitre = $monlivre->titre; // Pour afficher le titre du livre
```

-

### Exercice ? - API

On pourrait remplir la BDD avec les données de l'API du NY Times : https://www.youtube.com/watch?v=1O496C-79Pg

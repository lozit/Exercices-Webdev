# Exercices de création d'une application de gestion de bibliothèque

## L'application

Nous voulons créer un logiciel de gestion de notre bibliothèque. L'application servira à gérer les inscriptions, faire le suivi des emprunts de livres, donner des informations sur les livres.

## Les règles de gestion métier

- Pour chaque livre, on doit connaître le titre, l'année de parution, un résumé, le type, la cote, l'auteur et le nombre d'exemplaires dans la bibliothèque.

- Pour savoir où le livre est rangé, on y assigne une [cote](https://www.enssib.fr/services-et-ressources/questions-reponses/quest-ce-quune-cote-en-bibliotheque). La cote choisie est la suivante :  2 lettres (RP pour roman policier) + indice Dewey raccourci (843) + 3 lettres du nom de l’auteur.
Exemple : RP843DAN

- On utilise la [Classification décimale de Dewey](https://fr.wikipedia.org/wiki/Classification_d%C3%A9cimale_de_Dewey) pour le type de livre.

- Un livre peut être rédigé par aucun (dans le cas d'une œuvre anonyme), un ou plusieurs auteurs dont on connaît le nom, le prénom, la date de naissance, le pays d'origine et une biographie.

- Un inscrit est identifié par un numéro et on doit mémoriser son nom, prénom, adresse, téléphone et adresse e-mail.

- Un inscrit peut emprunter jusqu'à 5 livres en même temps.

- Un emprunt dure 14 jours renouvelable une fois.

- Un inscrit est abonné à la bibliothèque pour la période en cours (du 1er septembre au 30 août).

- La cotisation annuelle est de 10€.

## L'application

- Une page qui liste les livres de la bibliothèque dans un grand tableau avec : Nom du livre, Auteur, Nombre d'exemplaire dans la bibliothèque, nombre de livre restant (ex : 0/1 pour dire un exemplaire déjà prêté), le code emplacement.
  Au bout de chaque ligne, deux liens : un pour effacer le livre, l'autre pour le modifier.
  En cliquant sur le nom du livre on arrive sur la fiche du livre.
  On affiche 20 livres par page. Il y a un système pour afficher la suite des livres.
  Un moteur de recherche permet de filtrer les livres.

- Une page "fiche livre" avec toutes les informations sur le livre et l'auteur, ainsi que l'historique des emprunts.

- Une page qui liste tous les inscrits dans un grand tableau avec comme information : Nom, prénom, actif/inactif (payé ou pas), nombre de livre emprunté en ce moment, nom total de livres empruntés, en retard ou pas pour rendre un livre (oui/non).
  Le nom est cliquable pour aller sur la page de la personne.

- Une page "personne" qui affiche les infos de la personne et qui permet de saisir les nouveau emprunts et les retours.

## Consignes

- Réaliser le dictionnaire de données, le MCD, le MLD
- Créez la base de données sur MySQL

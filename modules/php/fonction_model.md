# Exercice de création d'une fonction Model

L'objectif est de travailler l'abstraction.

- Créer une fonction pour se connecter à la base de données. Les paramètres de connexion sont entrées dans un fichier de configuration.

- Créer une fonction rechercher(nom_de_la_table, champs, where, limit, sort)

nom_de_la_table : nom de la table en text
champs : tableau des champs de la BDD que l'on veut récupérer
where : tableau avec les conditions du where
limit : nombre d'occurences voulues
sort : ASC ou DESC

Exemple :
rechercher("livre",['titre','auteur'],['auteur=3','style="roman"'],10,ASC)

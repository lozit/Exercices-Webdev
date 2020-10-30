Voici un exercice pour pratiquer le javascript et la manipulation du DOM.

# Exercice: créer un questionnaire à choix multiples

- Nous allons partir du QCM suivant, notamment pour avoir des vrais données : https://www.alsacreations.com/quiz/lire/5-CSS-debutant

- Commencez par créer votre HTML + CSS. Vous n'êtes pas obligé de copier le style d'Alsacréations.

- Je voudrais avoir des lettres A - B - C à la place des puces. Quand on clique sur le texte de la réponse ou de la lettre, la lettre sera mis en couleur. Par exemple comme ceci :

  ![Première étape](./medias/images/quizz_bouton.png)

- Une fois que votre HTML + CSS est terminé, on rajoute le javascript.

- Le bouton "valider les réponses" doit être grisé et ne pas être cliquable, tant que l'on a pas répondu à toutes les questions.

- Une fois que l'on a répondu à toutes les questions, on peut cliquer sur le bouton. On est remonté en haut de la page et les réponses sont affichées.

- Pour chaque question, Si on a répondu juste, le texte de la réponse et le background de la lettre se mettent en vert. On ajoute à la fin de la ligne le texte suitant : (juste)

- Pour chaque question, Si on a répondu faux, le texte de la réponse et le background de la lettre se mettent en rouge. On ajoute à la fin de la ligne le texte suitant : (faux). Le texte de la ligne est barré.

- En dessous de la question on affiche un complément d'information. Voir le site d'Alsacréations pour récupérer le texte.

- En haut de la page, on affiche le score.

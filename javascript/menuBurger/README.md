Voici un exercice pour pratiquer le HTML, le CSS, les animations et le javascript.

Si vous ne l'aviez pas encore fait, créez un compte sur codepen : https://codepen.io/

# Exercice: créer un Menu Burger

- Allez sur ce pen : https://codepen.io/guillaumeferrari/pen/ExyWZMW

![Départ](./medias/menuBurger_start.png)

- copiez-le sur votre propre compte en cliquant sur `fork` en bas à droite de l'écran. Vous pouvez maintenant le modifier et l'enregistrer.

- Ajouter le mot `MENU` en haut à droite de la page. Ce mot doit rester à la même place lorsque l'on scroll.

- Ajouter une balise `<nav>` avec la classe `menu` juste avant le dernier `</div>`

- Dans cette balise, ajoutez 6 éléments `<a>` avec comme contenu : FERMER, lien 1, lien 2, lien 3, lien 4 et lien 5

- Les liens sont en gris clair `#eee` et le background de `<nav>` est en gris foncé `#333`

- Le conteneur `<nav>` doit recouvrir intégralement la page et être fixe.

- Les liens de `<nav>` doivent être centré horizontalement et verticalement

- Le lien `FERMER` doit être positionné en haut à droite, au même endroit que le mot `MENU`, à la différence qu'il est à l'intérieur de `<nav>`

Vous devez avoir quelque chose comme ça :

![Première étape](./medias/menuBurger_menuOuvert.png)

- Ajouter la classe `menu_ouvert` à la div qui a la classe `container`

- Faire en sorte que quand la classe `menu_ouvert` est présente sur la `div.container` la `<nav>` soit affichée et lorsque l'on enlève cette classe, la `<nav>` disparait.

- En javascript, faire en sorte que lorsque l'on clique sur `MENU`, la classe `menu_ouvert` soit ajoutée sur `div.container` et lorsque l'on clique sur `FERMER` la classe `menu_ouvert` soit supprimée de `div.container`.

- Après cette étape vous devriez avoir un menu burger fonctionnel. Nous allons maintenant juste rajouter une animation de fondu lorsqu'on affiche ou ferme le menu. Pour que cela fonctionne, vous ne devez pas utiliser `display: none` pour cacher le menu, mais une combinaison de `visibility: hidden;` et `opacity: 0;`

- Une fois cet exercice terminé, vous pouver le refaire en changeant la manière dont s'affiche le menu. Au lieu d'avoir un menu qui s'affiche par dessus la page, faite un menu qui apparait en glissant de la droite comme sur le site suivant : https://wepresent.wetransfer.com/

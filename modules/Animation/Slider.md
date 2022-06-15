# Slider CSS

On va faire un slider d'images en CSS uniquement.

Quelque chose comme ça :
![alt text](./slider.gif "image Title")

On part d'un code comme celui ci :

```html
<div id="slider">
  <figure>
    <img src="http://via.placeholder.com/800x350" alt>
    <img src="http://via.placeholder.com/800x350" alt>
    <img src="http://via.placeholder.com/800x350" alt>
    <img src="http://via.placeholder.com/800x350" alt>
    <img src="http://via.placeholder.com/800x350" alt>
  </figure>
</div>
```

## les consignes

- Uniquement du CSS.
- Le slider doit être responsive : tout doit être en pourcentage sauf un max-width pour éviter d'agrandir les images au delà de leur taille.
- quand une image arrive, elle reste affichée pendant un moment, avant que la suivante arrive. Donc ça déroule, ça pause, puis ça déroule etc.
- la première étape est de mettre toutes les photos sur la même ligne.
- La seconde étape consiste à définir la taille de la div slider et de cacher tout ce qui dépasse. (overflow).
- Ensuite on anime une position relative en changeant la valeur de left pour décaller le groupe d'image vers la gauche.
- L'animation tourne en boucle indéfiniment.

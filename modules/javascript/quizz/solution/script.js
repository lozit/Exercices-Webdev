// Le premier listener pour attendre que tout le contenu du DOM soit chargé
// Tout le code sera mis à l'intérieur de ce listener
document.addEventListener(
  "DOMContentLoaded",
  function () {
    var b = document.querySelector("button");
    var q1 = false;
    var q2 = false;

    // Fonction qui vérifie si toutes les questions ont eu des réponses;
    // Si c'est le cas, j'affiche le bouton
    function verifquestionnaire() {
      if (q1 === true && q2 === true) {
        b.disabled = false;
      }
    }

    // 1 - Afficher le bouton quand toutes les questions ont une réponse

    // NORMALEMENT JE DEVRAIS FAIRE UNE BOUCLE POUR NE PAS RÉPETER DEUX FOIS LA MEME CHOSE
    // MAIS POUR QUE ÇA SOIT PLUS SIMPLE A COMPRENDRE, J'AI RÉPÉTÉ MON CODE DEUX FOIS
    // UNE FOIS PAR QUESTION

    // Question 1
    // Je récupère tous les inputs radio de la question 1
    var reponsesq1 = document.querySelectorAll('input[name="rep1"]');
    // Sur chacun de ses radio bouton...
    reponsesq1.forEach((e) => {
      //....je met un listener au clic

      e.addEventListener("click", function () {
        // si quelqu'un clic sur un radio bouton de la question 1
        // je met q1 à true pour dire qu'il a répondu à la question 1
        q1 = true;
        // Je vérifie ensuite si toutes les questions ont eu une réponse avec la fonction verifquestionnaire
        verifquestionnaire();
      });
      // e correspond à chaque radio bouton de la question 1, on peut le voir en faisant :
      //console.log(e);
    });

    // Question 2
    // Je récupère tous les inputs radio de la question 2
    var reponsesq2 = document.querySelectorAll('input[name="rep2"]');
    // Sur chacun de ses radio bouton...
    reponsesq2.forEach((e) => {
      //....je met un listener au clic
      e.addEventListener("click", function () {
        // si quelqu'un clic sur un radio bouton de la question 1
        // je met q2 à true pour dire qu'il a répondu à la question 1
        q2 = true;
        // Je vérifie ensuite si toutes les questions ont eu une réponse avec la fonction verifquestionnaire
        verifquestionnaire();
      });
      // e correspond à chaque radio bouton de la questioin 2, on peut le voir en faisant :
      // console.log(e);
    });

    // 2 - Afficher le score et les réponses....

    b.addEventListener("click", function () {
      b.disabled = true;
      let note = 0;
      let vraireponse1 = 1;
      let vraireponse2 = 2;

      var valeurreponse1 = document.querySelector('input[name="rep1"]:checked');
      var valeurreponse2 = document.querySelector('input[name="rep2"]:checked');
      console.log("reponse1 : " + valeurreponse1.value);
      console.log("reponse2 : " + valeurreponse2.value);

      if (valeurreponse1.value == vraireponse1) {
        console.log("la réponse 1 est bonne");
        document.querySelector('input[name="rep1"]:checked').classList.add("juste");
        note++;
      } else {
        console.log("la réponse 1 est fausse");
        document.querySelector('input[name="rep1"]:checked').classList.add("faux");
      }

      if (valeurreponse2.value == vraireponse2) {
        console.log("la réponse 2 est bonne");
        document.querySelector('input[name="rep2"]:checked').classList.add("juste");
        note++;
      } else {
        console.log("la réponse 2 est fausse");
        document.querySelector('input[name="rep2"]:checked').classList.add("faux");
      }

      console.log("note finale : " + note + "/2");
    });
  },
  false
);

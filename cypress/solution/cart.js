document.addEventListener("DOMContentLoaded", function () {
  let pizzas = document.querySelectorAll("li");
  let mesPizzas = new Map();
  pizzas.forEach((pizza, i) => {
    mesPizzas.set(pizza.dataset.ref, 0);
    pizza.querySelector(".moins").addEventListener("click", () => {
      if (pizza.querySelector(".qt").innerHTML > 0) {
        pizza.querySelector(".qt").innerHTML--;
        pizza.querySelector(".totalligne").innerHTML = pizza.querySelector(".qt").innerHTML * pizza.dataset.prix;
        document.querySelector("#amount").value = Number(document.querySelector("#amount").value) - Number(pizza.dataset.prix);
        Number(document.querySelector("#amount").value) > 0 ? (document.querySelector("#commande").style.display = "block") : (document.querySelector("#commande").style.display = "none");
        mesPizzas.set(pizza.dataset.ref, mesPizzas.get(pizza.dataset.ref) - 1);
        affichercommande(mesPizzas);
      }
    });
    pizza.querySelector(".plus").addEventListener("click", () => {
      pizza.querySelector(".qt").innerHTML++;
      pizza.querySelector(".totalligne").innerHTML = pizza.querySelector(".qt").innerHTML * pizza.dataset.prix;
      document.querySelector("#amount").value = Number(document.querySelector("#amount").value) + Number(pizza.dataset.prix);
      Number(document.querySelector("#amount").value) > 0 ? (document.querySelector("#commande").style.display = "block") : (document.querySelector("#commande").style.display = "none");
      mesPizzas.set(pizza.dataset.ref, mesPizzas.get(pizza.dataset.ref) + 1);
      affichercommande(mesPizzas);
    });
  });
  function affichercommande(mesPizzas) {
    let commande = "";
    for (var [key, value] of mesPizzas) {
      if (value != 0) commande += key + " x " + value + " - ";
    }
    document.querySelector("#description").value = commande.slice(0, -3);
  }
});

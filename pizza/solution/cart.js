document.addEventListener("DOMContentLoaded", function () {
  let pizzas = document.querySelectorAll("li");
  pizzas.forEach((pizza) => {
    pizza.querySelector(".moins").addEventListener("click", () => {
      if (pizza.querySelector(".qt").innerHTML > 0) {
        pizza.querySelector(".qt").innerHTML--;
        pizza.querySelector(".totalligne").innerHTML = pizza.querySelector(".qt").innerHTML * pizza.dataset.prix;
        document.querySelector("#total").innerHTML = Number(document.querySelector("#total").innerHTML) - Number(pizza.dataset.prix);
        Number(document.querySelector("#total").innerHTML) > 0 ? (document.querySelector("button").style.display = "block") : (document.querySelector("button").style.display = "none");
      }
    });
    pizza.querySelector(".plus").addEventListener("click", () => {
      pizza.querySelector(".qt").innerHTML++;
      pizza.querySelector(".totalligne").innerHTML = pizza.querySelector(".qt").innerHTML * pizza.dataset.prix;
      document.querySelector("#total").innerHTML = Number(document.querySelector("#total").innerHTML) + Number(pizza.dataset.prix);
      Number(document.querySelector("#total").innerHTML) > 0 ? (document.querySelector("button").style.display = "block") : (document.querySelector("button").style.display = "none");
    });
  });
});

document.addEventListener("DOMContentLoaded", function () {
  let menu = document.querySelector(".menu");
  let fermer = document.querySelector(".fermer");
  let container = document.querySelector(".container");
  menu.addEventListener("click", function (e) {
    e.preventDefault();
    container.classList.add("menu_ouvert");
  });
  fermer.addEventListener("click", function (e) {
    e.preventDefault();
    container.classList.remove("menu_ouvert");
  });
});

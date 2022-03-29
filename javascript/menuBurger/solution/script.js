document.addEventListener("DOMContentLoaded", function () {
  const menu = document.querySelector(".menu");
  const container = document.querySelector(".container");
  const fermer = document.querySelector(".fermer");
  menu.addEventListener("click", (e) => {
    e.preventDefault();
    container.classList.add("menu_ouvert");
  });
  fermer.addEventListener("click", (e) => {
    e.preventDefault();
    container.classList.remove("menu_ouvert");
  });
});

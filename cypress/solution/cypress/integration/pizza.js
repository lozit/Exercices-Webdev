describe("Test de l'app de commande de Pizzas", () => {
  it("On accède à la page", () => {
    cy.visit("https://exercices-webdev-pizza.netlify.app/");
  });
  it("On vérifie que le bouton Paypal soit bien caché", () => {
    cy.get("#commande").should("have.css", "display", "none");
  });
  it("On essaye d'ajouter une reine", () => {
    cy.get("li:first-child .plus").click();
    cy.get("li:first-child .qt").should("have.text", "1");
    cy.get("li:first-child .totalligne").should("have.text", "8");
    cy.get("#amount").should("have.value", "8");
  });
  it("On vérifie que le bouton Paypal soit bien affiché", () => {
    cy.get("#commande").should("have.css", "display", "block");
  });
  it("On vérifie que si on clique 2 fois sur moins, on ai 0 en quantité et pas -1", () => {
    cy.get("li:first-child .moins").click();
    cy.get("li:first-child .moins").click();
    cy.get("li:first-child .qt").should("have.text", "0");
  });
  it("On fait une grosse commande", () => {
    cy.get("li:first-child .plus").click();
    cy.get("li:first-child .plus").click();
    cy.get("li:nth-child(3) .plus").click();
    cy.get("li:nth-child(5) .plus").click();
    cy.get("li:nth-child(6) .plus").click();
    cy.get("li:nth-child(6) .plus").click();
    cy.get("#amount").should("have.value", "58");
    cy.get("#description").should("have.value", "reine x 2 - napolitaine x 1 - aubergine x 1 - royale x 2");
  });
});

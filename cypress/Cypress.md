# Tester votre application avec Cypress

Cet exercice a pour but de vous montrer le fonctionnement de Cypress pour tester votre application.

## Installation et Introduction à Cypress

1. Installer NPM : https://www.npmjs.com/
2. Créez un dossier pour un nouveau projet
3. Dans le terminal, positionnez-vous dans ce dossier : `cd /chemin/vers/le/projet`
4. Installez Cypress avec NPM en tapant dans le terminal : `npm install cypress --save-dev`
5. On initialise le projet : `npm init`
6. On lance Cypress : `npx cypress open`
7. Créer un fichier _sample_spec.js_ dans le dossier `cypress/integration`
8. Suivre l'exemple sur le site officiel : https://docs.cypress.io/guides/getting-started/writing-your-first-test.html#Add-a-test-file

## Tester le formulaire de commande de Pizza

Ecrire un test qui correspond a ces actions :

1. Charger le site https://exercices-webdev-pizza.netlify.app/ (ou le votre si vous avez fait l'exercice)
2. Vérifier qu'il n'y ai pas de bouton Paypal affiché
3. Ajouter une pizza Reine à la commande
4. Vérifier le montant de la ligne
5. Vérifier le montant total de la commande
6. Vérifier que le bouton Paypal soit bien affiché
7. Cliquer deux fois sur le bouton moins et vérifier que la quantité est bien toujours à 0 et pas à -1
8. Commander 2 Reines, 1 Napolitaine, 1 Aubergine, 2 Royales et vérifier que le total soit bien à 58€.
9. Vérifier que le récapitulatif de commande soit bien égale à : `reine x 2 - napolitaine x 1 - aubergine x 1 - royale x 2`

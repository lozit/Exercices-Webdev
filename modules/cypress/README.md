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

## CI/CD

Nous allons aborder ce concept à l'aide de Github, Netlify et Cypress.

### Qu'est ce que CI/CD, l'intégration continue, la Distribution continue et le Déploiement continu ?

Le plus simple, c'est de commencer par lire cet article de Redhat : https://www.redhat.com/fr/topics/devops/what-is-ci-cd

Comme vous avez pu le lire, l'approche CI/CD consiste à mettre en ligne une application de façon automatique. Les développeurs travaillent sur leur machine, publient leur code sur le dépot de l'application. Lorsque le code est poussé sur la branche principale, il est mis en ligne. Sur les différentes étapes de ce processus, on peut réaliser des tests.

Il existe différents tests :

- [les tests unitaires](https://fr.wikipedia.org/wiki/Test_unitaire), qui sont des tests que l'auteur d'un morceau de programme réalise afin de tester son morceau de programme. La réalisation de ce genre de test necessite que l'on lise et comprennent le test qui est testé. On parle de test par boite blanche.
- [les tests système](https://fr.wikipedia.org/wiki/Tests_syst%C3%A8me) ou tests fonctionnels, qui sont des tests qui ne necessite pas de connaitre le code. Le but est de tester ce que doit faire le programme ou le morceau de programme. On test donc le résultat. On parle de test par boite noire. Cypress se situe dans ce type de logiciel de test.

### Faire de l'intégration et du déploiement continu sur notre formulaire de commande de Pizza

1. Créez un dépot GIT sur Github et le cloner sur votre ordinateur (vous pouvez utiliser GitKraken)
2. Dans ce dossier, y mettre les fichiers de votre formulaire de commande de pizza avec les tests Cypress. Ne garder que votre test lié à votre application, pas les tests de démo.
3. Créez un fichier `.gitignore` à la racine de votre projet. Mettez dedans le mot : `node_modules`
4. Poussez vos fichier sur votre dépot GIT
5. Sur Netlify, créez une nouvelle application, linkez la à votre dépot Github. Vous devez avoir votre formulaire en ligne.
6. Dans votre dossier sur votre ordinteur, vous ouvrez le terminal de VSCode et vous tapez : `npm i -D netlify-plugin-cypress` pour installer le plugin Cypress pour Netlify
7. Sur Netlify, il faut aussi ajouter le plugin à votre site en allant sur Netlify => clic sur votre site => plugins => go to plugins directory => Vous tapez `Cypress` => Install
8. Maintenant, lorsque vous allez faire un git push avec gitkraken, Netlify va détecter la mise en ligne sur Github, il récupèrera votre code source et lancera les test Cypress avant la mise en ligne. Si les tests échouent, le site ne sera pas mis en ligne.

Pour vous aider : https://github.com/cypress-io/netlify-plugin-cypress#readme
https://cypress.io/blog/2020/03/30/run-cypress-tests-on-netlify-using-a-single-line/

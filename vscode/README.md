# VSCODE

## Installer une typo spécifique pour coder

- Typo [Fira code](https://github.com/tonsky/FiraCode)

## Aides globales

- [Aides, Extensions etc.](https://github.com/alsacreations/guidelines/blob/master/Guidelines-VScode.md)

## ESlint (vérification syntaxe JavaScript)

- Installer le plugin ESLint
- Installer ESLint sur votre machine : `npm install -g eslint`
- Dans chaque nouveau projet, vous pouvez créer un fichier `.eslintrc` qui contiendra la configuration de votre ESLint.
- Vous pouvez utiliser des configurations déjà faites, une assez connue et bien utilisée, c'est : eslint-config-airbnb-base.
  - Lancer le terminal à la racine de votre projet et tapez : `npx install-peerdeps --dev eslint-config-airbnb-base`
  - Dans votre fichier `.eslintrc` copiez le code suivant :

```json
{
  "env": {
    "browser": true,
    "es2021":true
  },
  "parserOptions": {
    "ecmaVersion": 2018,
    "ecmaFeatures": {
      "jsx": true
    }
  },
  "extends": ["airbnb-base"]
}
```

## Les extensions à installer

- **Project Manager** (Bookmark de projets)
- **ESLint** (vérification syntaxe JavaScript)
- **Stylelint** (vérifie la syntaxe CSS d'après un ensemble de règles)
- **Error Lens** (affiche les erreurs des linters directement dans la fenêtre de code)
- **Beautify** (remise en forme, à la demande, d'un code mal indenté/formaté)

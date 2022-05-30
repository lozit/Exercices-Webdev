# Installation pour les développeurs

Avant de commencer quoi que ce soit, nous allons nous créer un environement de travail qui soit le plus efficace possible.

Votre ordinateur est un outil de travail et il est important de le garder en bon état de fonctionnement tant au niveau matériel que logiciel.

## Matériel

Si vous cherchez le bon ordinateur pour le développement informatique, voici ce qu'il faut prendre en considération :

- Portable ou tour, à vous de choisir, il n'y a pas de préférence pour l'un ou pour l'autre.
- Nous n'avons pas besoin d'un ordinateur puissant, mais il est important d'avoir quand même quelque chose de correct. Un processeur I5 ou équivalent suffit largement.
- La mémoire vive (RAM) est par contre assez importante et il est préférable d'avoir au moins 8Go, le double si possible.
- Niveau carte graphique, nous n'avons pas besoin de grand chose, ce n'est pas important pour nous.
- Pour le disque dur, comme pour la carte graphique, nous n'avons pas besoin de grand chose car nous ne consommons pas beaucoup de place. Un disque SSD apporte quand même un peu de rapidité qui peut être agréable, mais pas obligatoire.
- Pour les écrans, la résolution importe peu (pas besoin de 4K), par contre avoir deux écrans ou un écran large est vraiment un plus. La taille de l'écran ajoute du confort mais augmente le budget.
- Un bon clavier et une bonne souris est important. Nous passons énormément de temps devant notre ordinateur, il est important d'avoir des périphériques de bonne qualité. Si vous choisissez un ordinteur portable, choisissez-en un avec un clavier convenable.
- Mac ou PC ? c'est le débat sans fin, les deux sont valables pour ce que l'on doit faire.

## Système d'exploitation

Pour le développement informatique, et surtout pour le développement web, la plupart des outils sont écrit pour fonctionner prioritairement sous Linux, puisque la majorité des serveurs web utilisent linux.

**Nous recommandons donc d'utiliser un système d'exploitation [UNIX](https://fr.wikipedia.org/wiki/Unix) comme macOS sur Mac ou Linux sur PC**.

Si pour vous, la notion de système d'exploitation est floue, vous pouvez regarder cette vidéo qui vous explique ce [qu'est un système d'exploitation](https://www.youtube.com/watch?v=Pml6TfrNcy0)

### Et windows dans tout ça ?

Nous ne recommandons pas d'utiliser windows, même si c'est tout à fait possible et ce pour deux raisons :

- C'est plus pratique pour nous de maintenir des cours uniquement sur un seul système et nous avons choisi Linux (macOS est très proche, donc on fait d'une pierre, deux coups).
- Apprendre à utiliser Linux va vous familiariser avec le système le plus utilisé sur les serveurs web. C'est une compétence qu'il est interressant d'apprendre.

Si vous aimez et utilisez windows au quotidien, la solution simple est d'installer Linux sur une **machine virtuelle**. Celà vous permettra d'utiliser Linux sans abandonner Windows.

### Installer Linux sur une machine virtuelle

Une machine virtuelle est une émulation d'un ordinateur qui tourne sur votre système d'exploitation.

On installe donc un logiciel sur Windows qui va executer Linux. Nous utiliserons [VirtualBox](https://fr.wikipedia.org/wiki/Oracle_VM_VirtualBox).

Nous allons installer [Xubuntu](https://fr.wikipedia.org/wiki/Xubuntu) qui est une [distribution Linux](https://fr.wikipedia.org/wiki/Linux#Distributions) dérivée d'[Ubuntu](<https://fr.wikipedia.org/wiki/Ubuntu_(syst%C3%A8me_d%27exploitation)>) qui lui même est basé sur [Debian](https://fr.wikipedia.org/wiki/Debian?tableofcontents=0).

Ubuntu est une distribution simple à installer et à utiliser. Xubuntu est une "version" plus légère qu'Ubuntu, ce qui dans le cas d'une VirtualBox nous arrange.

- Installer VirtualBox : https://www.virtualbox.org/wiki/Downloads
- Télécharger Xubuntu : https://xubuntu.org/download/
- Créer une VirtualBox : https://www.youtube.com/watch?v=8dNq63BXenY
  Le tuto explique comment faire avec Ubuntu, on fera la même chose sauf qu'on utilisera l'image de Xubuntu qu'on a déjà téléchargée.
- Dans la vidéo, il montre comment augmenter le nombre de coeur de CPU dans la configuration. Profitez-en pour augmenter la mémoire vidéo dans la partie Ecran et d'ajouter un ecran supplémentaire si vous utilisez deux écran.
- Mettez toujours le maximum de ressource tout en restant dans le vert.
- Installez les "Guest Additions". Vous trouverez comment faire sur [cette page en anglais](https://www.theodinproject.com/lessons/foundations-prerequisites)

**Tout ce que l'on va installer maintenant ce fera dans xubuntu sur votre machine virtuelle !**

## Navigateurs

Il existe principalement trois Moteurs de rendu HTML utilisé par les navigateurs web :

Webkit : Apple Safari
Blink : Google Chrome, Microsoft Edge, Opera, Vivaldi, Brave etc.
Gecko : Mozilla Firefox

Idéalement, il faudrait tester son travail sur les trois plateformes, ce qui impliquerait d'utiliser un mac.
Mais aujourd'hui, les trois moteurs sont très similaire car ils sont de plus en plus conforme avec les recommandations du WaSP : https://fr.wikipedia.org/wiki/Web_Standards_Project

Nous allons tout de même utiliser deux navigateurs, dans leur version pour développeur :

- Firefox Quantum Déveloper Edition : https://www.mozilla.org/fr/firefox/79.0a2/firstrun/#
- Google Chrome Canary : https://www.google.com/chrome/canary/

Vous pouvez utiliser d'autres navigateurs pour surfer sur le web, mais nous utiliserons ceux là, et plus particulièrement Firefox pour le développement web par rapport à ses outils dédiés qui sont intéressants.

**Consignes** :

- Installez ces deux navigateurs sur votre machine.

- Installez les extensions suivantes sur Firefox :

  - [Web Developer](https://addons.mozilla.org/fr/firefox/addon/web-developer/)
  - [Wappalyzer](https://addons.mozilla.org/fr/firefox/addon/wappalyzer/)
  - [Clear cache](https://addons.mozilla.org/fr/firefox/addon/clearcache/)
  - Facultatif, mais fortement conseillé : [Ublock Origin](https://addons.mozilla.org/fr/firefox/addon/ublock-origin/)

- Installez les extensions suivantes sur Chrome :

  - [Web Developer](https://chrome.google.com/webstore/detail/web-developer/bfbameneiokkgbdmiekhjnmfkcnldhhm?hl=fr)
  - [Nettoyer tout - Nettoyeur d'historique et de cache](https://chrome.google.com/webstore/detail/clean-all-history-cache-c/elidgjfpciimeeeoeneeiifkmhadhkeh)
  - Facultatif, mais fortement conseillé : [Ublock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=fr)

- Désactiver le cache avec l'inspecteur.

  Sur Firefox :

  - Bouton droit de la souris sur une page => Examiner l'élément
  - Sur le panel du bas, cliquer en haut à droite sur les trois petits points => paramètres
  - Dans Paramètres avancés, cocher la case : "Désactiver le cache HTTP (lorsque la boite à outils est ouverte)

  Sur Chrome :

  - Bouton droit de la souris sur une page => Inspecter
  - Sur le panel du bas, cliquer en haut à droite sur la roue crantée
  - Dans Network, cocher la case : "Disable cache (while DevTool is open)

- Mettez Firefox comme navigateur par défaut : https://www.mozilla.org/fr/firefox/set-as-default/

- Facultatif : vous pouvez synchroniser votre historique et vos bookmark en créant un compte Firefox / Google
  - sur Firefox : https://www.mozilla.org/fr/firefox/sync/
  - sur Chrome : https://support.google.com/chrome/answer/185277?co=GENIE.Platform%3DDesktop&hl=fr

## Editeurs de code

Nous allons installer [Vscode](https://code.visualstudio.com/) qui sera notre éditeur principal

- Ouvrez le terminal
- Executez la commande suivante pour télécharger la dernière version de VSCode :
  `wget -O code-latest.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'`
- Executer la commande suivante pour installer le fichier .deb :
  `sudo apt install ./code-latest.deb`
- Effacer le fichier .deb :
  `rm code-latest.deb`

Pour lancer VSCode, vous avez deux façons :

- Cliquez sur _Visual Studio Code_ dans le menu applicationj
- Utilisez la commande `code`dans le terminal

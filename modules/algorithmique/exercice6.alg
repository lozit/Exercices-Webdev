<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description texte="" courant="AFFICHER nbvoyelles"/>
    <extension extnom="inactif"/>
    <fonction fctcode="" fctetat="inactif"/>
    <F2 F2lignes="" F2etat="inactif" F2defaut="" F2para=""/>
    <repere repetat="inactif" repcode="-10#10#-10#10#2#2"/>
    <param maxBoucle="500000" epaisseurLigne="2" nbDecimales="8" totalBoucles="5000000" epaisseurPoint="2" totalAffichages="1000" arrondiAuto="vrai"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions">
        <item algoitem="FONCTION compterVoyelle(phrase)" code="201#compterVoyelle#phrase">
            <item algoitem="VARIABLES_FONCTION" code="202#declarationsvariablesfonction"/>
            <item algoitem="DEBUT_FONCTION" code="203#debutfonction"/>
            <item algoitem="// On ne compte que les voyelles en minuscule pour simplifier le code" code="19# On ne compte que les voyelles en minuscule pour simplifier le code"/>
            <item algoitem="nbvoyelles PREND_LA_VALEUR 0" code="5#nbvoyelles#0#pasliste"/>
            <item algoitem="longeur PREND_LA_VALEUR phrase.length" code="5#longeur#phrase.length#pasliste"/>
            <item algoitem="POUR i ALLANT_DE 0 A longeur" code="12#i#0#longeur">
                <item algoitem="DEBUT_POUR" code="13#debutpour"/>
                <item algoitem="SI ( phrase[i]==&quot;a&quot; OU phrase[i]==&quot;e&quot; OU phrase[i]==&quot;i&quot; OU phrase[i]==&quot;o&quot; OU phrase[i]==&quot;u&quot; OU phrase[i]==&quot;y&quot;) ALORS" code="6# phrase[i]==&quot;a&quot; OU phrase[i]==&quot;e&quot; OU phrase[i]==&quot;i&quot; OU phrase[i]==&quot;o&quot; OU phrase[i]==&quot;u&quot; OU phrase[i]==&quot;y&quot;">
                    <item algoitem="DEBUT_SI" code="7#debutsi"/>
                    <item algoitem="nbvoyelles PREND_LA_VALEUR nbvoyelles + 1" code="5#nbvoyelles#nbvoyelles + 1#pasliste"/>
                    <item algoitem="FIN_SI" code="8#finsi"/>
                </item>
                <item algoitem="FIN_POUR" code="14#finpour"/>
            </item>
            <item algoitem="RENVOYER nbvoyelles" code="205#nbvoyelles"/>
            <item algoitem="FIN_FONCTION" code="204#finfonction"/>
        </item>
    </item>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="phrase EST_DU_TYPE CHAINE" code="1#CHAINE#phrase"/>
        <item algoitem="longeur EST_DU_TYPE NOMBRE" code="1#NOMBRE#longeur"/>
        <item algoitem="i EST_DU_TYPE NOMBRE" code="1#NOMBRE#i"/>
        <item algoitem="nbvoyelles EST_DU_TYPE NOMBRE" code="1#NOMBRE#nbvoyelles"/>
        <item algoitem="test EST_DU_TYPE NOMBRE" code="1#NOMBRE#test"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="LIRE phrase" code="2#phrase#pasliste"/>
        <item algoitem="//APPELER_FONCTION compterVoyelle(phrase)" code="19#APPELER_FONCTION compterVoyelle(phrase)"/>
        <item algoitem="test PREND_LA_VALEUR compterVoyelle(phrase)" code="5#test#compterVoyelle(phrase)#pasliste"/>
        <item algoitem="AFFICHER nbvoyelles" code="3#nbvoyelles#0#pasliste"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>

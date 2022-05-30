<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="AFFICHER envers" texte=""/>
    <extension extnom="inactif"/>
    <fonction fctetat="inactif" fctcode=""/>
    <F2 F2etat="inactif" F2lignes="" F2para="" F2defaut=""/>
    <repere repetat="inactif" repcode="-10#10#-10#10#2#2"/>
    <param epaisseurLigne="2" arrondiAuto="vrai" totalBoucles="5000000" maxBoucle="500000" totalAffichages="1000" epaisseurPoint="2" nbDecimales="8"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="phrase EST_DU_TYPE CHAINE" code="1#CHAINE#phrase"/>
        <item algoitem="envers EST_DU_TYPE CHAINE" code="1#CHAINE#envers"/>
        <item algoitem="test EST_DU_TYPE CHAINE" code="1#CHAINE#test"/>
        <item algoitem="longeur EST_DU_TYPE NOMBRE" code="1#NOMBRE#longeur"/>
        <item algoitem="i EST_DU_TYPE NOMBRE" code="1#NOMBRE#i"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="AFFICHER &quot;Veuillez entrer une phrase&quot;" code="4#Veuillez entrer une phrase#0"/>
        <item algoitem="LIRE phrase" code="2#phrase#pasliste"/>
        <item algoitem="longeur PREND_LA_VALEUR phrase.length" code="5#longeur#phrase.length#pasliste"/>
        <item algoitem="POUR i ALLANT_DE 0 A longeur - 1" code="12#i#0#longeur - 1">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="test PREND_LA_VALEUR phrase.substr(i,1)" code="5#test#phrase.substr(i,1)#pasliste"/>
            <item algoitem="envers PREND_LA_VALEUR test+envers" code="5#envers#test+envers#pasliste"/>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
        <item algoitem="AFFICHER envers" code="3#envers#0#pasliste"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>

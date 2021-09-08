<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="AFFICHER mamoyenne" texte=""/>
    <extension extnom="inactif"/>
    <fonction fctetat="inactif" fctcode=""/>
    <F2 F2etat="inactif" F2lignes="" F2para="" F2defaut=""/>
    <repere repetat="inactif" repcode="-10#10#-10#10#2#2"/>
    <param epaisseurLigne="2" arrondiAuto="vrai" totalBoucles="5000000" maxBoucle="500000" totalAffichages="1000" epaisseurPoint="2" nbDecimales="8"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="maliste EST_DU_TYPE LISTE" code="1#LISTE#maliste"/>
        <item algoitem="nb EST_DU_TYPE NOMBRE" code="1#NOMBRE#nb"/>
        <item algoitem="i EST_DU_TYPE NOMBRE" code="1#NOMBRE#i"/>
        <item algoitem="pluspetit EST_DU_TYPE NOMBRE" code="1#NOMBRE#pluspetit"/>
        <item algoitem="plusgrand EST_DU_TYPE NOMBRE" code="1#NOMBRE#plusgrand"/>
        <item algoitem="mamoyenne EST_DU_TYPE NOMBRE" code="1#NOMBRE#mamoyenne"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="AFFICHER &quot;Entrez le nombre d'éléments de votre liste&quot;" code="4#Entrez le nombre d'éléments de votre liste#1"/>
        <item algoitem="LIRE nb" code="2#nb#pasliste"/>
        <item algoitem="POUR i ALLANT_DE 0 A nb-1" code="12#i#0#nb-1">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="AFFICHER &quot;Entrez votre nombre&quot;" code="4#Entrez votre nombre#1"/>
            <item algoitem="LIRE maliste[i]" code="2#maliste#i"/>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
        <item algoitem="mamoyenne PREND_LA_VALEUR ALGOBOX_MOYENNE(maliste,0,nb-1)" code="5#mamoyenne#ALGOBOX_MOYENNE(maliste,0,nb-1)#pasliste"/>
        <item algoitem="pluspetit PREND_LA_VALEUR ALGOBOX_MINIMUM(maliste,0,nb-1)" code="5#pluspetit#ALGOBOX_MINIMUM(maliste,0,nb-1)#pasliste"/>
        <item algoitem="plusgrand PREND_LA_VALEUR ALGOBOX_MAXIMUM(maliste,0,nb-1)" code="5#plusgrand#ALGOBOX_MAXIMUM(maliste,0,nb-1)#pasliste"/>
        <item algoitem="AFFICHER &quot;Le plus petit nombre est : &quot;" code="4#Le plus petit nombre est : #0"/>
        <item algoitem="AFFICHER pluspetit" code="3#pluspetit#1#pasliste"/>
        <item algoitem="AFFICHER &quot;Le plus grand nombre est : &quot;" code="4#Le plus grand nombre est : #0"/>
        <item algoitem="AFFICHER plusgrand" code="3#plusgrand#1#pasliste"/>
        <item algoitem="AFFICHER &quot;La moyenne est : &quot;" code="4#La moyenne est : #0"/>
        <item algoitem="AFFICHER mamoyenne" code="3#mamoyenne#1#pasliste"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>

<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description texte="" courant="AFFICHER retour"/>
    <extension extnom="inactif"/>
    <fonction fctcode="" fctetat="inactif"/>
    <F2 F2lignes="" F2etat="inactif" F2defaut="" F2para=""/>
    <repere repetat="inactif" repcode="-10#10#-10#10#2#2"/>
    <param maxBoucle="500000" epaisseurLigne="2" nbDecimales="8" totalBoucles="5000000" epaisseurPoint="2" totalAffichages="1000" arrondiAuto="vrai"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="montableau EST_DU_TYPE LISTE" code="1#LISTE#montableau"/>
        <item algoitem="i EST_DU_TYPE NOMBRE" code="1#NOMBRE#i"/>
        <item algoitem="n EST_DU_TYPE NOMBRE" code="1#NOMBRE#n"/>
        <item algoitem="nb_saisi EST_DU_TYPE NOMBRE" code="1#NOMBRE#nb_saisi"/>
        <item algoitem="j EST_DU_TYPE NOMBRE" code="1#NOMBRE#j"/>
        <item algoitem="retour EST_DU_TYPE NOMBRE" code="1#NOMBRE#retour"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="i PREND_LA_VALEUR ALGOBOX_ALEA_ENT(0,30)" code="5#i#ALGOBOX_ALEA_ENT(0,30)#pasliste"/>
        <item algoitem="POUR n ALLANT_DE 0 A i" code="12#n#0#i">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="montableau[n] PREND_LA_VALEUR ALGOBOX_ALEA_ENT(0,100)" code="5#montableau#ALGOBOX_ALEA_ENT(0,100)#n"/>
            <item algoitem="AFFICHER montableau[n]" code="3#montableau#0#n"/>
            <item algoitem="AFFICHER &quot; &quot;" code="4# #0"/>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
        <item algoitem="AFFICHER &quot; &quot;" code="4# #1"/>
        <item algoitem="LIRE nb_saisi" code="2#nb_saisi#pasliste"/>
        <item algoitem="j PREND_LA_VALEUR 0" code="5#j#0#pasliste"/>
        <item algoitem="retour PREND_LA_VALEUR 0" code="5#retour#0#pasliste"/>
        <item algoitem="POUR j ALLANT_DE 0 A montableau.length-1" code="12#j#0#montableau.length-1">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="SI (montableau[j]==nb_saisi) ALORS" code="6#montableau[j]==nb_saisi">
                <item algoitem="DEBUT_SI" code="7#debutsi"/>
                <item algoitem="retour PREND_LA_VALEUR j" code="5#retour#j#pasliste"/>
                <item algoitem="FIN_SI" code="8#finsi"/>
            </item>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
        <item algoitem="AFFICHER retour" code="3#retour#0#pasliste"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>

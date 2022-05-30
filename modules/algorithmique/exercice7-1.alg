<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description texte="Première étape,  on ecrit l'algorithme qui correspond à notre future fonction.&#xa;Ici,  on veut faire une fonction qui crée un tableau de notes." courant="FIN_POUR"/>
    <extension extnom="inactif"/>
    <fonction fctcode="" fctetat="inactif"/>
    <F2 F2lignes="" F2etat="inactif" F2defaut="" F2para=""/>
    <repere repetat="inactif" repcode="-10#10#-10#10#2#2"/>
    <param maxBoucle="500000" epaisseurLigne="2" nbDecimales="8" totalBoucles="5000000" epaisseurPoint="2" totalAffichages="1000" arrondiAuto="vrai"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="notes EST_DU_TYPE LISTE" code="1#LISTE#notes"/>
        <item algoitem="nb_notes EST_DU_TYPE NOMBRE" code="1#NOMBRE#nb_notes"/>
        <item algoitem="i EST_DU_TYPE NOMBRE" code="1#NOMBRE#i"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="nb_notes PREND_LA_VALEUR ALGOBOX_ALEA_ENT(10,30)" code="5#nb_notes#ALGOBOX_ALEA_ENT(10,30)#pasliste"/>
        <item algoitem="POUR i ALLANT_DE 0 A nb_notes -1" code="12#i#0#nb_notes -1">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="notes[i] PREND_LA_VALEUR ALGOBOX_ALEA_ENT(0,20)" code="5#notes#ALGOBOX_ALEA_ENT(0,20)#i"/>
            <item algoitem="AFFICHER notes[i]" code="3#notes#0#i"/>
            <item algoitem="AFFICHER &quot; &quot;" code="4# #0"/>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>

CREATE TABLE `Types`
(
 `id_type` int NOT NULL ,
 `type`    varchar(45),

PRIMARY KEY (`id_type`)
);

CREATE TABLE `Pays`
(
 `id_pays` int NOT NULL ,
 `pays`    varchar(45) NOT NULL ,

PRIMARY KEY (`id_pays`)
);


CREATE TABLE `Inscrits`
(
 `id_inscrit`        int NOT NULL ,
 `nom`               varchar(45) NOT NULL ,
 `prenom`            varchar(45) NOT NULL ,
 `adresse`           text NOT NULL ,
 `telephone`         varchar(12) NOT NULL ,
 `mail`              varchar(45) NOT NULL ,
 `cotisation_a_jour` binary NOT NULL ,

PRIMARY KEY (`id_inscrit`)
);

CREATE TABLE `Auteurs`
(
 `id_auteur`      int NOT NULL ,
 `nom`            varchar(45) NOT NULL ,
 `id_pays`        int NOT NULL ,
 `prenom`         varchar(45) NOT NULL ,
 `date_naissance` date NOT NULL ,

PRIMARY KEY (`id_auteur`),
KEY `FK_34` (`id_pays`),
CONSTRAINT `FK_32` FOREIGN KEY `FK_34` (`id_pays`) REFERENCES `Pays` (`id_pays`)
);

CREATE TABLE `Livres`
(
 `id_livre`          int NOT NULL ,
 `titre`             varchar(45) NOT NULL ,
 `id_type`           int NOT NULL ,
 `annee_parution`    int NOT NULL ,
 `resume`            longtext NOT NULL ,
 `emplacement`       varchar(45) NOT NULL ,
 `nb_exemplaire`     int NOT NULL ,
 `reference`         varchar(45) NOT NULL ,
 `exemplaires_dispo` int NOT NULL ,

PRIMARY KEY (`id_livre`),
KEY `FK_21` (`id_type`),
CONSTRAINT `FK_19` FOREIGN KEY `FK_21` (`id_type`) REFERENCES `Types` (`id_type`)
);

CREATE TABLE `Livres_Auteurs`
(
 `id_auteur` int NOT NULL ,
 `id_livre`  int NOT NULL ,

KEY `FK_39` (`id_auteur`),
CONSTRAINT `FK_37` FOREIGN KEY `FK_39` (`id_auteur`) REFERENCES `Auteurs` (`id_auteur`),
KEY `FK_42` (`id_livre`),
CONSTRAINT `FK_40` FOREIGN KEY `FK_42` (`id_livre`) REFERENCES `Livres` (`id_livre`)
);

CREATE TABLE `Emprunts`
(
 `id_emprunt`       int NOT NULL ,
 `date_emprunt`     date NOT NULL ,
 `id_livre`         int NOT NULL ,
 `id_inscrit`       int NOT NULL ,
 `date_retour`      date NOT NULL ,
 `livre_rendu`      binary NOT NULL ,
 `date_livre_rendu` date NOT NULL ,
 `renouvellement`   binary NOT NULL ,

PRIMARY KEY (`id_emprunt`),
KEY `FK_61` (`id_inscrit`),
CONSTRAINT `FK_59` FOREIGN KEY `FK_61` (`id_inscrit`) REFERENCES `Inscrits` (`id_inscrit`),
KEY `FK_64` (`id_livre`),
CONSTRAINT `FK_62` FOREIGN KEY `FK_64` (`id_livre`) REFERENCES `Livres` (`id_livre`)
);

CREATE TABLE `Cotisations`
(
 `id_cotisation`   int NOT NULL ,
 `montant`         float NOT NULL ,
 `id_inscrit`      int NOT NULL ,
 `date_cotisation` date NOT NULL ,
 `date_paiement`   date NOT NULL ,

PRIMARY KEY (`id_cotisation`),
KEY `FK_72` (`id_inscrit`),
CONSTRAINT `FK_70` FOREIGN KEY `FK_72` (`id_inscrit`) REFERENCES `Inscrits` (`id_inscrit`)
);
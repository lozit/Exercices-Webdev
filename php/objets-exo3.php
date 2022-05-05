<?php

declare(strict_types=1);

class Personne
{
    private string $nom = '';
    private string $prenom = '';
    private string $adresse = '';

    public function __construct(string $nom, string $prenom, string $adresse)
    {
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->adresse = $adresse;
    }
    
    public function __destruct() {
        echo "<p>Destroying <em>".__CLASS__."</em></p";
    }
    
    public function getPersonne(): string
    {
        return "<p>Voici les coordonnées de $this->prenom $this->nom : $this->adresse</p>";
    }

    public function setAdresse(string $adresse)
    {
        $this->adresse = $adresse;
    }
}

$guillaume = new Personne("Ferrari", "Guillaume", "Avignon");
echo $guillaume->getPersonne();
$guillaume->setAdresse("L'isle sur la Sorgue");
echo $guillaume->getPersonne();




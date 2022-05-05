<?php

declare(strict_types=1);

class Ville
{
    private string $nom = '';
    private string $departement = '';

    public function __construct(string $nom, string $departement)
    {
        $this->nom = $nom;
        $this->departement = $departement;
    }
    
    public function afficherInfo(): string
    {
        return "la ville $this->nom est dans le département $this->departement";
    }
}

$maville = new Ville("Nice", "Alpes Maritimes");
echo $maville->afficherInfo();



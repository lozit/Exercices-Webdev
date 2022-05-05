<?php

declare(strict_types=1);

class Ville
{
    public string $nom = '';
    public string $departement = '';
    
    public function afficherInfo(): string {
        return "la ville $this->nom est dans le département $this->departement";
    }
}

$maville = new Ville;

$maville->nom = "Nice";
$maville->departement = "Alpes Maritimes";
echo $maville->afficherInfo();
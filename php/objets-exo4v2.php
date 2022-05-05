<?php

declare(strict_types=1);

class Form
{
    private string $formulaire = '';

    public function __construct(string $action, string $method, string $titre)
    {
        $this->formulaire = "<form action='$action' method='$method'>";
        $this->formulaire .= "<fieldset><legend>$titre</legend>";
    }
    
    public function __destruct() {
        echo "<p>Destroying <em>".__CLASS__."</em></p";
    }
    
    public function getForm(): string
    {
        return $this->formulaire."</form>";
    }

    public function setSubmit(string $value)
    {
        $this->formulaire .= "<p><input type='submit' value='$value'></p>";
    }

    public function setText(string $name, string $value, string $libelle)
    {
        $this->formulaire .= "<p><label for='$name'>$libelle</label> : <input type='text' id='$name' name='$name' placeholder='$value'></p>";
    }
}

$formulaire = new Form("test.php", "POST", "Mon Formulaire");
$formulaire->setText("nom", "Nom de famille", "Entrer votre nom");
$formulaire->setSubmit("envoyer");
$formulaire->setText("prenom", "Prénom", "Entrer votre prénom");
echo $formulaire->getForm();
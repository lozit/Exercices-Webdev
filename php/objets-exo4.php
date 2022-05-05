<?php

declare(strict_types=1);

class Form
{
    private string $header = '';
    private string $submit = '';
    private string $text = '';

    public function __construct(string $action, string $method, string $titre)
    {
        $this->header = "<form action='$action' method='$method'>";
        $this->header .= "<fieldset><legend><b>$titre</b></legend>";
    }
    
    public function __destruct() {
        echo "<p>Destroying <em>".__CLASS__."</em></p";
    }
    
    public function getForm(): string
    {
        return $this->header.$this->text.$this->submit."</form>";
    }

    public function setSubmit(string $value)
    {
        $this->submit = "<p><input type='submit' value='$value'></p>";
    }

    public function setText(string $name, string $value, string $libelle)
    {
        $this->text .= "<p><label for='$name'>$libelle</label> : <input type='text' id='$name' name='$name' placeholder='$value'></p>";
    }
}

$formulaire = new Form("test.php", "POST", "Mon Formulaire");
$formulaire->setSubmit("envoyer");
$formulaire->setText("nom", "Nom de famille", "Entrer votre nom");
echo $formulaire->getForm();
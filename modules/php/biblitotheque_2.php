<?php
$host = 'localhost';
$port = '8889';
$db   = 'bibliotheque';
$user = 'biblio';
$pass = 'biblio';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;port=$port;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];
try {
     $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
     throw new \PDOException($e->getMessage(), (int)$e->getCode());
}

if(isset($_POST['titre']) AND isset($_POST['auteur']) AND isset($_POST['parution'])){
  $sql = "INSERT INTO `livre` (`titre`, `auteur`, `date_publication`) VALUES (?, ?, ?)";
  $pdo->prepare($sql)->execute([$_POST['titre'], $_POST['auteur'], $_POST['parution']]);
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bibliothèque</title>
</head>
<body>
<form action="" method="post">
  <p>Titre : <input type="text" name="titre"></p>
  <p>Date de Parution : <input type="text" name="parution" value="2009-01-01"></p>
  <p>Auteur : <input type="text" name="auteur"></p>
  <p><input type="submit" name="send" value="Insérer"></p>
</form>
<table>

<tr>
 <th scope="col">Titre</th>
 <th scope="col">Auteur</th>
 <th scope="col">Publication</th>
 <th scope="col">Actions</th>
</tr>


<?php
$stmt = $pdo->query('SELECT * FROM `livre`');
foreach ($stmt as $row)
{
    echo '<tr><td><a href="afficher_livre.php?id='.$row['id'].'">'.$row['titre'].'</a></td><td>'.$row['auteur'].'</td><td>'.$row['date_publication'].'</td><td><a href="effacer_livre.php?id='.$row['id'].'">Effacer</a></td></tr>';
}
?>
</table>
</body>
</html>
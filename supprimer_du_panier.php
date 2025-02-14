<?php

// Initialise Twig
include('include/twig.php');
$twig = init_twig();

// Importe la fonction de connexion
include('include/connexion.php');
$pdo = connexion();

// Récupère les données POST : l'identifiant du vélo à supprimer
$id_velo = intval($_POST['id_velo']);

// Exécute la requête SQL pour supprimer le vélo du panier
$supprimer_du_panier = 
    'DELETE 
    FROM panier 
    WHERE id_velo = :id_velo';
$stmt = $pdo->prepare($supprimer_du_panier);
$stmt->bindParam(':id_velo', $id_velo, PDO::PARAM_INT);
$stmt->execute();

// Redirige vers la page du panier
header('Location: panier.php');
exit();
?>

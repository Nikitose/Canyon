<?php

// Initialise Twig
include('include/twig.php');
$twig = init_twig();

// Importe la fonction de connexion
include('include/connexion.php');
$pdo = connexion();

// Importe les fonctions pour les requêtes
include('include/select.php');

$id_velo = htmlspecialchars($_POST['id_velo'], ENT_QUOTES, 'UTF-8');

// Vérifie si le vélo est déjà dans le panier
$check_panier = 'SELECT COUNT(*) FROM panier WHERE id_velo = :id_velo';
$query = $pdo->prepare($check_panier);
$query->bindParam(':id_velo', $id_velo, PDO::PARAM_INT);
$query->execute();
$velo_exists = $query->fetchColumn();

if ($velo_exists == 0) {
    // Ajoute le vélo au panier si ce n'est pas déjà fait
    $ajouter_au_panier = 
        'INSERT 
        INTO panier (id_velo) 
        VALUES (:id_velo)';
    $query = $pdo->prepare($ajouter_au_panier);
    $query->bindParam(':id_velo', $id_velo, PDO::PARAM_INT);
    $query->execute();

    // Redirection vers la page du panier avec un message de succès
    header('Location: panier.php?message=ajout_succes');
    exit;
    
} else {
    // Redirection vers la page du panier avec un message d'erreur
    echo'<p>Le vélo est déjà dans le panier.</p>';
    exit;
}

?>

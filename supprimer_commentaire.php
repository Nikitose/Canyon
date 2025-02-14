<?php

// Initialise Twig
include('include/twig.php');
$twig = init_twig();

// Récupère les données GET placées sur l'URL : l'identifiant de la catégorie choisie
if (isset($_GET['id'])) $id = $_GET['id']; else $id = 0;
$id = intval($id);

// Importe la fonction de connexion
include('include/connexion.php');
$pdo = connexion();

// Importe les fonctions pour les requêtes
include('include/select.php');

// Requêtes SQL --> supprime 
$commentaire = select_ligne($pdo, $id,
    'SELECT *
    FROM commentaires
    WHERE id_commentaire = :id'
);
$id_commentaire = select_table_id($pdo, $id,
    'DELETE 
    FROM commentaires
    WHERE id_commentaire = :id'
);

header('Location: affiche_details_velos.php?id=' . $commentaire['id_velo'] );
exit();
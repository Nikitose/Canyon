<?php

// Initialise Twig
include('include/twig.php');
$twig = init_twig();

// Récupère les données GET placées sur l'URL
if (isset($_GET['id'])) $id = $_GET['id']; else $id = 0;
$id = intval($id);

// Importe la fonction de connexion
include('include/connexion.php');
$pdo = connexion();

// Importe les fonctions pour les requêtes
include('include/select.php');


// Requêtes SQL

// Importe ALL requêtes
include('include/base_requetes.php');
$la_nouveaute = select_table($pdo, 
    'SELECT * 
    FROM la_nouveaute'
);
$la_nouveaute_nom = select_table($pdo, 
    'SELECT nom_velo
    FROM velos
    WHERE id_velo = (SELECT id_velo FROM la_nouveaute)'
);
$affiche_nombre_velo_panier = select_table($pdo,
    'SELECT COUNT(id_article_panier) 
    AS affiche_nombre_velo_panier
    FROM panier;'
);

// Lancement du moteur Twig avec les données
echo $twig->render('accueil.twig', [
    'affiche_categories' => $affiche_categories,
    'affiche_sous_categories_all' => $affiche_sous_categories_all,
    'nouveau_velo' => $affiche_nouveau_velo,
    'promotion_velo' => $affiche_promotion_velo,
    'la_nouveaute' => $la_nouveaute,
    'la_nouveaute_nom' => $la_nouveaute_nom,
    'affiche_nombre_velo_panier' => $affiche_nombre_velo_panier,
    'style' => 'accueil',
]);
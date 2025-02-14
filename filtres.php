<?php

// Initialise Twig
include('include/twig.php');
$twig = init_twig();

// Récupère les données GET placées sur l'URL : l'identifiant de la catégorie choisie
if (isset($_GET['id'])) $id = $_GET['id']; else $id = 0;
$id = intval($id);

// Vérifie les filtres appliqués
$filtre = isset($_GET['filtre']) ? $_GET['filtre'] : [];
$prix_max = isset($_GET['prix_max']) ? intval($_GET['prix_max']) : null;
$prix_mois_max = isset($_GET['prix_mois_max']) ? intval($_GET['prix_mois_max']) : null;
$poids_max = isset($_GET['poids_max']) ? intval($_GET['poids_max']) : null;
$id_sous_categorie = isset($_GET['id_sous_categorie']) ? $_GET['id_sous_categorie'] : null;



// Importe la fonction de connexion
include('include/connexion.php');
$pdo = connexion();

// Importe les fonctions pour les requêtes
include('include/select.php');




// Requêtes SQL

// Importe ALL requêtes
include('include/base_requetes.php');

// Construire la requête SQL dynamiquement
$query = 'SELECT * FROM velos WHERE 1=1';


if (in_array('promotion', $filtre)) {
    $query .= ' AND prix_de_base != 0';
}
if (in_array('nouveau', $filtre)) {
    $query .= ' AND nouveau = "oui"';
}
if (!is_null($prix_max)) {
    $query .= ' AND prix < ' . $prix_max;
}
if (!is_null($prix_mois_max)) {
    $query .= ' AND prix_par_mois < ' . $prix_mois_max;
}
if (!is_null($poids_max)) {
    $query .= ' AND poids < ' . $poids_max;
}
if (in_array('electriques', $filtre)) {
    $query .= ' AND VAE != "non"';
}
if (in_array('classiques', $filtre)) {
    $query .= ' AND VAE = "non"';
}
if ($id_sous_categorie !== null && $id_sous_categorie !== '') {
    $query .= ' AND id_sous_categorie = ' . $id_sous_categorie;
}



// Exécuter la requête SQL
$velos = select_table($pdo, $query);

// Lancement du moteur Twig avec les données
echo $twig->render('filtres.twig', [
    'nouveau_velo' => $affiche_nouveau_velo,
    'promotion_velo' => $affiche_promotion_velo,
    'affiche_categories' => $affiche_categories,
    'affiche_sous_categories_all' => $affiche_sous_categories_all,
    'affiche_nombre_velo_panier' => $affiche_nombre_velo_panier,
    /***/
    'velos' => $velos,
    'filtre' => $filtre,
    'prix_max' => $prix_max,
    'prix_mois_max' => $prix_mois_max,
    'poids_max' => $poids_max,
    'id_sous_categorie' => $id_sous_categorie,
    'style' => 'filtres',
]);


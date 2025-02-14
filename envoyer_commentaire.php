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
 
// Recherche la liste des auteurs
$affiche_detail_velo = select_ligne($pdo, $id,
	'SELECT *
	FROM velos
	JOIN sous_categories ON velos.id_sous_categorie = sous_categories.id_sous_categorie
	WHERE id_velo = :id'
);
$affiche_commentaire = select_table_id($pdo, $id,
	'SELECT *
	FROM commentaires
	WHERE id_velo LIKE :id'
);

// Lancement du moteur Twig avec les données
echo $twig->render('envoyer_commentaire.twig', [
    'affiche_detail_velo' => $affiche_detail_velo,
	'affiche_commentaire' => $affiche_commentaire,
	'style' => 'envoyer_commentaire',
]);

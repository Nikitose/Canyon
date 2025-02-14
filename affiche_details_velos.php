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



// Requêtes SQL

// Importe ALL requêtes
include('include/base_requetes.php');

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
$affiche_moyenne_note = select_table_id($pdo, $id,
	'SELECT AVG(commentaires.note) as moy
	FROM commentaires
	WHERE id_velo LIKE :id'
);


// Lancement du moteur Twig avec les données
echo $twig->render('affiche_details_velos.twig', [
    'affiche_categories' => $affiche_categories,
    'affiche_sous_categories_all' => $affiche_sous_categories_all,
    'nouveau_velo' => $affiche_nouveau_velo,
    'promotion_velo' => $affiche_promotion_velo,
	'affiche_nombre_velo_panier' => $affiche_nombre_velo_panier,
	/***/
	'affiche_detail_velo' => $affiche_detail_velo,
	'affiche_commentaire' => $affiche_commentaire,
	'affiche_moyenne_note' => $affiche_moyenne_note[0]['moy'],
	'style' => 'affiche_details_velos',
]);

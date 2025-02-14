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
 
$affiche_sous_categories = select_table_id($pdo, $id,
	'SELECT *
	FROM sous_categories
	INNER JOIN lien_cat_sous_cat ON lien_cat_sous_cat.id_sous_categorie = sous_categories.id_sous_categorie
	WHERE id_categorie = :id'
);
$affiche_img_categories = select_table_id($pdo, $id,
    'SELECT *
    FROM categories
	WHERE id_categorie = :id'
);

// Lancement du moteur Twig avec les données
echo $twig->render('sous-categories.twig', [
	'nouveau_velo' => $affiche_nouveau_velo,
    'promotion_velo' => $affiche_promotion_velo,
	'affiche_categories' => $affiche_categories,
	'affiche_sous_categories_all' => $affiche_sous_categories_all,
	'affiche_nombre_velo_panier' => $affiche_nombre_velo_panier,
	/***/
    'affiche_sous_categories' => $affiche_sous_categories,
	'affiche_img_categories' => $affiche_img_categories,
	'style' => "sous_categories",
]);


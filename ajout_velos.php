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
$affiche_categories = select_table($pdo, 
    'SELECT * 
    FROM categories'
);
$affiche_sous_categories_all = select_table($pdo,
	'SELECT *
	FROM sous_categories'
);
$affiche_nouveau_velo = select_table($pdo, 
	'SELECT * 
	FROM velos
	WHERE nouveau LIKE "oui"'
);
$affiche_promotion_velo = select_table($pdo, 
	'SELECT * 
	FROM velos
	WHERE prix_de_base != 0'
);
$affiche_nombre_velo_panier = select_table($pdo,
    'SELECT COUNT(id_article_panier) 
    AS affiche_nombre_velo_panier
    FROM panier;'
);
/***/

// Lancement du moteur Twig avec les données
echo $twig->render('ajout_velos.twig', [
    'affiche_categories' => $affiche_categories,
    'affiche_sous_categories_all' => $affiche_sous_categories_all,
    'nouveau_velo' => $affiche_nouveau_velo,
    'promotion_velo' => $affiche_promotion_velo,
	'affiche_nombre_velo_panier' => $affiche_nombre_velo_panier,
	/***/
	'style' => 'ajout_velos',
]);

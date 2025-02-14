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
	'SELECT DISTINCT lien_cat_sous_cat.id_sous_categorie, nom_sous_categorie
	FROM sous_categories
	INNER JOIN lien_cat_sous_cat ON lien_cat_sous_cat.id_sous_categorie = sous_categories.id_sous_categorie
	WHERE id_categorie in (SELECT id_categorie FROM lien_cat_sous_cat WHERE id_sous_categorie = :id)'
);
$affiche_id_sous_categorie = select_ligne($pdo, $id,
	'SELECT *
	FROM velos
	WHERE id_sous_categorie = (SELECT id_sous_categorie FROM sous_categories WHERE id_sous_categorie = :id)'
);
$affiche_sous_categorie_actuelle = select_ligne($pdo, $id,
    'SELECT *
    FROM sous_categories 
    WHERE id_sous_categorie = :id'
);
$affiche_velo = select_table_id($pdo, $id,
	'SELECT velos.*, AVG(commentaires.note) AS moy_note
	FROM velos
	LEFT JOIN commentaires ON velos.id_velo = commentaires.id_velo
    WHERE velos.id_sous_categorie = :id
	GROUP BY commentaires.id_velo, velos.debatement, velos.prix, velos.nom_velo, velos.img_couleur_1, velos.taille, velos.VAE, velos.prix, velos.prix_de_base, velos.prix_par_mois, velos.type_debatement, velos.debatement, velos.poids, velos.Matériau, velos.nouveau, velos.description, velos.img_couleur_2, velos.texte_couleur_1, velos.texte_couleur_2
	ORDER BY velos.id_velo'
);

// Lancement du moteur Twig avec les données
echo $twig->render('affiche_velos_liste.twig', [
	'affiche_categories' => $affiche_categories,
	'affiche_sous_categories_all' => $affiche_sous_categories_all,
	'nouveau_velo' => $affiche_nouveau_velo,
    'promotion_velo' => $affiche_promotion_velo,
	'affiche_nombre_velo_panier' => $affiche_nombre_velo_panier,
	/***/
	'affiche_sous_categories' => $affiche_sous_categories,
	'affiche_id_sous_categorie' => $affiche_id_sous_categorie,
	'affiche_sous_categorie_actuelle' => $affiche_sous_categorie_actuelle,
    'affiche_velo' => $affiche_velo,
	'style' => 'affiche_velos_liste',
]);

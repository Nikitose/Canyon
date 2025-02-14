<?php

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


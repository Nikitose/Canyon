<?php

// Fonction de sécurisation des données reçues
function securiser($data) {
    $data = htmlspecialchars($data, ENT_QUOTES, 'UTF-8');
    return strip_tags($data);
}

// Vérifier si le formulaire a été soumis
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Initialisation des variables
    $nom_velo = isset($_POST['nom_velo']) ? securiser($_POST['nom_velo']) : '';
    $id_sous_categorie = isset($_POST['id_sous_categorie']) ? securiser($_POST['id_sous_categorie']) : '';
    $img_couleur_1 = isset($_POST['img_couleur_1']) ? securiser($_POST['img_couleur_1']) : '';
    $taille = isset($_POST['taille']) ? securiser($_POST['taille']) : '';
    $VAE = isset($_POST['VAE']) ? securiser($_POST['VAE']) : '';
    $prix = isset($_POST['prix']) ? securiser($_POST['prix']) : '';
    $prix_de_base = isset($_POST['prix_de_base']) ? securiser($_POST['prix_de_base']) : '';
    $prix_par_mois = isset($_POST['prix_par_mois']) ? securiser($_POST['prix_par_mois']) : '';
    $type_debatement = isset($_POST['type_debatement']) ? securiser($_POST['type_debatement']) : '';
    $debatement = isset($_POST['debatement']) ? securiser($_POST['debatement']) : '';
    $poids = isset($_POST['poids']) ? securiser($_POST['poids']) : '';
    $materiau = isset($_POST['Matériau']) ? securiser($_POST['Matériau']) : '';
    $nouveau = isset($_POST['nouveau']) ? securiser($_POST['nouveau']) : '';
    $description = isset($_POST['description']) ? securiser($_POST['description']) : '';
    $img_couleur_2 = isset($_POST['img_couleur_2']) ? securiser($_POST['img_couleur_2']) : '';
    $texte_couleur_1 = isset($_POST['texte_couleur_1']) ? securiser($_POST['texte_couleur_1']) : '';
    $texte_couleur_2 = isset($_POST['texte_couleur_2']) ? securiser($_POST['texte_couleur_2']) : '';

    // Insertion des données dans la base de données
    include('include/connexion.php');
    $pdo = connexion();

    // Insertion des données dans la base de données
    $stmt = $pdo->prepare('INSERT INTO velos (nom_velo, id_sous_categorie, img_couleur_1, taille, VAE, prix, prix_de_base, prix_par_mois, type_debatement, debatement, poids, Matériau, nouveau, description, img_couleur_2, texte_couleur_1, texte_couleur_2) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');
    if ($stmt->execute([$nom_velo, $id_sous_categorie, $img_couleur_1, $taille, $VAE, $prix, $prix_de_base, $prix_par_mois, $type_debatement, $debatement, $poids, $materiau, $nouveau, $description, $img_couleur_2, $texte_couleur_1, $texte_couleur_2])) {
        echo "<p>Vélo ajouté avec succès.</p>";
        exit;

        // Rediriger vers une page de confirmation ou la liste des vélos
        header('Location: ajout_velos.php');
        exit;
        
    } else {
        echo "Erreur lors de l'insertion des données : " . $stmt->errorInfo()[2];
    }
}

?>

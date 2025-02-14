<?php

// Fonction de sécurisation des données reçues
function securiser($data) {
    $data = htmlspecialchars($data, ENT_QUOTES, 'UTF-8');
    return strip_tags($data);
}

include('include/connexion.php');
$pdo = connexion();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Initialisation des variables
    $id_commentaire = isset($_POST['id_commentaire']) ? securiser($_POST['id_commentaire']) : '';
    $text = isset($_POST['text']) ? securiser($_POST['text']) : '';
    $note = isset($_POST['note']) ? securiser($_POST['note']) : '';

    // Vérification et filtrage des données reçues
    $message = '';

    if (empty($id_commentaire)) {
        $message = 'aucune valeur reçue pour id_commentaire';
    } elseif (!is_numeric($id_commentaire)) {
        $message = 'id_commentaire doit être un nombre';
    } elseif (empty($text)) {
        $message = 'aucune valeur reçue pour texte';
    } elseif (empty($note)) {
        $message = 'aucune valeur reçue pour note';
    } elseif (!is_numeric($note)) {
        $message = 'note doit être un nombre';
    }

    if (empty($message)) {
        // Mise à jour dans la base de données si les données sont valides
        $sql = 'UPDATE commentaires SET texte = :texte, note = :note WHERE id_commentaire = :id_commentaire';
        $query = $pdo->prepare($sql);
        $query->bindParam(':id_commentaire', $id_commentaire, PDO::PARAM_INT);
        $query->bindParam(':texte', $text, PDO::PARAM_STR);
        $query->bindParam(':note', $note, PDO::PARAM_INT);
        $query->execute();

        // Redirection
        header('Location: ' . $_SERVER['HTTP_REFERER'] . '?commentaire_modifie=true');
        exit;
    } else {
        // Affichage du message d'erreur
        echo '<p>' . $message . '</p>';
    }
}
?>

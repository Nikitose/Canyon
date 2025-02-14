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
    $id_velo = isset($_POST['id_velo']) ? securiser($_POST['id_velo']) : '';
    $text = isset($_POST['text']) ? securiser($_POST['text']) : '';
    $note = isset($_POST['note']) ? securiser($_POST['note']) : '';

    // Vérification et filtrage des données reçues
    $message = '';

    if (empty($id_velo)) {
        $message = 'aucune valeur reçue pour id_velo';
    } elseif (!is_numeric($id_velo)) {
        $message = 'id_velo doit être un nombre';
    } elseif (empty($text)) {
        $message = 'aucune valeur reçue pour texte';
    } elseif (empty($note)) {
        $message = 'aucune valeur reçue pour note';
    } elseif (!is_numeric($note)) {
        $message = 'note doit être un nombre';
    }

    if (empty($message)) {
        // Insertion dans la base de données si les données sont valides
        $sql = 'INSERT INTO commentaires (id_velo, texte, note) VALUES (:id_velo, :texte, :note)';
        $query = $pdo->prepare($sql);
        $query->bindParam(':id_velo', $id_velo, PDO::PARAM_INT);
        $query->bindParam(':texte', $text, PDO::PARAM_STR);
        $query->bindParam(':note', $note, PDO::PARAM_INT);
        $query->execute();

        // Redirection
        header('Location: ' . $_SERVER['HTTP_REFERER'] . '?commentaire_poste=true');
        exit;
        
    } else {
        // Affichage du message d'erreur
        echo '<p>' . $message . '</p>';
    }
}
?>

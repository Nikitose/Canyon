/***IMG-NAV***/
const img = document.querySelector('.img-header');
const logo = document.querySelector('.logo-nav');

window.addEventListener('scroll', function() {
    if (window.scrollY > 50) {
        logo.style.width = '350px';
        img.style.opacity = '1';
    } 
    else {
        logo.style.width = '420px'; 
        img.style.opacity = '0';
    }
    img.style.transition = 'opacity 0.3s'; 
});



/***DIPARITION/APPARITION-HEADER***/
window.addEventListener('scroll', function() {
    var header = document.querySelector('header');
    if (window.scrollY > 150) {
        header.classList.add('disparait');
    } else {
        header.classList.remove('disparait');
    }
});


//MENU-BURGER
document.addEventListener('DOMContentLoaded', function() {
    // Sélectionnez le bouton burger
    const burgerButton = document.querySelector('.section_header_un button');

    // Sélectionnez la section à afficher
    const nav1_2 = document.querySelector('.section_header_deux-2');

    // Ajoutez un écouteur d'événements au bouton burger
    burgerButton.addEventListener('click', function() {
        // Basculez la classe 'hidden' pour afficher/masquer la section
        nav1_2.classList.toggle('hidden');
    });
});


//ACTIVER MODIFICATION
function activerModification(element) {
    // Rendre le champ de texte modifiable
    var champTexte = element.parentElement.previousElementSibling;
    champTexte.removeAttribute('readonly');

    // Rendre le champ de note modifiable
    var champNote = element.parentElement.previousElementSibling.previousElementSibling.querySelector('.affiche_note_commentaire');
    champNote.removeAttribute('readonly');

    // Ajouter une classe pour le style CSS
    champTexte.classList.add('editable');
    champNote.classList.add('editable');

    // Afficher le bouton "re-envoyer"
    var boutonReEnvoyer = element.nextElementSibling.nextElementSibling;
    boutonReEnvoyer.style.display = 'block';
}

// Ajouter un événement clic à tous les liens de classe "modifier"
document.querySelectorAll('.modifier').forEach(function(element) {
    element.addEventListener('click', function(event) {
        event.preventDefault(); // Empêcher le lien de déclencher sa fonctionnalité par défaut
        activerModification(element);
    });
});


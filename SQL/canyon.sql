-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 02 juin 2024 à 16:35
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `canyon`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id_categorie` int(11) UNSIGNED NOT NULL,
  `nom_categorie` varchar(255) NOT NULL,
  `img_categorie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id_categorie`, `nom_categorie`, `img_categorie`) VALUES
(1, 'Vélos de Route', 'images/Route/categorie_route.jpg'),
(2, 'Vélos électriques', 'images/velo_electriques/categorie_velo_electrique.jpg'),
(3, 'VTT', 'images/VTT/categorie_VTT.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE `commentaires` (
  `id_commentaire` int(10) UNSIGNED NOT NULL,
  `id_velo` int(11) UNSIGNED NOT NULL,
  `texte` text NOT NULL,
  `note` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commentaires`
--

INSERT INTO `commentaires` (`id_commentaire`, `id_velo`, `texte`, `note`) VALUES
(28, 23, 'trop ce vélo', 5),
(53, 23, 'cool', 4),
(64, 13, 'Le vélo est incroyable, mais la batterie dure un peut moins de temps  que écrit sur le site, à part cela le vélo est très bien.', 5),
(66, 1, 'trop cool', 5),
(67, 6, 'bien, mais pas incroyable', 4),
(68, 11, 'trop cher', 2),
(69, 15, 'nickel pour rouler en ville', 5),
(70, 19, 'nickel', 5),
(71, 21, 'le couleur : incroyable ', 5),
(72, 1, 'bof', 4),
(73, 11, 'pas fou', 3),
(74, 15, 'bien', 4),
(75, 19, 'bien, bien', 4),
(76, 27, 'bouuu', 5),
(77, 27, 'cool', 4),
(78, 32, 'la couleur orage, trop !', 5),
(79, 32, 'cool', 4),
(80, 34, 'trop cher', 2),
(81, 34, 'pas ouf', 3),
(82, 48, 'aaaah', 4);

-- --------------------------------------------------------

--
-- Structure de la table `la_nouveaute`
--

CREATE TABLE `la_nouveaute` (
  `id_velo` int(11) UNSIGNED NOT NULL,
  `suspension_arriere` varchar(255) NOT NULL,
  `suspension_avant` varchar(255) NOT NULL,
  `cadre` varchar(255) NOT NULL,
  `vitesse` varchar(255) NOT NULL,
  `roues` varchar(255) NOT NULL,
  `couleurs` varchar(255) NOT NULL,
  `photo_1` varchar(255) NOT NULL,
  `photo_2` varchar(255) NOT NULL,
  `photo_3` varchar(255) NOT NULL,
  `photo_4` varchar(255) NOT NULL,
  `photo_5` varchar(255) NOT NULL,
  `photo_6` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `la_nouveaute`
--

INSERT INTO `la_nouveaute` (`id_velo`, `suspension_arriere`, `suspension_avant`, `cadre`, `vitesse`, `roues`, `couleurs`, `photo_1`, `photo_2`, `photo_3`, `photo_4`, `photo_5`, `photo_6`) VALUES
(23, 'images/La_nouveaute/technique/suspension_arriere.jpg', 'images/La_nouveaute/technique/suspension_avant.jpg', 'images/La_nouveaute/technique/cadre.jpg', 'images/La_nouveaute/technique/vitesse.jpg', 'images/La_nouveaute/technique/roues.jpg', 'images/La_nouveaute/technique/couleurs.jpg', 'images/La_nouveaute/photo/photo_1.jpg', 'images/La_nouveaute/photo/photo_2.jpg', 'images/La_nouveaute/photo/photo_3.jpg', 'images/La_nouveaute/photo/photo_4.jpg', 'images/La_nouveaute/photo/photo_5.jpg', 'images/La_nouveaute/photo/photo_6.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `lien_cat_sous_cat`
--

CREATE TABLE `lien_cat_sous_cat` (
  `id_categorie` int(11) UNSIGNED NOT NULL,
  `id_sous_categorie` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `lien_cat_sous_cat`
--

INSERT INTO `lien_cat_sous_cat` (`id_categorie`, `id_sous_categorie`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id_article_panier` int(11) UNSIGNED NOT NULL,
  `id_velo` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id_article_panier`, `id_velo`) VALUES
(48, 21),
(35, 23);

-- --------------------------------------------------------

--
-- Structure de la table `sous_categories`
--

CREATE TABLE `sous_categories` (
  `id_sous_categorie` int(10) UNSIGNED NOT NULL,
  `nom_sous_categorie` varchar(255) NOT NULL,
  `img_sous_categorie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sous_categories`
--

INSERT INTO `sous_categories` (`id_sous_categorie`, `nom_sous_categorie`, `img_sous_categorie`) VALUES
(1, 'Cyclo-cross', 'images/Route/Cyclo-cross/sous_categorie_Cyclo-cross.jpg'),
(2, 'Endurance', 'images/Route/Endurance/sous_categorie_Endurance.jpg'),
(3, 'Triathlon', 'images/Route/Triathlon/sous_categorie_Triathlon.jpg'),
(4, 'Route', 'images/velo_electriques/Route/sous_categorie_route.jpg'),
(5, 'Ville', 'images/velo_electriques/Ville/sous_categorie_ville.jpg'),
(6, 'VTTAE', 'images/velo_electriques/VTTAE/sous_categorie_VTTAE.jpg'),
(7, 'DH', 'images/VTT/DH/sous_categorie_DH.jpg'),
(8, 'Dirt Jump', 'images/VTT/Dirt_Jump_Street_Bikes/sous_categorie_Dirt_Jump_Street_Bikes.jpg'),
(9, 'Enduro', 'images/VTT/Enduro/sous_categorie_enduro.jpg'),
(10, 'Trail', 'images/VTT/Trail/sous_categorie_trail.jpg'),
(11, 'Youth MTB', 'images/VTT/Youth_MTB/sous_categorie_ville.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `velos`
--

CREATE TABLE `velos` (
  `id_velo` int(11) UNSIGNED NOT NULL,
  `id_sous_categorie` int(11) UNSIGNED NOT NULL,
  `nom_velo` varchar(255) NOT NULL,
  `img_couleur_1` varchar(255) NOT NULL,
  `taille` varchar(255) NOT NULL,
  `VAE` varchar(255) NOT NULL,
  `prix` int(11) NOT NULL,
  `prix_de_base` int(11) NOT NULL,
  `prix_par_mois` double(8,2) NOT NULL,
  `type_debatement` varchar(255) NOT NULL,
  `debatement` int(11) NOT NULL,
  `poids` float NOT NULL,
  `Matériau` varchar(255) NOT NULL,
  `nouveau` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `img_couleur_2` varchar(255) NOT NULL,
  `texte_couleur_1` varchar(255) NOT NULL,
  `texte_couleur_2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `velos`
--

INSERT INTO `velos` (`id_velo`, `id_sous_categorie`, `nom_velo`, `img_couleur_1`, `taille`, `VAE`, `prix`, `prix_de_base`, `prix_par_mois`, `type_debatement`, `debatement`, `poids`, `Matériau`, `nouveau`, `description`, `img_couleur_2`, `texte_couleur_1`, `texte_couleur_2`) VALUES
(1, 1, 'Inflite CF SL 6', 'images/Route/Cyclo-cross/Inflite_CF_SL_6.jpg', 'M/L/XL', 'non', 2499, 0, 416.50, 'non', 0, 8.86, 'Carbone (CF)', 'non', 'L’entrée dans la gamme cyclocross carbone de Canyon possède les mêmes caractéristiques de cadre que le haut de gamme Inflite CF SL et des spécifications imbattables à ce prix. Le meilleur départ pour un coureur ambitieux.', '', '', ''),
(2, 1, 'Inflite CF SLX 8 Di2', 'images/Route/Cyclo-cross/Inflite_CF_SLX_8_Di2.jpg', 'M/L/XL', 'non', 5549, 0, 924.83, 'non', 0, 7.74, 'Carbone (CF)', 'non', 'Éprouvé sur les parcours CX les plus difficiles, l’Inflite CF SLX 8 Di2 est équipé de roues DT Swiss haut de gamme et du dernier changement de vitesse électronique Ultegra Di2 12 vitesses de Shimano, pour créer un vélo destiné pour la course et conçu pour donner un avantage', '', '', ''),
(3, 1, 'Inflite CFR AXS', 'images/Route/Cyclo-cross/Inflite_CFR_AXS.jpg', 'S/M/L/XL', 'non', 7549, 0, 1258.17, 'non', 0, 7.38, 'Carbone (CFR)', 'non', 'Une superbe esthétique, des performances au plus haut niveau. Doté d’un cadre spécifique pour la course et d’un cockpit sans câble apparent, l’Inflite CFR associe une ingénierie éprouvée en course avec un changement de vitesse sans fil SRAM Red et des roues en carbone haut', '', '', ''),
(4, 2, 'Endurace 6', 'images/Route/Endurance/Endurace_6.jpg', 'XS/S/M/L/XL', 'non', 1399, 0, 233.17, 'non', 0, 9.64, 'Aluminium (AL)', 'non', 'Avec le dernier groupe Tiagra pour un changement de vitesse précis, une légèreté de pointe et la géométrie décontractée caractéristique de l’Endurace, ce vélo d’endurance en aluminium est conçu pour tenir la distance.', '', '', ''),
(5, 2, 'Endurace 7', 'images/Route/Endurance/Endurace_7/velo_couleur_1.jpg\r\n', 'XS/S/M/L/XL', 'non', 1499, 0, 249.83, 'non', 0, 9.2, 'Aluminium (AL)', 'non', 'Un vélo d\'endurance polyvalent en aluminium avec une géométrie orientée vers le confort et le contrôle supplémentaire des freins à disque. Construit autour du cadre Endurace de dernière génération, ce vélo avale kilomètre après kilomètre lors des randonnées de toute', 'images/Route/Endurance/Endurace_7/velo_couleur_2.jpg', 'images/Route/Endurance/Endurace_7/texte_couleur_1.jpg', 'images/Route/Endurance/Endurace_7/texte_couleur_2.jpg'),
(6, 2, 'Endurace CF SLX 7 AXS', 'images/Route/Endurance/Endurace_CF_SLX_7_AXS/velo_couleur_1.jpg\r\n', 'M/L/XL', 'non', 4049, 0, 674.83, 'non', 0, 8.7, 'Carbone (CF)', 'oui', 'Trouvez l\'équilibre entre confort, vitesse et contrôle lors de vos plus longues sorties sur route. L\'Endurace est un vélo de route moderne qui est prêt à tout. Sur n\'importe quelle route.', 'images/Route/Endurance/Endurace_CF_SLX_7_AXS/velo_couleur_2.jpg\r\n', 'images/Route/Endurance/Endurace_CF_SLX_7_AXS/texte_couleur_1.jpg', 'images/Route/Endurance/Endurace_CF_SLX_7_AXS/texte_couleur_2.jpg'),
(7, 2, 'Endurace CFR Flash', 'images/Route/Endurance/Endurace_CFR_Flash.jpg\r\n', 'L/XL', 'non', 9599, 0, 1599.83, 'non', 0, 7.44, 'Carbone (CFR)', 'non', 'L\'une des vélos d\'endurance les plus rapides et les plus efficaces de tous les temps. Des performances inspirées du World Tour, une innovation avancée en matière de confort, une finition de cadre haut de gamme  : bienvenue au niveau supérieur des sorties d’endurance.', '', '', ''),
(9, 3, 'Speedmax CF 7', 'images/Route/Triathlon/Speedmax_CF_7.jpg\r\n', 'M/L/XL', 'non', 4049, 0, 674.83, 'non', 0, 9.62, 'Carbone (CF)', 'non', 'Héritant de l\'ADN de conception de pointe du Speedmax CFR, le Speedmax CF offre une vitesse et une adaptabilité exceptionnelles grâce à son aérodynamisme avancé, à ses roues en carbone aérodynamiques et à son ajustement hautement réglable.', '', '', ''),
(10, 3, 'Speedmax CF SLX 8 AXS 1by', 'images/Route/Triathlon/Speedmax_CF_SLX_8_AXS_1by.jpg', 'M/L/XL', 'non', 8849, 0, 1474.83, 'non', 0, 9.44, 'Carbone (CF)', 'non', 'Rapide, aérodynamique et confortable : nous avons développé le Speedmax pour répondre aux exigences des meilleurs triathlètes du monde. Ajustez parfaitement votre vélo et élevez vos PR à un tout autre niveau.', '', '', ''),
(11, 3, 'Speedmax CFR Di2', 'images/Route/Triathlon/Speedmax_CFR_Di2/velo_couleur_1.jpg', 'M/L/XL', 'non', 11099, 0, 1849.83, 'non', 0, 9.1, 'Carbone (CF)', 'oui', 'Le nouveau Speedmax CFR s\'impose comme référence dans la catégorie des vélos de triathlon en termes de possibilités de réglage, d\'aérodynamisme, d\'intégration et de confort. Son cadre léger est équipé des meilleurs composants disponibles. Il ne vous reste plus qu\'à vous', 'images/Route/Triathlon/Speedmax_CFR_Di2/velo_couleur_2.jpg', 'images/Route/Triathlon/Speedmax_CFR_Di2/texte_couleur_1.jpg', 'images/Route/Triathlon/Speedmax_CFR_Di2/texte_couleur_2.jpg'),
(12, 4, 'Roadlite ON 5', 'images/velo_electriques/Route/Roadlite_ON_5.jpg', 'M/L/XL', 'oui', 2499, 2999, 416.50, 'non', 0, 16.3, 'Aluminium (AL)', 'non', 'Avec un design élégant, une maniabilité précise et un moteur de pointe FAZUA RIDE 60, propulsez vos entraînements à un niveau supérieur. Le parfait point d’entrée dans la nouvelle catégorie des VAE hybrides.', '', '', ''),
(13, 4, 'Roadlite ON CF 9 LTD', 'images/velo_electriques/Route/Roadlite_ON_CF_9_LTD.jpg', 'L/XL', 'oui', 5049, 0, 1009.80, 'non', 0, 14.45, 'Carbon (CF)', 'oui', 'Élégant, agile et époustouflant : le Roadlite:ON CF 9 LTD est conçu pour votre style de vie dynamique. Qu\'il s\'agisse d\'une séance d\'entraînement, d\'un repas à emporter ou d\'une sortie en soirée pour décompresser, vous attendrez chaque sortie avec impatience.', '', '', ''),
(14, 5, 'Commuter ON 7', 'images/velo_electriques/Ville/Commuter_ON_7.jpg', 'S/M/L/XL', 'oui', 3549, 0, 591.50, 'non', 0, 18.26, 'Aluminium (AL)', 'non', 'Assez léger pour monter dans le train. Assez puissant pour vous amener au bureau. Equipé pour de la conduite urbaine. Optez pour un mode de déplacement plus écologique, plus rapide et plus agréable avec le Commuter:ON 7.', '', '', ''),
(15, 5, 'Precede ON Comfort 5', 'images/velo_electriques/Ville/Precede_ON_Comfort_5/velo_couleur_1.jpg', 'L/XL', 'oui', 2999, 0, 499.83, 'non', 0, 25.74, 'Aluminium (AL)', 'non', 'Profitez de fonctionnalités pratiques pour rouler en ville sans vous ruiner avec le Precede:ON Comfort 5. Avec un design conçu pour rendre vos voyages plus agréables que jamais, ce vélo offre une taille de cadre unique, une position de conduite détendue et un ajustement simple.', 'images/velo_electriques/Ville/Precede_ON_Comfort_5/velo_couleur_2.jpg', 'images/velo_electriques/Ville/Precede_ON_Comfort_5/texte_couleur_1.jpg', 'images/velo_electriques/Ville/Precede_ON_Comfort_5/texte_couleur_2.jpg'),
(16, 6, 'Neuron ON 6', 'images/velo_electriques/VTTAE/Neuron_ON_6/velo_couleur_1.jpg', 'M/L/XL', 'oui', 3849, 0, 641.50, 'hydraulique', 130, 24.6, 'Aluminium (AL)', 'non', 'Parcourez plus de sentiers avec un moteur Shimano puissant, un cadre en aluminium robuste, une géométrie optimisée pour les sentiers et un débattement de 120/130 mm. Le Neuron:ON 6 possède une grande autonomie.', 'images/velo_electriques/VTTAE/Neuron_ON_6/velo_couleur_2.jpg', 'images/velo_electriques/VTTAE/Neuron_ON_6/texte_couleur_1.jpg', 'images/velo_electriques/VTTAE/Neuron_ON_6/texte_couleur_2.jpg'),
(17, 6, 'Neuron ONfly CF 7', 'images/velo_electriques/VTTAE/Neuron_ONfly_CF_7/velo_couleur_1.jpg', 'L/XL', 'oui', 4899, 0, 816.50, 'hydraulique', 140, 20.3, 'Carbone (CF)', 'non', 'Le Neuron:ONfly CF 7 rend encore plus accessibles les performances des VTTAE all-mountain en carbone rapides, confortables et agiles. Propulsé par Bosch et équipé de pièces fiables de chez Shimano, SRAM et RockShox.', 'images/velo_electriques/VTTAE/Neuron_ONfly_CF_7/velo_couleur_2.jpg', 'images/velo_electriques/VTTAE/Neuron_ONfly_CF_7/texte_couleur_1.jpg', 'images/velo_electriques/VTTAE/Neuron_ONfly_CF_7/texte_couleur_2.jpg'),
(18, 6, 'Neuron ONfly CF 9', 'images/velo_electriques/VTTAE/Neuron_ONfly_CF_9.jpg', 'L/XL', 'oui', 7049, 0, 1174.83, 'hydraulique', 140, 19.9, 'Carbone (CF)', 'non', 'Donnez un coup de boost à vos aventures sur les sentiers avec un incroyable VTTAE all-mountain en carbone. Efficace, ludique et confortable, le Neuron:ONfly CF 9 est équipé d’un moteur Bosch compact et de composants haut de gamme de chez SRAM, RockShox et DT Swiss.', '', '', ''),
(19, 6, 'Strive ON CFR LTD', '	\r\nimages/velo_electriques/VTTAE/Strive_ON_CFR_LTD.jpg', 'S/M/L/XL', 'oui', 8049, 9049, 1341.50, 'hydraulique', 170, 23.1, 'Carbon (CF)', 'oui', 'Conçu en collaboration avec les meilleurs coureurs du monde, ce véhicule de course établit la barre de ce que peut être un VTT électrique Enduro. Partez sur les sentiers les plus difficiles, avec la puissance instantanée du moteur Bosch CX Race.', '', '', ''),
(20, 6, 'Torque ON 7', '	\r\nimages/velo_electriques/VTTAE/Torque_ON_7.jpg', 'L/XL', 'oui', 4039, 5049, 673.17, 'hydraulique', 180, 24.08, 'Aluminium (AL)', 'non', 'Pas de navette ? Aucun problème. La puissance de l\'assistance du Torque:ON 7 vous permet de parcourir plus de kilomètres en un rien de temps. C\'est un vélo de freeride durable prêt à affronter les pistes les plus accidentées.', '', '', ''),
(21, 6, 'Torque ON CF 9', 'images/velo_electriques/VTTAE/Torque_ON_CF_9/velo_couleur_1.jpg', 'M/L/XL', 'oui', 6749, 7549, 1124.83, 'hydraulique', 180, 24.6, 'Carbone (CF)', 'oui', 'Améliorez vos sauts, surmontez les obstacles et remontez encore plus haut grâce à la batterie à longue autonomie et à la maniabilité freeride du Torque:ON CF 9.', 'images/velo_electriques/VTTAE/Torque_ON_CF_9/velo_couleur_2.jpg', 'images/velo_electriques/VTTAE/Torque_ON_CF_9/texte_couleur_1.jpg', 'images/velo_electriques/VTTAE/Torque_ON_CF_9/texte_couleur_2.jpg'),
(22, 7, 'Sender CFR 29', 'images/VTT/DH/Sender_CFR_29/velo_couleur_1.jpg', 'M/L/XL', 'non', 6349, 0, 1058.17, 'hydraulique et hélicoïdale', 203, 17, 'Carbone(CFR)', 'non', 'Éprouvé en coupe du monde dans des sections difficiles, sur d\'énormes lignes de freeride ou encore dans des descentes abruptes. Lorsque les choses deviennent rapides et techniques, passez la ligne d’arrivée en un temps record avec le Sender CFR.', 'images/VTT/DH/Sender_CFR_29/velo_couleur_2.jpg', 'images/VTT/DH/Sender_CFR_29/texte_couleur_1.jpg', 'images/VTT/DH/Sender_CFR_29/texte_couleur_2.jpg'),
(23, 7, 'Sender CFR 29 LTD', 'images/VTT/DH/Sender_CFR_29_LTD/velo_couleur_1.jpg', 'M/L/XL', 'non', 6049, 0, 1008.17, 'hydraulique et hélicoïdale', 200, 17.04, 'Carbone(CFR)', 'oui', 'Le Sender CFR LTD est une pure machine de course de descente. Axé sur la vitesse, la vitesse et encore la vitesse, c\'est le vélo idéal pour atteindre la première marche du podium. Sa conception performante haut de gamme et son cadre léger vous permettront d\'avoir les meilleures performances.', 'images/VTT/DH/Sender_CFR_29_LTD/velo_couleur_2.jpg', 'images/VTT/DH/Sender_CFR_29_LTD/texte_couleur_1.jpg', 'images/VTT/DH/Sender_CFR_29_LTD/texte_couleur_2.jpg'),
(24, 7, 'Sender CFR 29 Underdog', 'images/VTT/DH/Sender_CFR_29_Underdog.jpg', 'L/XL', 'non', 4549, 0, 758.17, 'hydraulique et hélicoïdale', 203, 17.38, 'Carbone(CFR)', 'non', 'C\'est un outsider qu\'il ne faut pas sous-estimer. Pour viser une trajectoire parfaite ou pour gagner des secondes sur la piste, le Sender CFR est idéal pour la compétition.', '', '', ''),
(25, 7, 'Sender CFR Mullet LTD', 'images/VTT/DH/Sender_CFR_Mullet_LTD.jpg', 'M/L/XL', 'non', 6549, 0, 1091.50, 'hydraulique et hélicoïdale', 200, 16.65, 'Carbone(CFR)', 'non', 'Qu\'obtient-on lorsque les ingénieurs de renommée mondiale de Canyon mettent tout en œuvre pour concevoir le meilleur VTT de compétition de DH ? Le Sender CFR. Conçu pour affronter les parcours de DH les plus exigeants du monde.', '', '', ''),
(26, 8, 'Stitched 360', 'images/VTT/Dirt_Jump_Street_Bikes/Stitched_360.jpg', 'S/M/L', 'non', 999, 0, 166.50, 'hydraulique', 100, 12.2, 'Aluminium (AL)', 'non', 'Grâce au Stitched 360, accumulez les tours de pump track ou apprenez de nouvelles figures de dirt. Utilisé par certains des meilleurs freeriders du monde, il est prêt à tout.', '', '', ''),
(27, 8, 'Stitched CFR Trial', 'images/VTT/Dirt_Jump_Street_Bikes/Stitched_CFR_Trial/velo_couleur_1.jpg\r\n', 'M/L', 'non', 2499, 0, 416.50, 'non', 0, 9.95, 'Carbon (CFR)', 'oui', 'Déchirez la ville avec ce vélo de trial inspiré de Fabio Wibmer. Également disponible avec une illustration signée en collaboration avec Tomomi Nishikubo. Le Stitched CFR Trial établit une nouvelle référence avec son cadre en carbone très robuste, son design moderne et les composants emblématiques de Fabio.', 'images/VTT/Dirt_Jump_Street_Bikes/Stitched_CFR_Trial/velo_couleur_2.jpg', 'images/VTT/Dirt_Jump_Street_Bikes/Stitched_CFR_Trial/texte_couleur_1.jpg', 'images/VTT/Dirt_Jump_Street_Bikes/Stitched_CFR_Trial/texte_couleur_2.jpg'),
(28, 9, 'Strive_CFR', 'images/VTT/Enduro/Strive_CFR.jpg', 'M/L/XL', 'non', 6049, 0, 1008.17, 'hydraulique', 170, 15.94, 'Carbone(CFR)', 'non', 'Vous recherchez un vélo durable et super léger conçu pour remporter des courses d\'enduro ? Vous venez juste de le trouver. Atteignez le niveau supérieur avec le Strive CFR et sa technologie de changement de vitesse SRAM nouvelle génération.', '', '', ''),
(29, 9, 'Strive CFR LTD', 'images/VTT/Enduro/Strive_CFR_LTD.jpg', 'S/M/L/XL', 'non', 7049, 0, 1174.83, 'hydraulique', 170, 16, 'Carbone (CFR)', 'non', 'Basé sur les vélos utilisés par les athlètes professionnels de Canyon, le Strive CFR LTD a fait l\'objet de toutes les attentions. Des caractéristiques haut de gamme. Un cadre de renommée mondiale. Le meilleur groupe de SRAM. Le meilleur du meilleur.', '', '', ''),
(30, 9, 'Torque 29 CF 8', 'images/VTT/Enduro/Torque_29_CF_8/velo_couleur_1.jpg', 'M/L/XL', 'non', 4849, 0, 808.17, 'hydraulique', 170, 16.22, 'Carbone (CF)', 'non', 'Un VTT pour les bike parks ou les pistes d\'enduro ? Le nouveau Torque CF 8 est idéal pour tout grâce à une géométrie polyvalente, hautement réglable, et des configurations de roues Mullet ou 29.', 'images/VTT/Enduro/Torque_29_CF_8/velo_couleur_2.jpg', 'images/VTT/Enduro/Torque_29_CF_8/texte_couleur_1.jpg', 'images/VTT/Enduro/Torque_29_CF_8/texte_couleur_2.jpg'),
(31, 9, 'Torque Mullet AL 7', 'images/VTT/Enduro/Torque_Mullet_AL_7/velo_couleur_1.jpg', 'L/XL', 'non', 3249, 0, 541.50, 'hydraulique', 170, 16.38, 'Aluminium (AL)', 'non', 'Enchaînez les pistes en bike park sur le Canyon Torque 7. Le cadre en aluminium robuste a été conçu spécifiquement pour être utilisé dans les plus gros sauts. Combiné à une conception robuste et fiable.', 'images/VTT/Enduro/Torque_Mullet_AL_7/velo_couleur_2.jpg', 'images/VTT/Enduro/Torque_Mullet_AL_7/texte_couleur_1.jpg', 'images/VTT/Enduro/Torque_Mullet_AL_7/texte_couleur_2.jpg'),
(32, 9, 'Torque Mullet CF 7', 'images/VTT/Enduro/Torque_Mullet_CF_7/velo_couleur_1.jpg', 'S/M/L/XL', 'non', 3749, 4049, 624.83, 'hydraulique', 170, 15.6, 'Carbone (CF)', 'oui', 'Notre meilleur VTT de freeride vient de passer à la vitesse supérieure. Le nouveau Torque CF 7 est disponible en 29\" ou en configuration Mullet. Il est prêt à se lancer sur les grosses sessions en bike park et dans les descentes techniques rapides.', 'images/VTT/Enduro/Torque_Mullet_CF_7/velo_couleur_2.jpg', 'images/VTT/Enduro/Torque_Mullet_CF_7/texte_couleur_1.jpg', 'images/VTT/Enduro/Torque_Mullet_CF_7/texte_couleur_2.jpg'),
(33, 2, 'Endurace CFR WRL', 'images/Route/Endurance/Endurace_CFR_WRL.jpg\r\n', 'M/L/XL', 'non', 9599, 0, 5199.83, 'non', 0, 7.44, 'Carbone (CFR)', 'non', 'Des composants Campagnolo haut de gamme. Une référence en matière de rapport rigidité/poids. Un confort incroyable. Un coloris unique. L\'Endurace CFR WRL est un vélo d\'endurance de renommée mondiale dans tous les sens du terme.', '', '', ''),
(34, 10, 'Exceed CF SLX MVDP', 'images/VTT/Trail/Exceed_CF_SLX_MVDP.jpg', 'S/M/L/XL', 'non', 4039, 5049, 1010.00, 'hydraulique', 100, 9.39, 'Carbon (CF)', 'oui', 'Inspiré par la superstar Mathieu van der Poel, chaque centimètre de cette édition spéciale Exceed respire la classe pure et la vitesse totale. Avec la marque exclusive MVDP et les meilleurs composants du marché.', '', '', ''),
(35, 10, 'Grand Canyon 5', 'images/VTT/Trail/Grand_Canyon_5.jpg', 'XS/S/M/L', 'non', 799, 899, 133.17, 'hydraulique', 100, 14.3, 'Aluminium (AL)', 'non', 'Développez vos aventures urbaines sur les sentiers en toute confiance grâce à la géométrie équilibrée, aux composants sûrs et à la suspension confortable de 100 mm du Grand Canyon 5.', '', '', ''),
(36, 10, 'Grand Canyon 8', 'images/VTT/Trail/Grand_Canyon_8.jpg', 'S/M/L/XL', 'non', 1499, 0, 249.83, 'hydraulique', 120, 13.94, 'Aluminium (AL)', 'non', 'Restez à l\'aise et gardez le contrôle pendant plusieurs kilomètres sur ce semi-rigide polyvalent grâce à une fourche de 120 mm de débattement, un cadre moderne en aluminium et une tige de selle télescopique.', '', '', ''),
(46, 11, 'Exceed CF Young Hero', 'images/VTT/Youth_MTB/Exceed_CF_Young_Hero.jpg', 'XS', 'non', 1599, 0, 266.50, 'hydraulique', 100, 12.04, 'Carbone (CF)', 'non', 'Un semi-rigide en carbone avec suspension de 100 mm, idéal pour les petits tours rapides et pour développer les compétences de base en all-mountain. Avec le même cadre que la version adulte, mais dans un modèle spécialement conçu pour les jeunes.', '', '', ''),
(47, 11, 'Lux World Cup CF Young Hero', 'images/VTT/Youth_MTB/Lux_World_Cup_CF_Young_Hero.jpg', 'XS', 'non', 2499, 0, 416.50, 'hydraulique', 100, 12.94, 'Carbone (CF)', 'non', '100mm of full suspension, cross-country performance and a proven World Cup heritage, all in an ultralight carbon frame. The LUX World Cup Young Hero is packed with clever features, ideal for the next generation of all-round cyclists.', '', '', ''),
(48, 11, 'Neuron Young Hero', 'images/VTT/Youth_MTB/Neuron_Young_Hero.jpg', '2XS/XS/S', 'non', 1599, 1699, 266.50, 'hydraulique', 130, 13.5, 'Aluminium (AL)', 'non', 'Petit cadre, grandes performances ! En taille 2XS et XS, le design du Neuron Young Hero conçu spécialement pour les enfants offre tout ce dont votre petit rider a besoin pour attaquer les sentiers.', '', '', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`id_commentaire`),
  ADD KEY `commentaires_id_velo_index` (`id_velo`),
  ADD KEY `id_velo` (`id_velo`);

--
-- Index pour la table `la_nouveaute`
--
ALTER TABLE `la_nouveaute`
  ADD KEY `id_velo` (`id_velo`);

--
-- Index pour la table `lien_cat_sous_cat`
--
ALTER TABLE `lien_cat_sous_cat`
  ADD PRIMARY KEY (`id_categorie`,`id_sous_categorie`),
  ADD KEY `id_categorie` (`id_categorie`),
  ADD KEY `id_sous_categorie` (`id_sous_categorie`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id_article_panier`),
  ADD KEY `id_velo` (`id_velo`);

--
-- Index pour la table `sous_categories`
--
ALTER TABLE `sous_categories`
  ADD PRIMARY KEY (`id_sous_categorie`);

--
-- Index pour la table `velos`
--
ALTER TABLE `velos`
  ADD PRIMARY KEY (`id_velo`),
  ADD KEY `velos_id_sous_categorie_index` (`id_sous_categorie`),
  ADD KEY `id_velo` (`id_velo`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categorie` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `id_commentaire` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id_article_panier` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT pour la table `sous_categories`
--
ALTER TABLE `sous_categories`
  MODIFY `id_sous_categorie` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `velos`
--
ALTER TABLE `velos`
  MODIFY `id_velo` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `commentaires_ibfk_1` FOREIGN KEY (`id_velo`) REFERENCES `velos` (`id_velo`);

--
-- Contraintes pour la table `la_nouveaute`
--
ALTER TABLE `la_nouveaute`
  ADD CONSTRAINT `la_nouveaute_ibfk_1` FOREIGN KEY (`id_velo`) REFERENCES `velos` (`id_velo`);

--
-- Contraintes pour la table `lien_cat_sous_cat`
--
ALTER TABLE `lien_cat_sous_cat`
  ADD CONSTRAINT `lien_cat_sous_cat_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `lien_cat_sous_cat_ibfk_2` FOREIGN KEY (`id_sous_categorie`) REFERENCES `sous_categories` (`id_sous_categorie`);

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`id_velo`) REFERENCES `velos` (`id_velo`);

--
-- Contraintes pour la table `velos`
--
ALTER TABLE `velos`
  ADD CONSTRAINT `velos_ibfk_1` FOREIGN KEY (`id_sous_categorie`) REFERENCES `sous_categories` (`id_sous_categorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

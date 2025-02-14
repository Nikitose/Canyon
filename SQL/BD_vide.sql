CREATE TABLE `commentaires`(
    `id_commentaire` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_velo` INT NOT NULL,
    `text` TEXT NOT NULL,
    `note` INT NOT NULL
);
ALTER TABLE
    `commentaires` ADD INDEX `commentaires_id_velo_index`(`id_velo`);
CREATE TABLE `categories`(
    `id_categorie` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nom_categorie` VARCHAR(255) NOT NULL
);
CREATE TABLE `velos`(
    `id_velo` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_sous_categorie` BIGINT NOT NULL,
    `nom_velo` VARCHAR(255) NOT NULL,
    `img` VARCHAR(255) NOT NULL,
    `taille` VARCHAR(255) NOT NULL,
    `VAE` VARCHAR(255) NOT NULL,
    `prix` INT NOT NULL,
    `prix_de_base` INT NOT NULL,
    `prix_par_mois` DOUBLE(8, 2) NOT NULL,
    `type_debatement` VARCHAR(255) NOT NULL,
    `debatement` INT NOT NULL,
    `poids` INT NOT NULL,
    `Matériau` VARCHAR(255) NOT NULL,
    `nouveau` BIGINT NOT NULL
);
ALTER TABLE
    `velos` ADD INDEX `velos_id_sous_categorie_index`(`id_sous_categorie`);
CREATE TABLE `sous_categories`(
    `id_sous_categorie` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_categorie` INT NOT NULL,
    `nom_sous_categorie` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `sous_categories` ADD INDEX `sous_categories_id_categorie_index`(`id_categorie`);
ALTER TABLE
    `sous_categories` ADD CONSTRAINT `sous_categories_id_categorie_foreign` FOREIGN KEY(`id_categorie`) REFERENCES `categories`(`id_categorie`);
ALTER TABLE
    `commentaires` ADD CONSTRAINT `commentaires_id_velo_foreign` FOREIGN KEY(`id_velo`) REFERENCES `velos`(`id_velo`);
ALTER TABLE
    `velos` ADD CONSTRAINT `velos_id_sous_categorie_foreign` FOREIGN KEY(`id_sous_categorie`) REFERENCES `sous_categories`(`id_sous_categorie`);
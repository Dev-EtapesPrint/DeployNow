# Documentation de l'API

## Base de donnée

```sql
-- -------------------------------
-- Paramètres de la session
-- -------------------------------
ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- -------------------------------
-- Structure de la table `utilisateur`
-- -------------------------------
DROP TABLE IF EXISTS `utilisateur`; 
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- -------------------------------
-- Structure de la table `boutique`
-- -------------------------------
DROP TABLE IF EXISTS `boutique`;
CREATE TABLE IF NOT EXISTS `boutique` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `code_postal` varchar(255) DEFAULT NULL,
  `pays` varchar(255) DEFAULT NULL,
  `devise` varchar(255) DEFAULT NULL,
  `langue` varchar(255) DEFAULT NULL,
  `fuseau_horaire` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- -------------------------------
-- Structure de la table `boutique_utilisateur`
-- -------------------------------
DROP TABLE IF EXISTS `boutique_utilisateur`;
CREATE TABLE IF NOT EXISTS `boutique_utilisateur` (
    `boutique_id` int(11) NOT NULL,
    `utilisateur_id` int(11) NOT NULL,
    `role` enum('admin','utilisateur') DEFAULT NULL,
    PRIMARY KEY (`boutique_id`,`utilisateur_id`),
    KEY `utilisateur_id` (`utilisateur_id`)
);

-- -------------------------------
-- Ajout des contraintes pour la table `boutique_utilisateur`
-- -------------------------------
ALTER TABLE `boutique_utilisateur`
    ADD CONSTRAINT `fk_boutique` FOREIGN KEY (`boutique_id`) REFERENCES `boutique` (`id`),
    ADD CONSTRAINT `fk_utilisateur` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);
```

- `ENGINE=InnoDB`: Ceci spécifie le moteur de stockage utilisé pour la table. InnoDB est un choix populaire pour sa fiabilité et sa prise en charge des transactions.
- `DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci`: Définit le jeu de caractères et le collationnement utilisés pour stocker et comparer les données textuelles dans la table. `utf8mb3` est un jeu de caractères courant qui prend en charge une large gamme de langues. `utf8mb3_general_ci` est un collationnement insensible à la casse.

## Appels API

|             | GET               | POST              | PUT                  | DELETE                  |
| ----------- | ----------------- | ----------------- | -------------------- | ----------------------- |
| Utilisateur | GET /utilisateurs | POST /utilisateur | PUT /utilisateur/:id | DELETE /utilisateur/:id |
| Boutique    | GET /boutiques    | POST /boutique    | PUT /boutique/:id    | DELETE /boutique/:id    |

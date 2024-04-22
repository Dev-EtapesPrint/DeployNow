-- --------------------------------------------------------
-- Structure de la base de données pour la table `boutique`
-- --------------------------------------------------------
SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
    time_zone = "+00:00";

-- --------------------------------------------------------
-- Structure de la table `boutique`
-- --------------------------------------------------------
DROP TABLE IF EXISTS `boutique`;

CREATE TABLE
    IF NOT EXISTS `boutique` (
        `id` int (11) DEFAULT NULL,
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
        `fuseau_horaire` varchar(255) DEFAULT NULL
    ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- --------------------------------------------------------
-- Structure de la table `boutique_utilisateur`
-- --------------------------------------------------------
DROP TABLE IF EXISTS `boutique_utilisateur`;

CREATE TABLE
    IF NOT EXISTS `boutique_utilisateur` (
        `boutique_id` int (11) NOT NULL,
        `utilisateur_id` int (11) NOT NULL,
        `role` enum ('admin', 'utilisateur') DEFAULT NULL,
        PRIMARY KEY (`boutique_id`, `utilisateur_id`),
        KEY `utilisateur_id` (`utilisateur_id`)
    ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- --------------------------------------------------------
-- Structure de la table `utilisateur`
-- --------------------------------------------------------
DROP TABLE IF EXISTS `utilisateur`;

CREATE TABLE
    IF NOT EXISTS `utilisateur` (
        `id` int (11) NOT NULL,
        `email` varchar(255) DEFAULT NULL,
        `mot_de_passe` varchar(255) DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = MyISAM DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_general_ci;

COMMIT;
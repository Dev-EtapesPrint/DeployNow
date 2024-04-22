# DeployNow

DeployNow est une application web qui permet de déployer une boutique wordpress spéciale EtapesPrint avec les informations de la nouvelle boutique en configuration.

## Caractéristiques

```mermaid
gitGraph
    commit id: "Initial commit" tag: "v0.0"
    branch documentation
    commit id: "wip-doc"
    checkout main
    merge documentation
```

### Pages

- Page de connexion
- Page de suivi
  - Liste des boutiques
  - Détails d'une boutique
- Page de gestion des boutiques
  - Ajout
  - Modification
  - Suppression
- Page de gestion des utilisateurs
  - Ajout
  - Modification
  - Suppression

```mermaid
graph TD
    A[Page de connexion] --> B{Authentification}
    B -->|Succès| C[Page de suivi]
    B -->|Échec| A
    C --> D{Action}
    D -->|Liste des boutiques| E[Liste des boutiques]
    E -->|Détails d'une boutique| F[Détails d'une boutique]
    D -->|Gestion des boutiques| G[Gestion des boutiques]
    G -->|Ajout| H[Ajout]
    G -->|Modification| I[Modification]
    G -->|Suppression| J[Suppression]
    D -->|Gestion des utilisateurs| K[Gestion des utilisateurs]
    K -->|Ajout| L[Ajout]
    K -->|Modification| M[Modification]
    K -->|Suppression| N[Suppression]
```

### Base de données

```mermaid
classDiagram
    Boutique -- Utilisateur_Boutique
    Utilisateur -- Utilisateur_Boutique

    class Boutique{
        + Int id
        + String nom
        + String url
        + String email
        + String telephone
        + String adresse
        + String ville
        + String code_postal
        + String pays
        + String devise
        + String langue
        + String fuseau_horaire
    }
    class Utilisateur {
        + Int id
        + String email
        + String mot_de_passe
    }
    class Utilisateur_Boutique {
        + Int id
        + Int id_utilisateur
        + Int id_boutique
    }
```

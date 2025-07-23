# fahoubo_dossou_rodrigue_gl

A new Flutter project.

## Getting Started




lib/
├── main.dart
├── models/
│   └── contact.dart
├── pages/
│   ├── form_page.dart
│   └── contact_list_page.dart
# Carnet de Contacts

Une application mobile simple développée avec Flutter pour la gestion de contacts. Elle permet d'ajouter, de visualiser, de modifier et de supprimer des contacts.

## 📱 Captures d'écran (Exemples)

<table>
  <tr>
    <td align="center"><strong>Page d'ajout de contact</strong></td>
    <td align="center"><strong>Liste des contacts</strong></td>
  </tr>
  <tr>
    <td><img src="" alt="Formulaire d'ajout" width="250"/></td>
    <td><img src="" alt="Liste des contacts" width="250"/></td>
  </tr>
</table>

> **Note :** Vous pouvez remplacer les `src=""` vides par des liens vers vos propres captures d'écran.

## ✨ Fonctionnalités

- **Ajouter un contact :** Un formulaire simple pour enregistrer un nom, des prénoms et un numéro de téléphone.
- **Valider les entrées :** Le formulaire vérifie que les champs ne sont pas vides et que le numéro de téléphone a une longueur valide.
- **Lister les contacts :** Affiche tous les contacts enregistrés dans une liste claire et lisible.
- **Modifier un contact :** Permet de mettre à jour les informations d'un contact existant via une boîte de dialogue.
- **Supprimer un contact :** Retire un contact de la liste.

## ⚠️ Limitations actuelles

Les contacts sont stockés en mémoire dans une liste. Cela signifie que **toutes les données seront perdues lorsque vous fermerez et redémarrerez l'application**. Pour une persistance des données, une base de données locale (comme `sqflite`) ou une solution de stockage cloud serait nécessaire.

## 🚀 Démarrage

Suivez ces instructions pour obtenir une copie du projet et l'exécuter sur votre machine locale à des fins de développement et de test.

### Prérequis

Assurez-vous d'avoir le SDK Flutter installé sur votre machine.

### Installation

1. Clonez le dépôt sur votre machine :
   ```sh
   git clone <URL_DE_VOTRE_DEPOT_GIT>
   ```

2. Naviguez vers le répertoire du projet :
   ```sh
   cd app_mobile_de_contact
   ```

3. Installez les dépendances :
   ```sh
   flutter pub get
   ```

4. Lancez l'application :
   ```sh
   flutter run
   ```

## 📂 Structure du projet

```
lib/
├── models/
│   └── contact.dart      # Définit le modèle de données pour un Contact.
├── pages/
│   ├── form_page.dart    # Page contenant le formulaire pour ajouter un contact.
│   └── contact_list_page.dart # Page affichant la liste des contacts.
└── main.dart             # Point d'entrée de l'application.
```


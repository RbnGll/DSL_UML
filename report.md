# Travail réalisé

Pour comprendre l'utilisation du projet, vous pouvez aller voir la documentation directement sur le fichier *README.md*.

## [Grammaire](https://gitlab.insa-rennes.fr/Regis.Graptin/dsl-uml/-/blob/master/org.xtext.example.mydsl.parent/org.xtext.example.mydsl/src/org/xtext/example/mydsl/Uml.xtext)

- Définition de l'ensemble des types d'objets (*Class*, *Interface*, *Abstract Class*, *Enum*)
- Définition des fonctions (visibilité, type de retour, nom, paramètres)
- Définition des paramètres (visibilité, type, nom)
- Ajout de mot-clés possible : *final*, *static*, *abstract*(uniquement pour les classes abstraites)
- Définition des différentes relations possibles (implémentation, héritage, association)
- Définition du package (pour regrouper les classes dans un même package)

_Auteurs: Brieg Daniel, Régis Graptin_

## [Générateur](https://gitlab.insa-rennes.fr/Regis.Graptin/dsl-uml/-/blob/master/org.xtext.example.mydsl.parent/org.xtext.example.mydsl/src/org/xtext/example/mydsl/generator/UmlGenerator.xtend)

## [Validation](https://gitlab.insa-rennes.fr/Regis.Graptin/dsl-uml/-/blob/master/org.xtext.example.mydsl.parent/org.xtext.example.mydsl/src/org/xtext/example/mydsl/validation/UmlValidator.java)

Vérifie que :
- les noms des classes et interfaces commencent avec une majuscule
- les identifiants des éléments d'un énumerateur soient tout en majuscules
- aucune classe ou interface aient un nom identique
- les attributs d'une classe aient des identifiants différents
- les fonctions d'une classe ou d'une interface ne soient pas redondantes selon leur nom et leurs paramètres
- lors d'un lien entre classe (héritage, association, etc.), les deux classes aient bien été instanciées

_Auteur: Robin Guill_

## [Outline](https://gitlab.insa-rennes.fr/Regis.Graptin/dsl-uml/-/blob/master/org.xtext.example.mydsl.parent/org.xtext.example.mydsl.ui/src/org/xtext/example/mydsl/ui/outline/UmlOutlineTreeProvider.java)

Customisation de la outline.
- Utilisation des noms des éléments correspondants (utilisation des noms des classes, du nom de l'énumération...)
- Utilisation d'un style pour les classes abstraites et les interfaces.
- Mise en place d'une couleur spécifique en fonction de la visibilité des paramètres (privée, public...).
- Affiche pour chaque fonction, la liste des paramètres utilisés.
- Affiche les différentes relations avec le nom des objets impliqués.

_Auteur: Régis Graptin_

## [Quickfixes](https://gitlab.insa-rennes.fr/Regis.Graptin/dsl-uml/-/blob/master/org.xtext.example.mydsl.parent/org.xtext.example.mydsl.ui/src/org/xtext/example/mydsl/ui/quickfix/UmlQuickfixProvider.java)

Produit une proposition de modification lorsque: 
- le nom d'une classe ou d'une interface ne commence pas par une majuscule et propose de passer cette première lettre en majuscule
- l'identifiant d'une valeur d'un énumerateur n'est pas tout en majuscule et propose de le passer tout en majuscule
- le contenu d'une classe n'est pas rempli et propose de le générer
- le contenu d'une interface n'est pas rempli et propose de le générer
- l'entier d'un lien est négatif et propose de le passer en positif
- une classe d'un lien n'est pas instancié et propose de la générer

_Auteur: Robin Guill_

## [Tests](https://gitlab.insa-rennes.fr/Regis.Graptin/dsl-uml/-/tree/master/org.xtext.example.mydsl.parent/org.xtext.example.mydsl.tests/src/org/xtext/example/mydsl/tests)

### Tests sur le parsing

Tests unitaires sur le bon déroulement du parsing.

_Auteurs: Brieg Daniel, Régis Graptin, Robin Guill_

### Tests sur le générateur
### Tests sur le validateur

Test unitaire sur la bonne validation du validateur

_Auteur: Robin Guill_
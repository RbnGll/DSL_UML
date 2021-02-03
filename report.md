# Travail réalisé

## [Grammaire](https://gitlab.insa-rennes.fr/Regis.Graptin/dsl-uml/-/blob/master/org.xtext.example.mydsl.parent/org.xtext.example.mydsl/src/org/xtext/example/mydsl/Uml.xtext)

## [Générateur](https://gitlab.insa-rennes.fr/Regis.Graptin/dsl-uml/-/blob/master/org.xtext.example.mydsl.parent/org.xtext.example.mydsl/src/org/xtext/example/mydsl/generator/UmlGenerator.xtend)

## [Validation](https://gitlab.insa-rennes.fr/Regis.Graptin/dsl-uml/-/blob/master/org.xtext.example.mydsl.parent/org.xtext.example.mydsl/src/org/xtext/example/mydsl/validation/UmlValidator.java)

Vérifie que :
- les noms des classes et interfaces commencent avec une majuscule
- les éléments des énumareteurs sont tout en majuscule
- aucune classe ou interface aient un nom identique
- les attributs d'une classe aient des identifiants différents
- les fonctions d'une classe ou d'une interface ne soient pas redondantes selon leur nom et leurs paramètres
- lors d'un lien entre classe (héritage, association, etc.), les deux classes aient bien été instanciées

Auteur: Robin Guill

## [Outline](https://gitlab.insa-rennes.fr/Regis.Graptin/dsl-uml/-/blob/master/org.xtext.example.mydsl.parent/org.xtext.example.mydsl.ui/src/org/xtext/example/mydsl/ui/outline/UmlOutlineTreeProvider.java)

## [Quickfixes](https://gitlab.insa-rennes.fr/Regis.Graptin/dsl-uml/-/blob/master/org.xtext.example.mydsl.parent/org.xtext.example.mydsl.ui/src/org/xtext/example/mydsl/ui/quickfix/UmlQuickfixProvider.java)

## [Tests](hhttps://gitlab.insa-rennes.fr/Regis.Graptin/dsl-uml/-/tree/master/org.xtext.example.mydsl.parent/org.xtext.example.mydsl.tests/src/org/xtext/example/mydsl/tests)
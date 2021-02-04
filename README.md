# Projet DSL 

Implémentation d'un langage simplifié permettant la génération de code dans un langage plus complexe. Ici, notre service propose pour l'instant du java.


## Déclaration des classes

Pour déclarer des classes, il vous suffit de le déclarer avec le mot-clé 'class'.
Une class classique requière l'utilisation de deux balises à savoir :
- 'attribute' : permettant de définir les attributs de ma classe.
- 'function' : permettant de définir les fonctions utilisées par ma classe.


```
class EmptyClass {
	attribute {}
	function {}
}
```

### Déclaration des attributs

Vous aurez ensuite la possibilité de définir des attributs ainsi que des fonctions.
Concernant les attributs, vous devez définir :
La visibilité de la variable (voir note plus bas), le type de la variable et le nom de la variable.
Vous avez aussi la possibilité de rajouter les mot-clé 'static' et 'final'.
(voir exemple ci-dessous)

### Déclaration des fonctions

Pour la déclaration des fonctions, vous devrez déclarer la visibilité de la fonction, le type de retour, le nom de la fonction et les différents paramètres entre parenthèses.

```
class Test {
	attribute {
		+ int a;
		- String b;
		# static int ;
		~ final String v;
	}
	function {
		+ void generate();
		# int multipleParams(int a, int b);
		+ Test();
	}
}
```


### Visibilité

Pour la visibilité, 4 niveaux sont disponibles :
- '-' : privé
- '#' : protégé
- '+' : public
- '~' : package

### Classe abstraite

Pour déclarer une classe abstraite, il vous suffit d'ajouter le mot-clé 'abstract' avant le mot 'class'. De même, vous aurez aussi la possibilité de définir des fonctions abstraites en rajoutant le mot-clé 'abstract'.

```
abstract class Abstraction {
	attribute {
		- String name;
	}
	function {
		# abstract int elementaire();
		+ String hello();
	}
}
```

### Les interfaces

Pour la création d'une interface, vous pouvez utiliser le mot-clé 'interface'.
Ici, seul l'élément 'function' sera disponible.

```
interface Union {
	function {
		+ boolean union(int a);
		- boolean test();
	}
}
```

### Les énumérations

Déclaration d'une énumération avec le mot-clé 'enum'. Dans le corps de l'énumération, seule la déclaration des noms est disponible.

```
enum Enumeration {
	VALUE;
	NONE;
}
```


## Les relations entre les objets

Il est possible d'exprimer des relations entre les différentes classes.


### L'héritage

Une classe hérite d'une autre.

```
extends(Parent, Child);
```

### L'implémentation 

Une classe implémente une autre.

```
implements(Union, Test);
```

### L'association 

Une association entre deux classes. Ici, on précise les deux classes affectés par la relation. Puis, nous précisons le nom de la relation ainsi que les quantités.

```
association(Class1, Class2, nameRelation, 1, 2);
```


### Association forte

On peut préciser une association forte entre deux classes.

```
strongAssociation(Class1, Class2, 2);
```


## Package
Définition d'un package.

```
package NomDuPackage {
	Class1,
	Class2
}
```




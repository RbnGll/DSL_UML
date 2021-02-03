# Projet DSL 

Implémentation d'un langage qui traduit en langage plus complexe, ici le java.




## Déclaration des classes

Pour déclarer des classes, il vous suffit de le déclarer avaec le mot clé 'class'.
Une class classique requière l'utilisation de deux balises à savoir :
- 'attribute' : permettant de définir les attributs de ma classe.
- 'function': permettant de définir les fonctions utilisés par ma classe.


```
class EmptyClass {
	attribute {}
	function {}
}
```

### Déclaration des attributs

Vous aurez ensuite la possibilité de définir des attributs ainsi que des fonctions.
Concernant les attributs, vous devez définir : 
la visibilité de la variable, le type de la variable et le nom de la variable.
Vous avez aussi la possibilité de rajouté les mot clé 'static' et 'final'.
(voir exemple ci-dessous)

### Déclaration des fonctions


Pour la déclaration des fonctions, vous devrez déclarer la visibilité de la fonction, le type de retour, le nom de la fonction et les différents paramètres entre parenthèse.


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
- '#' : protected
- '~' : package
- '+' : public

### Classe abstraite

Pour déclarer une classe abstraite, il vous suffit d'ajouter le mot clé 'abstract' avant le mot 'class'. De même, vous aurez aussi la possibilité de définir des functions abstraites en rajoutant le mot clé 'abstract'.

```
abstract class Abstraction {
	attribute {
		- String name;
	}
	function {
		~ abstract int elementaire();
		+ String hello();
	}
}
```

### Interface

Pour la création d'une interface, vous pouvez utiliser le mot clé 'interface'. 
Ici, seul l'élement 'function' sera disponible

```
interface Union {
	function {
		+ boolean union(int a);
		- boolean test();
	}
}
```


## Les relations entre les objets


### L'héritage

L'héritage entre deux classes s'éxprime par : 

```
extends(Parent, Child);
```

### L'association 


```
association(Class1, Class2, nameRelation, 10, 20);
```


### Association forte
```
strongAssociation(Class1, Class2, 20);
```


## Package
Définition d'un package.

```
package NomDuPackage {
	Class1,
	Class2
}
```





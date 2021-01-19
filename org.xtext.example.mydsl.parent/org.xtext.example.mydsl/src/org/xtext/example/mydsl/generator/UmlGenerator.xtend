/*
 * generated by Xtext 2.24.0
 */
package org.xtext.example.mydsl.generator


import org.eclipse.emf.common.util.EList
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import org.xtext.example.mydsl.uml.AbstractClass
import org.xtext.example.mydsl.uml.Class
import org.xtext.example.mydsl.uml.ClassContent
import org.xtext.example.mydsl.uml.DefinedParameter
import org.xtext.example.mydsl.uml.Enum
import org.xtext.example.mydsl.uml.Function
import org.xtext.example.mydsl.uml.Heritage
import org.xtext.example.mydsl.uml.Implementation
import org.xtext.example.mydsl.uml.Interface
import org.xtext.example.mydsl.uml.InterfaceFunction
import org.xtext.example.mydsl.uml.Link
import org.xtext.example.mydsl.uml.StaticParameter
import org.xtext.example.mydsl.uml.UmlObject
import org.xtext.example.mydsl.uml.AbstractFunction

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
 
class UmlGenerator extends AbstractGenerator {
	var links = newArrayList()
		
	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
//		fsa.generateFile('greetings.txt', 'People to greet: ' + 
//			resource.allContents
//				.filter(Greeting)
//				.map[name]
//				.join(', '))

		links.addAll(resource.allContents.toIterable.filter(Link).toList)
		
		for (umlObject: resource.allContents.toIterable.filter(UmlObject)){
			if(umlObject instanceof Class) fsa.generateFile((umlObject as Class).content.name + ".java", umlObject.compile());
			if(umlObject instanceof AbstractClass) fsa.generateFile((umlObject as AbstractClass).name+ ".java", umlObject.compile());
			if(umlObject instanceof Interface) fsa.generateFile((umlObject as Interface).name+".java", umlObject.compile);
			// fsa.generateFile(umlObject.fullyQualifiedName.toString("/") + ".java", umlObject.compile())
		}
		
		
	}
	
	def String processExtends(UmlObject umlObject){
		var res = "extends "
		var isExtend = false
		val umlExtends = links.filter(Heritage).toList
		for (link: umlExtends){
			if( (umlObject instanceof Class && link.childrenClass == (umlObject as Class).content.name) ||
				(umlObject instanceof AbstractClass && link.childrenClass == (umlObject as AbstractClass).name) ||
				(umlObject instanceof Interface && link.childrenClass == (umlObject as Interface).name)
			){
				isExtend = true
				res += link.superClass
			}
		
		}
		return isExtend ? res : ""
	}
	
	def String processImplements(UmlObject umlObject){
		var res = "implements "
		var isImplements = false
		var numberImplemented = 0;
		val umlImplements = links.filter(Implementation).toList
		for (link: umlImplements){
			if( (umlObject instanceof Class && link.childrenClass == (umlObject as Class).content.name) ||
				(umlObject instanceof AbstractClass && link.childrenClass == (umlObject as AbstractClass).name) ||
				(umlObject instanceof Interface && link.childrenClass == (umlObject as Interface).name)
			){
				isImplements = true
				numberImplemented++
				res += link.motherClass
				if(numberImplemented>0) res+=", "
			}
		}
		if (numberImplemented>1) res = res.substring(0, res.length-2)// Delete the last useless blank space and comma
		return isImplements ? res : "" 
	}
	
	def String processUmlObject(UmlObject umlObject){
		var res = "";
		res += processExtends(umlObject)
		if(!res.isEmpty) res+=" "
		res += processImplements(umlObject)
		return res;
	}
		
	private dispatch def compile(Class c) '''
		class «c.content.name» «processUmlObject(c)»{
			«IF c.content !== null »
				«c.content.compile»
			«ENDIF»
		}
	'''
	
	// TODO
	private dispatch def compile (AbstractClass aClass)'''
		abstract class «aClass.name» «processUmlObject(aClass)»{
			«aClass.params.compile»
			«aClass.functions.compile»
		}
	'''
	
	
	// TODO
	private dispatch def compile (Interface umlInterface)'''
		interface «umlInterface.name»{
			«umlInterface.functions.compile»
		}
	'''
	// TODO
	private dispatch def compile (Enum umlEnum)'''«umlEnum»
	
	'''
	//TODO
	private dispatch def compile(ClassContent cc) '''
		«IF cc.params !== null && !cc.params.empty»
			«cc.params.compile»
		«ENDIF»
		
		«IF cc.functions !== null && !cc.functions.empty»
			«cc.functions.compile»
		«ENDIF»
	'''
	
	/**
	 * All ELists<T> should be compiled here, because of Java erasure
	 * Basically, the Java compiler deletes the generic type contained in the list for overridden methods.
	 * As CharSequence.compile() is overridden several times, the generic type is erased, resulting in multiple methods with the same signature
	 * 
	 * Retrieving the generic type contained in a list is a very annoying task to perform, 
	 * we therefore used a workaround by assuming that each EList should only contain a single type
	 * we can then test the class type of the first element of that list 
	 */
	private dispatch def compile(EList<?> list) '''
	««« H
		«IF !list.empty»
			«IF !list.empty && list.get(0) instanceof DefinedParameter»
				«FOR param : list as EList<DefinedParameter>»
					«IF param.visibility == '#'»protected«ELSEIF param.visibility == '-'»private«ELSE»public«ENDIF» «IF param instanceof StaticParameter»static «ENDIF»«IF param.modifier !== null»«param.modifier» «ENDIF»«param.type» «param.name»;
				«ENDFOR»
			«ENDIF»
			«IF !list.empty && list.get(0) instanceof InterfaceFunction»
				«FOR function : list as EList<InterfaceFunction>»
						«IF function instanceof InterfaceFunction»
						«function.compile»
						«ENDIF»
				«ENDFOR»
			«ENDIF»
			«IF !list.empty && list.get(0) instanceof Function»
				«FOR function : list as EList<Function>»
				«function.compile»
				«ENDFOR»
			«ENDIF»
			«IF list.get(0) instanceof AbstractFunction»
				«FOR function : list as EList<AbstractFunction>»
					«function.compile»
				«ENDFOR»
			«ENDIF»
		«ENDIF»
	'''
	
	private dispatch def compile (Function function) '''
		«IF function.visibility == '#'»protected
		«ELSEIF function.visibility == '-'»private
		«ELSE»public«ENDIF» «function.returnType» «function.name»() { 
			// TODO - Auto generated method
		}
	'''
	private dispatch def compile (InterfaceFunction function) '''
		«IF function.visibility.toString == '#'.toString»
			protected
		«ELSEIF function.visibility == '-'»
			private
		«ELSE»
			public«ENDIF» «function.returnType» «function.name»();
	'''
	private dispatch def compile (AbstractFunction function)'''
		«IF function.visibility.toString == '#'.toString»
			protected
		«ELSEIF function.visibility == '-'»
			private
		«ELSE»
			public«ENDIF» abstract «function.returnType» «function.name»();
	''' 
}

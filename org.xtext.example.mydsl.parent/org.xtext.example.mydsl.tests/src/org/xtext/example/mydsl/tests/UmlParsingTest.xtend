package org.xtext.example.mydsl.tests

import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.^extension.ExtendWith
import org.xtext.example.mydsl.uml.Program
import org.eclipse.xtext.testing.validation.ValidationTestHelper

@ExtendWith(InjectionExtension)
@InjectWith(UmlInjectorProvider)
class UmlParsingTest {
	@Inject ParseHelper<Program> parseHelper
	@Inject extension ValidationTestHelper
	Program result;
	
	//OBJECTS
	@Test
	def void classTest() {
		result = parseHelper.parse('''
			abstract class NomClass {
				attribute {
					+ abstract static int a;
					# const String b;
					- int c;
				} 
				function {
					+ void test();
				}
		}
		''')
		Assertions.assertNotNull(result)
		result.assertNoIssues
	}
	
	@Test
	def void testClassWithFunctionMultipleParameters () {
		result = parseHelper.parse('''
			class NomClass {
				attribute {
					+ static int a;
					# const String b;
					- int c;
				} 
				function {
					+ void test(int a, int b);
					- long calcul(long test_1, string result_b);
				}
		}
		''')
		Assertions.assertNotNull(result)
		result.assertNoIssues
	}
	
	@Test
	def void testInterface() {
		result = parseHelper.parse('''
			interface Runner {
				function {
					+ void run();
				}
			}
		''')
		Assertions.assertNotNull(result)
		result.assertNoIssues
	}
	
	@Test
	def void emptyClassTest(){
		result = parseHelper.parse('''
			abstract class EmptyClass {
				attribute {
				} 
				function {
				}
			}''')
		Assertions.assertNotNull(result)
		result.assertNoIssues
	}
	
	
	@Test
	def void interfaceTest(){
		result = parseHelper.parse('''
			interface NomInterface {
				function {
					+ void test();
				}
			}''')
		Assertions.assertNotNull(result)
		result.assertNoIssues
	}
	
	@Test
	def void enumTest(){
		result = parseHelper.parse('''
			enum NomEnum {
				FOO;
				BAR;
			}''')
		Assertions.assertNotNull(result)
		result.assertNoIssues
	}
	
	//PACKAGE
	@Test
	def void packageTest(){
		result = parseHelper.parse('''
			package nomPackage {
				NomClass,
				AutreClass
			}
			''')
		Assertions.assertNotNull(result)
		result.assertNoIssues
	}
	
	@Test
	def void superpackageTest(){
		result = parseHelper.parse('''
			package superPackage {
				nomPackage
			}
			''')
		Assertions.assertNotNull(result)
		result.assertNoIssues
	}
	
	//LINK
	@Test
	def void heritageTest(){
		result = parseHelper.parse('''
		extends(NomClass, ParentClass);
		''')
		Assertions.assertNotNull(result)
		result.assertNoIssues
	}
	
	@Test
	def void negativeLinktest(){
		result = parseHelper.parse('''
		association(NomClass,AutreClass, nomLiaison, -10);
		''')
	}
	
	@Test
	def void implementationTest(){
		result = parseHelper.parse('''
		implements(NomClass, ParentClass);
		''')
		Assertions.assertNotNull(result)
		result.assertNoIssues
	}
	
	@Test
	def void strongAggregationTest(){
		result = parseHelper.parse('''
		strongAssociation(NomClass, AutreClass, nomLiaison, 10);
		''')
		Assertions.assertNotNull(result)
		result.assertNoIssues
	}
	
	// TODO : To check, I put here additional class in order to don't have the warning, but don't work.
	@Test
	def void associationTest(){
		result = parseHelper.parse('''
		class NomClass {
			attribute {} 
			function {}
		}
		class AutreClass {
			attribute {} 
			function {}
		}
		association(NomClass, AutreClass, nomLiaison, 10, 10);
		''')
		Assertions.assertNotNull(result)
		result.assertNoIssues
	}
	
}

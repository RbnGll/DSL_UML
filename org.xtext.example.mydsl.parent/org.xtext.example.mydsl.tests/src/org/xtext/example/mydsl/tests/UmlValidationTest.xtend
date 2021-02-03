package org.xtext.example.mydsl.tests

import javax.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import org.eclipse.xtext.testing.util.ParseHelper
import org.eclipse.xtext.testing.validation.ValidationTestHelper
import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.^extension.ExtendWith
import org.xtext.example.mydsl.uml.Program
import org.xtext.example.mydsl.uml.UmlPackage
import org.xtext.example.mydsl.validation.UmlValidator

import static org.junit.Assert.assertFalse

@ExtendWith(InjectionExtension)
@InjectWith(UmlInjectorProvider)
class UmlValidationTest {
	@Inject ParseHelper<Program> parseHelper
	@Inject extension ValidationTestHelper
	Program result;
	
	@Test
	def void TestInterfaceNameStartsWithCapitalTest() {
			result = parseHelper.parse('''
				interface foo {function{}}
			''')
			Assertions.assertNotNull(result)
			result.assertWarning(UmlPackage.Literals.INTERFACE,UmlValidator.INVALID_NAME)
	}
	
	@Test
    def void TestEnumValuesShouldBeUpperCaseTest() {
    	result = parseHelper.parse('''
				enum Foo {
					FOO;
					Bar;
					foo;
					bAR;
				}
			''')
			Assertions.assertNotNull(result)
			result.assertNumberOfIssues(3)				
			result.assertWarning(UmlPackage.Literals.ENUM_CONSTANT,UmlValidator.ENUM_VALUES_CAPITAL)
			
    }
	
	@Test
	def void TestUmlObjectNamesAllDifferentTest() {
		result = parseHelper.parse('''
				class Foo {
					attribute{}
					function{}
				}
				
				interface Foo{
					function{}
				}
			''')
			Assertions.assertNotNull(result)
			result.assertError(UmlPackage.Literals.UML_OBJECT, UmlValidator.DUPLICATE_OBJECT_NAME)
	}
	
	@Test
	def void TestClassAttributesAllDifferentTest() {
		result = parseHelper.parse('''
				class Foo {
					attribute{
						+ int foo;
						+ int foo;
					}
					function{}
				}
			''')
			Assertions.assertNotNull(result)
			result.assertError(UmlPackage.Literals.CLASS, UmlValidator.DUPLICATE_ATTRIBUTES)
	}
	
	@Test
	def void TestClassFunctionsAllDifferentTest() {
		result = parseHelper.parse('''
				class Foo {
					attribute{}
					function{
						+ void test();
						+ void test(int a);
						+ void test();
					}
				}
			''')
			Assertions.assertNotNull(result)
			result.assertNumberOfIssues(1)
			result.assertError(UmlPackage.Literals.CLASS, UmlValidator.DUPLICATE_FUNCTIONS)
	}
	
	@Test
	def void TestAbstractClassAttributesAllDifferentTest() {
		result = parseHelper.parse('''
				abstract class Foo {
									attribute{
										+ int foo;
										+ int foo;
									}
									function{}
								}
			''')
			Assertions.assertNotNull(result)
			result.assertError(UmlPackage.Literals.ABSTRACT_CLASS, UmlValidator.DUPLICATE_ATTRIBUTES)
	}
	
	@Test
	def void TestAbstractClassFunctionsAllDifferentTest() {
		result = parseHelper.parse('''
				abstract class Foo {
					attribute{}
					function{
						+ void test();
						+ void test(int a);
						+ void test();
					}
				}
			''')
			Assertions.assertNotNull(result)
			//result.assertNumberOfIssues(1)
			result.assertError(UmlPackage.Literals.ABSTRACT_CLASS, UmlValidator.DUPLICATE_FUNCTIONS)
	}
	
	@Test
	def void TestInterfaceFunctionsAllDifferentTest() {
		result = parseHelper.parse('''
				interface Foo {
					function{
						+ void test();
						+ void test(int a);
						+ void test();
					}
				}
			''')
			Assertions.assertNotNull(result)
			result.assertNumberOfIssues(1)
			result.assertError(UmlPackage.Literals.INTERFACE, UmlValidator.DUPLICATE_FUNCTIONS)	
	}
	
	@Test
	def void TestClass1ExistInLinkTest() {
		result = parseHelper.parse('''
				abstract class Foo {
					attribute{}
					function{}
				}
				extends(Bar, Foo)
			''')
			Assertions.assertNotNull(result)
			result.assertError(UmlPackage.Literals.LINK, UmlValidator.UNDECLARED_CLASS)
				
	}
	
	@Test
	def void TestClass2ExistInLinkTest() {
		result = parseHelper.parse('''
				abstract class Foo {
					attribute{}
					function{}
				}
				extends(Foo, Bar)
			''')
			Assertions.assertNotNull(result)
			result.assertError(UmlPackage.Literals.LINK, UmlValidator.UNDECLARED_CLASS)
	}
	
	private def assertNumberOfIssues(Program program, int expectedNumberOfIssues) {
		Assertions.assertEquals(expectedNumberOfIssues, program.validate.size)
	}
}
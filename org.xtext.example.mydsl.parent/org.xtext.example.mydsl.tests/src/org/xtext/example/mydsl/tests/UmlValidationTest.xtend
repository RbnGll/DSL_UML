package org.xtext.example.mydsl.tests

import org.junit.jupiter.api.^extension.ExtendWith
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import javax.inject.Inject
import org.eclipse.xtext.testing.util.ParseHelper
import org.eclipse.xtext.testing.validation.ValidationTestHelper
import org.xtext.example.mydsl.uml.Program
import org.junit.jupiter.api.Test
import static org.junit.Assert.assertFalse

@ExtendWith(InjectionExtension)
@InjectWith(UmlInjectorProvider)
class UmlValidationTest {
	@Inject ParseHelper<Program> parseHelper
	@Inject extension ValidationTestHelper
	Program result;
	
	@Test
	def void TestInterfaceNameStartsWithCapitalTest() {
			assertFalse(true)
	}
	
	@Test
    def void TestEnumValuesShouldBeUpperCaseTest() {
    			assertFalse(true)
    }
	
	@Test
	def void TestUmlObjectNamesAllDifferentTest() {
				assertFalse(true)

	}
	
	@Test
	def void TestClassAttributesAllDifferentTest() {
				assertFalse(true)
	}
	
	@Test
	def void TestClassFunctionsAllDifferentTest() {
		assertFalse(true)
	}
	
	@Test
	def void TestAbstractClassAttributesAllDifferentTest() {
		assertFalse(true)
	}
	
	@Test
	def void TestAbstractClassFunctionsAllDifferentTest() {
		assertFalse(true)
	}
	
	@Test
	def void TestInterfaceFunctionsAllDifferentTest() {
		assertFalse(true)		
	}
	
	@Test
	def void TestClass1ExistInLinkTest() {
		assertFalse(true)		
	}
	
	@Test
	def void TestClass2ExistInLinkTest() {
		assertFalse(true)
	}
}
package org.xtext.example.mydsl.tests

import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import org.eclipse.xtext.xbase.testing.CompilationTestHelper
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.^extension.ExtendWith

@ExtendWith(InjectionExtension)
@InjectWith(UmlInjectorProvider)
class UmlCompilationTest {
	@Inject extension CompilationTestHelper
	
	@Test 
	def emptyClassTest(){
		'''
			class EmptyClassTest {
				parameter {}
				function {}
			}
		'''.assertCompilesTo('''
		class EmptyClassTest {
		}''')
	}
	
	@Test
	def void parameterVisibilityValueTest() {
		'''
			class ParameterVisibiltyTest {
				parameter {
					+ int publicInt;
					- int privateInt;
					# int protectedInt;
				}
				function{}
		'''.assertCompilesTo('''
			class ParameterVisibiltyTest {
				public int publicInt;
				private int privateInt;
				protected int protectedInt;
			}''')
	}
	
	@Test
	def void parameterModifierValueTest() {
		'''
			class ParameterModifierValueTest {
				parameter {
					- static int staticInt;
					- final int finalInt;
					- static final int STATIC_FINAL_INT;
				}
				function {}
		'''.assertCompilesTo('''
			class ParameterModifierValueTest {
				private static int staticInt;
				private final int finalInt;
				private static final int STATIC_FINAL_INT;
			}''')
	}
	
	@Test
	def primitiveAttributesTest(){
		'''
			class PrimitiveAttributesTest {
				parameter{
					- byte by;
					- short sh;
					- int i;
					- float f;
					- double d;
					- boolean b;
					- char c;
				}
				function{}
		'''.assertCompilesTo('''
			class PrimitiveAttributesTest {
				private byte by;
				private short sh;
				private int i;
				private float f;
				private double d;
				private boolean b;
				private char c;
			}''')
	}
	
	@Test
	def void functionVisibilityValueTest() {
		'''
			class FunctionVisibilityValueTest {
				parameter{}
				function{
					+ void publicFunction();
					- void privateFunction();
					# void protectedFunction();
				}
			}
		'''.assertCompilesTo('''
			class FunctionVisibilityValueTest {
				public void publicFunction(){
					// TODO - Auto generated method
				}
				private void privateFunction(){
					// TODO - Auto generated method
				}
				protected void protectedFunction(){
					// TODO - Auto generated method
				}
			}''')
		
	}
	
	
	@Test
	def void primitiveFunctionReturnTypeTest() {
		'''
			class PrimitiveFunctionReturnTypeTest {
				parameter{}
				function{
					+ void voidFunction();
					+ byte byteFunction();
					+ short shortFunction();
					+ int intFunction();
					+ float floatFunction();
					+ double doubleFunction();
					+ boolean booleanFunction();
				}
			}
		'''.assertCompilesTo('''
			class PrimitiveFunctionReturnTypeTest {
				public void voidFunction(){
					// TODO - Auto generated method
				}
				public byte byteFunction(){
					// TODO - Auto generated method
				}
				public short shortFunction(){
					// TODO - Auto generated method
				}
				public int intFunction(){
					// TODO - Auto generated method
				}
				public float floatFunction(){
					// TODO - Auto generated method
				}
				public double doubleFunction(){
					// TODO - Auto generated method
				}
				public boolean booleanFunction(){
					// TODO - Auto generated method
				}
			}''')
	}
	
	@Test
	def void constructorTest() {
		'''
			class ConstructorTest {
				parameter{}
				function{
					+ ConstructorTest();
				}
			}
		'''.assertCompilesTo('''
			class ConstructorTest {
				public ConstructorTest(){
					// TODO - Auto generated method
				}
			}
			'''
		)
	}
	
	@Test
	def void astractClassTest() {
		'''
			abstract class AbstractClass {
				parameter{}
				function{}
			}
		'''.assertCompilesTo('''
			abstract class AbstractClass {
			}''')
	}
	
	@Test
	def void abstractClassWithAtributesAndMethodsTest() {
		'''
			abstract class AbstractClass {
				parameter{}
				function{
					+ abstract void abstractFunction();
				}
			}
		'''.assertCompilesTo('''
			abstract class AbstractClass {
				public abstract void abstractFunction(){
					// TODO - Auto generated method
				}
			}
		''')
	}
	
	@Test
	def void extendTest() {
		'''
			class MotherClass {
				parameter{}
				function{}
			}
			class DaughterClass {
				parameter{}
				function{}
			}
			heritage(MotherClass, DaughterClass);
		'''.assertCompilesTo('''
			MULTIPLE FILES WERE GENERATED
			
			File 1 : /myProject/./src-gen/DaughterClass.java
			
			class DaughterClass extends MotherClass {
			}
			File 2 : /myProject/./src-gen/MotherClass.java
			
			class MotherClass {
			}''')
	}
}
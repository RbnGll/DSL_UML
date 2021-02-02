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
	def void testEnum() {
		'''
			enum TestEnum {
				VALUE1, VALUE2, VALUE3;
			}
		'''.assertCompilesTo('''
			public enum TestEnum {
				VALUE1,
				VALUE2,
				VALUE3,
			}''')
	}
	
	@Test 
	def testEmptyClass(){
		'''
			class TestEmptyClass {
				attribute {}
				function {}
			}
		'''.assertCompilesTo('''
		public class TestEmptyClass {
		}''')
	}
	
	
	@Test
	def void testAttributeVisibilityValue() {
		'''
			class TestAttributeVisibilty {
				attribute {
					+ int publicInt;
					- int privateInt;
					# int protectedInt;
				}
				function{}
		'''.assertCompilesTo('''
			public class TestAttributeVisibilty {
				public int publicInt;
				private int privateInt;
				protected int protectedInt;
			}''')
	}
	
	@Test
	def void testAttributeModifierValue() {
		'''
			class TestAttributeModifierValue {
				attribute {
					- static int staticInt;
					- final int finalInt;
					- static final int STATIC_FINAL_INT;
				}
				function {}
		'''.assertCompilesTo('''
			public class TestAttributeModifierValue {
				private static int staticInt;
				private final int finalInt;
				private static final int STATIC_FINAL_INT;
			}''')
	}
	
	@Test
	def testPrimitiveAttributes(){
		'''
			class TestPrimitiveAttributes {
				attribute{
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
			public class TestPrimitiveAttributes {
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
	def void testNonPrimitiveAttributes() {
		'''
			class MyObject{
						attribute{}
						function{}
					}
					class TestNonPrimitiveAttributes {
						attribute {
							- String a;
							- MyObject b;
					}
					function{}
				'''.assertCompilesTo('''
			MULTIPLE FILES WERE GENERATED
			
			File 1 : /myProject/./src-gen/MyObject.java
			
			public class MyObject {
			}
			File 2 : /myProject/./src-gen/TestNonPrimitiveAttributes.java
			
			public class TestNonPrimitiveAttributes {
				private String a;
				private MyObject b;
			}
			''')
	}
	
	@Test
	def void testConstructor() {
		'''
			class TestConstructor {
				attribute{}
				function{
					+ ConstructorTest();
				}
			}
		'''.assertCompilesTo('''
			public class TestConstructor {
				public ConstructorTest(){
					// TODO - Auto generated method
				}
			}'''
		)
	}
	
	@Test
	def void testFunctionVisibilityValue() {
		'''
			class TestFunctionVisibilityValue {
				attribute{}
				function{
					+ void publicFunction();
					- void privateFunction();
					# void protectedFunction();
				}
			}
		'''.assertCompilesTo('''
			public class TestFunctionVisibilityValue {
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
	def void testStaticFunction() {
		'''
			class TestStaticFunction {
				attribute{}
				function{
					+ static void main(String args);
				}
			}
		'''.assertCompilesTo('''
			public class TestStaticFunction {
				public static void main(String args){
					// TODO - Auto generated method
				}
			}''')
	}
	
	
	@Test
	def void testPrimitiveFunctionReturnType() {
		'''
			class TestPrimitiveFunctionReturnType {
				attribute{}
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
			public class TestPrimitiveFunctionReturnType {
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
	def void testNonPrimitiveFunctionReturnType() {
		'''
			class MyObject{
						attribute{}
						function{}
					}
					class TestNonPrimitiveAttributes {
						attribute {
							- String a;
							- MyObject b;
					}
					function{
						+ MyObject myObjectFunction ();
					}
		'''.assertCompilesTo('''
			MULTIPLE FILES WERE GENERATED
			
			File 1 : /myProject/./src-gen/MyObject.java
			
			public class MyObject {
			}
			File 2 : /myProject/./src-gen/TestNonPrimitiveAttributes.java
			
			public class TestNonPrimitiveAttributes {
				private String a;
				private MyObject b;
				public MyObject myObjectFunction(){
					// TODO - Auto generated method
				}
			}
			''')
	}
	
	@Test
	def void testFunctionFinalParameter() {
		'''
			class TestFunctionFinalParameter {
				attribute{}
				function{
					+ void myFunction(final int a);
				}
			}
		'''.assertCompilesTo('''
			public class TestFunctionFinalParameter {
				public void myFunction(final int a){
					// TODO - Auto generated method
				}
			}''')
	}
	
	@Test
	def void testPrimitiveTypeFunctionParameter() {
		'''
		class TestPrimitiveTypeFunctionParameter {
			attribute{}
			function{
				+ void myFunction(byte by, short sh, int i, float f, double d, boolean b);
			}
		}
	'''.assertCompilesTo('''
		public class TestPrimitiveTypeFunctionParameter {
			public void myFunction(byte by, short sh, int i, float f, double d, boolean b){
				// TODO - Auto generated method
			}
		}''')
	}
	
	@Test
	def void testNonPrimitiveTypeFunctionParameter() {
		'''
			class MyObject {
				attribute{}
				function{}
			}
			class TestNonPrimitiveTypeFunctionParameter {
				attribute{}
				function{
					+ void myFunction(String str, MyObject o);
				}
			}
		'''.assertCompilesTo('''
			MULTIPLE FILES WERE GENERATED
			
			File 1 : /myProject/./src-gen/MyObject.java
			
			public class MyObject {
			}
			File 2 : /myProject/./src-gen/TestNonPrimitiveTypeFunctionParameter.java
			
			public class TestNonPrimitiveTypeFunctionParameter {
				public void myFunction(String str, MyObject o){
					// TODO - Auto generated method
				}
			}
			''')
	}
	
	@Test
	def void testEmptyAbstractClass() {
		'''
			abstract class TestAbstractClass {
				attribute{}
				function{}
			}
		'''.assertCompilesTo('''
			public abstract class TestAbstractClass {
			}''')
	}
	
	@Test
	def void testAbstractClassWithAtributesAndMethods() {
		'''
			abstract class TestAbstractClass {
				attribute{
					+ int A;
				}
				function{
					+ abstract void abstractFunction();
				}
			}
		'''.assertCompilesTo('''
			public abstract class TestAbstractClass {
				public int A;
				public abstract void abstractFunction(){
					// TODO - Auto generated method
				}
			}''')
	}
	
	@Test
	def void testEmptyInterface() {
		'''
			interface TestInterface{
				function{}
			}
		'''.assertCompilesTo('''
			public interface TestInterface {
			}''')
	}
	
	@Test
	def void testInterfaceWithAFunction() {
		'''
			interface TestInterface {
				function{
					+ void testFunction ();
				}
			}
		'''.assertCompilesTo('''
		public interface TestInterface {
			public void testFunction();
		}''')
	}
	
	
	@Test
	def void testExtends() {
		'''
			class MotherClass {
				attribute{}
				function{}
			}
			class DaughterClass {
				attribute{}
				function{}
			}
			extends(MotherClass, DaughterClass);
		'''.assertCompilesTo('''
			MULTIPLE FILES WERE GENERATED
			
			File 1 : /myProject/./src-gen/DaughterClass.java
			
			public class DaughterClass extends MotherClass {
			}
			File 2 : /myProject/./src-gen/MotherClass.java
			
			public class MotherClass {
			}
			''')
	}
	
	@Test
	def void testImplements() {
		'''
			interface SuperInterface {
				function{
					+ void myFunction(int a);
				}
			}
			class SuperInterfaceImpl {
				attribute{}
				function{}
			}
			implements(SuperInterface, SuperInterfaceImpl);
		'''.assertCompilesTo('''
			MULTIPLE FILES WERE GENERATED
			
			File 1 : /myProject/./src-gen/SuperInterface.java
			
			public interface SuperInterface {
				public void myFunction(int a);
			}
			File 2 : /myProject/./src-gen/SuperInterfaceImpl.java
			
			public class SuperInterfaceImpl implements SuperInterface {
				public void myFunction(int a){
					// TODO - Implemented method
				}
			}
			''')
	}
}
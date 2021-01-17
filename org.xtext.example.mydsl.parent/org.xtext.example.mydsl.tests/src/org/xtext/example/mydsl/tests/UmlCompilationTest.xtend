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
	def ClassTest(){
		'''public class NomClass {
			parameter {}
			function {}
	}'''.assertCompilesTo('''
	public Class NomClass {
		
	}
	''')
	}
	
}
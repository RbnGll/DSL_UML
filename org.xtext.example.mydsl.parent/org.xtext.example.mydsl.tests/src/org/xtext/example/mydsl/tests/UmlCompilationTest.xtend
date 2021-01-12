package org.xtext.example.mydsl.tests

import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import org.eclipse.xtext.testing.util.ParseHelper
import org.eclipse.xtext.xbase.testing.CompilationTestHelper
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.^extension.ExtendWith
import org.xtext.example.mydsl.uml.UmlFactory

@ExtendWith(InjectionExtension)
@InjectWith(UmlInjectorProvider)
class UmlCompilationTest {
	@Inject extension CompilationTestHelper
	
	@Inject
	ParseHelper<UmlFactory> parseHelper
	
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
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
	
	@Test
	def void classTest() {
		result = parseHelper.parse('''
			abstract class NomClass {
				parameter {
					+ static int a;
					# const String b;
					-  int c;
			} 
			fonction {
				+ void test();
			}
			}
''')
		Assertions.assertNotNull(result)
		result.assertNoIssues
	}
}

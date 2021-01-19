/*
 * generated by Xtext 2.24.0
 */
package org.xtext.example.mydsl.ui.outline;

import javax.inject.Inject;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.jface.resource.ImageDescriptor;
import org.eclipse.jface.viewers.StyledString;
import org.eclipse.osgi.container.ModuleContainer;
import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.Image;
<<<<<<< HEAD
=======
import org.eclipse.swt.graphics.RGB;
import org.eclipse.xtext.AbstractElement;
import org.eclipse.xtext.ui.IImageHelper;
>>>>>>> master
import org.eclipse.xtext.ui.PluginImageHelper;
import org.eclipse.xtext.ui.editor.outline.IOutlineNode;
import org.eclipse.xtext.ui.editor.outline.impl.AbstractOutlineNode;
import org.eclipse.xtext.ui.editor.outline.impl.DefaultOutlineTreeProvider;
<<<<<<< HEAD
=======
import org.eclipse.xtext.ui.editor.outline.impl.DocumentRootNode;
import org.eclipse.xtext.ui.editor.outline.impl.EObjectNode;
import org.eclipse.xtext.ui.editor.utils.TextStyle;
import org.eclipse.xtext.ui.label.StylerFactory;
>>>>>>> master
import org.xtext.example.mydsl.uml.Class;
import org.xtext.example.mydsl.uml.DefinedParameter;
import org.xtext.example.mydsl.uml.Enum;
import org.xtext.example.mydsl.uml.Interface;
import org.xtext.example.mydsl.uml.Link;
import org.xtext.example.mydsl.uml.Program;
import org.xtext.example.mydsl.uml.Statement;
import org.xtext.example.mydsl.uml.Heritage;
import org.xtext.example.mydsl.uml.AbstractClass;
import org.xtext.example.mydsl.uml.Association;



/**
 * Customization of the default outline structure.
 *
 * See https://www.eclipse.org/Xtext/documentation/310_eclipse_support.html#outline
 */
public class UmlOutlineTreeProvider extends DefaultOutlineTreeProvider {

//	protected void _createChildren(DocumentRootNode parentNode, 
//			Class c) {
//		for (AbstractElement element : c.getElements()) {
//			createNode(parentNode, element);
//		}
//	}

	public Object _text(Link l) {
		return "Link";
	}
	
	public Object _text(Class c) {
		return "Class";
	}

	public Object _text(Enum c) {
		return "Enum";
	}

	public Object _text(Interface c) {
		return "Interface";
	}

	public Object _text(Heritage c) {
		return "Heritage";
	}
	
	public Object _text(Association c) {
		return "Association";
	}

	@Inject 
	private StylerFactory stylerFactory;
	
	public Object _text(DefinedParameter d) {
		
		  TextStyle textStyle = new TextStyle();
		  textStyle.setColor(new RGB(149, 125, 71));
		  textStyle.setStyle(SWT.ITALIC);
		
		return new StyledString(d.getName(), stylerFactory.createXtextStyleAdapterStyler(textStyle));
		
//		return "Parameter : " + d.getName();
	}
	
	
	
	
	/**
	 * Abstract class UML :
	 * - Italics
	 * @return
	 */
	private TextStyle abstractClassStyle() {
		TextStyle textStyle = new TextStyle();
		textStyle.setStyle(SWT.ITALIC);
		return textStyle;
	}

	
//    protected void _createChildren(DocumentRootNode rootNode, Class fragment) {
//		createNode(rootNode, fragment.getContent().getParams().get(0));
////		for (elem : fragment.elements) {
////			createNode(rootNode, elem)
////		}
//	}
	
	
//	public static DocumentRootNode classroot = null;

	private static boolean objectNodeCreated = false;
	
    protected void _createChildren(DocumentRootNode parentNode, Program progra) {
    	
    	
//    	Create a new element that will be the parent of the objects, links and packages.
//    	EObject modelElement = new org.xtext.example.mydsl.uml.Object();
//		createEObjectNode(parentNode, modelElement );
    	

    
    	for (Statement s : progra.getCode()) {
    		
    		if (s instanceof org.xtext.example.mydsl.uml.Object) {
    			
    			if (!objectNodeCreated) {
//    				createNode(parentNode, s);
    				objectNodeCreated = true;
    			}
    			
    			System.out.println("Ok we got one object :" + s.getClass().getName());
//    			createChildren(parentNode, s);
    	
    			
    			
    			
    			// TODO :: Group all this in a single node Object 
    			
    			//	Class | AbstractClass | Interface | Enum
    			if (s instanceof Class) {
    				createChildren(parentNode, ((Class) s).getContent());
    			} else if (s instanceof AbstractClass) {
    				createChildren(parentNode, ((AbstractClass) s).getClass_().getContent());
    			} else if (s instanceof Interface) {
    				createChildren(parentNode, ((Interface) s).getContent());
    			} else if (s instanceof Enum) {
    				createChildren(parentNode, ((Enum) s));
    			} else {
    				createChildren(parentNode, s);
    			}
    			
    		}

    		else if (s instanceof org.xtext.example.mydsl.uml.Link) {
    			createChildren(parentNode, s);
    		}
    		

    		else if (s instanceof org.xtext.example.mydsl.uml.Package) {
    			createChildren(parentNode, s);
    		}
    		else {
    			createChildren(parentNode, s);
    		}
    	}
    	
    
	
    }
	
	
	@Inject
	private PluginImageHelper imageHelper;
	
	/**
	 * TODO :: Problem reading image 
	 * 
	 * @param c
	 * @return
	 */
	public ImageDescriptor _image(Class c) {
		return imageHelper.getImageDescriptor("icons/metadata.png");
	}

	
	
}

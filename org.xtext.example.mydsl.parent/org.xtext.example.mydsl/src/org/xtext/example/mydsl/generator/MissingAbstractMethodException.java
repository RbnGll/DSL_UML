package org.xtext.example.mydsl.generator;

public class MissingAbstractMethodException extends Exception {
	String msg;
	/**
	 * Generated serialID
	 */
	private static final long serialVersionUID = -9151370961662577836L;
	
	public MissingAbstractMethodException(String msg) {
		super();
		this.msg = msg;
	}
	@Override
	public String toString() {
		return msg;
	}
	
}

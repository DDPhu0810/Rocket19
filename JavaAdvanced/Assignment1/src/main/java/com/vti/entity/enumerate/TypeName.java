package com.vti.entity.enumerate;

public enum TypeName {
	Essay("0"), MultipleChoice("1");

	private String value;

	private TypeName(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public static TypeName toEnum(String string) {
		for (TypeName typeName : TypeName.values()) {
			if (typeName.getValue().equals(string)) {
				return typeName;
			}
		}
		return null;

	}
}

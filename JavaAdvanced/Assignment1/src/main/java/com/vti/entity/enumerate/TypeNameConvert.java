package com.vti.entity.enumerate;

import javax.persistence.AttributeConverter;

public class TypeNameConvert implements AttributeConverter<TypeName, String>{

	public String convertToDatabaseColumn(TypeName attribute) {
		return attribute.getValue();
	}

	public TypeName convertToEntityAttribute(String dbData) {
		return TypeName.toEnum(dbData);
	}

}

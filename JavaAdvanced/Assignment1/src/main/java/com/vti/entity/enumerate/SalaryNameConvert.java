package com.vti.entity.enumerate;

import javax.persistence.AttributeConverter;

public class SalaryNameConvert implements AttributeConverter<SalaryName, String>{

	public String convertToDatabaseColumn(SalaryName attribute) {
		return attribute.getValue();
	}

	public SalaryName convertToEntityAttribute(String dbData) {
		return SalaryName.toEnum(dbData);
	}

}

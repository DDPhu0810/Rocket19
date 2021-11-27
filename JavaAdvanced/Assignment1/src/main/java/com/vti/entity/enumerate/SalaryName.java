package com.vti.entity.enumerate;

public enum SalaryName {
	Dev("600"), Test("700"), ScrumMaster("1500"), PM("2000");
	
	private String value;
	
	private SalaryName(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}
	
	public static SalaryName toEnum(String string) {
		for (SalaryName salaryName : SalaryName.values()) {
			if(salaryName.getValue().equals(string)) {
				return salaryName;
			}
		}
		
		return null;
		
	}
}

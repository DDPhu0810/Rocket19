package com.vti.entity;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.vti.entity.enumerate.TypeName;

@Entity
@Table(name = "TypeQuestion", catalog = "TestingSystem_JavaAdvanced")
public class TypeQuestion {
	
	@Id
	@Column(name = "TypeID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int typeID;
	
	@Column(name = "TypeName", nullable = false, unique = true)
	@Convert(converter = TypeName.class)
	TypeName typeName;

	public TypeQuestion() {
		super();
	}

	public TypeQuestion(TypeName typeName) {
		super();
		this.typeName = typeName;
	}

	public TypeQuestion(int typeID, TypeName typeName) {
		super();
		this.typeID = typeID;
		this.typeName = typeName;
	}

	public int getTypeID() {
		return typeID;
	}

	public void setTypeID(int typeID) {
		this.typeID = typeID;
	}

	public TypeName getTypeName() {
		return typeName;
	}

	public void setTypeName(TypeName typeName) {
		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return "TypeQuestion [typeID=" + typeID + ", typeName=" + typeName + "]";
	}
	
	
	
}

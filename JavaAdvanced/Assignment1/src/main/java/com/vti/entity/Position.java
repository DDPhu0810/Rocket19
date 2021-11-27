package com.vti.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.vti.entity.enumerate.PositionName;

@Entity
@Table(name = "Position", catalog = "TestingSystem_JavaAdvanced")
public class Position {
	
	@Id
	@Column(name = "PositionID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int positionId;
	
	@Column(name = "PositionName", nullable = false, unique = true)
	@Enumerated(EnumType.STRING)
	PositionName positionName;

	public Position() {
		super();
	}

	public Position(int positionId, PositionName positionName) {
		super();
		this.positionId = positionId;
		this.positionName = positionName;
	}

	public int getPositionId() {
		return positionId;
	}

	public void setPositionId(int positionId) {
		this.positionId = positionId;
	}

	public PositionName getPositionName() {
		return positionName;
	}

	public void setPositionName(PositionName positionName) {
		this.positionName = positionName;
	}

	@Override
	public String toString() {
		return "Position [positionId=" + positionId + ", positionName=" + positionName + "]";
	}
	
	
}

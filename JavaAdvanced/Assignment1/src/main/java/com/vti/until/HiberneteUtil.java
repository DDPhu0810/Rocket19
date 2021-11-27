package com.vti.until;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import com.vti.entity.Exam;
import com.vti.entity.Group;

public class HiberneteUtil {
private final static SessionFactory FACTORY;
	
	static {
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		
		//	mapping
		cfg.addAnnotatedClass(Group.class);
		cfg.addAnnotatedClass(Exam.class);
		
		ServiceRegistry registry = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
		
		FACTORY = cfg.buildSessionFactory(registry);
	}
	
	public static SessionFactory getFactory() {
		return FACTORY;
	}
}

package com.automate.utl;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import com.automate.classes.*;

public class HibernateUtil {
	private static SessionFactory sessionFactory;

	 public static SessionFactory getSessionFactory() {
		  if (sessionFactory == null) {
			   try {
				    Configuration configuration = new Configuration();
				
				    Properties settings = new Properties();
				    settings.put(Environment.DRIVER, "com.mysql.jdbc.Driver");
				    settings.put(Environment.URL, "jdbc:mysql://localhost:3306/automatedb?useSSL=false");
				    settings.put(Environment.USER, "root");
				    settings.put(Environment.PASS, "12345678");
				    settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQLDialect");
				
				    settings.put(Environment.SHOW_SQL, "true");
							
				    configuration.setProperties(settings);
				    configuration.addAnnotatedClass(Machine.class);
				    configuration.addAnnotatedClass(Rapport.class);
				    configuration.addAnnotatedClass(Note.class);
				    configuration.addAnnotatedClass(Detail.class);
				    configuration.addAnnotatedClass(Article.class);
				    
				    ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
				      .applySettings(configuration.getProperties()).build();
				    sessionFactory = configuration.buildSessionFactory(serviceRegistry);
				    return sessionFactory;
			
			   } catch (Exception e) {
				   e.printStackTrace();
			   }
		  }
		  return sessionFactory;
	 }
}
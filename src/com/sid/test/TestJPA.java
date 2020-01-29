package com.sid.test;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.sid.entities.Article;
import com.sid.entities.Categorie;
import com.sid.entities.Client;
import com.sid.entities.Fourrnisseur;
import com.sid.entities.Marque;
import com.sid.entities.Ville;

public class TestJPA {
	// Create an EntityManagerFactory when you start the application
	  private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("JEEJPA_Hibernate");
	
     
	  public static void main(String[]argv) { 
		// The EntityManager class allows operations such as create, read, update, delete
		  EntityManager em = emf.createEntityManager();
		  // Used to issue transactions on the EntityManager 
		  EntityTransaction transac = em.getTransaction();
			transac.begin();
		/*
		 * System.out.println("Start"); Query villequery =
		 * em.createQuery("SELECT v FROM Ville v WHERE v.vileid = :id",Ville.class).
		 * setParameter("id",1); System.out.println("End"); Ville
		 * ville=(Ville)villequery.getSingleResult();
		 * System.out.println(ville.getVileid()+"  "+ville.getVilelib());
		 */
			transac.commit();
			em.close();    
			emf.close();  
		  }

}

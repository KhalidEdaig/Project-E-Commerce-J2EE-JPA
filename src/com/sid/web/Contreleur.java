package com.sid.web;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sid.entities.Article;
import com.sid.entities.Categorie;
import com.sid.entities.Client;
import com.sid.entities.Fourrnisseur;
import com.sid.entities.Marque;
import com.sid.entities.Ville;
/**
 * Servlet implementation class Contreleur
 */
@WebServlet("/Controleur")
public class Contreleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// Create an EntityManagerFactory when you start the application
	private EntityManagerFactory emf ;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contreleur() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		emf = Persistence.createEntityManagerFactory("JEEJPA_Hibernate");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		emf.close();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				// The EntityManager class allows operations such as create, read, update, delete
				EntityManager em = emf.createEntityManager();
				// Used to issue transactions on the EntityManager 
				EntityTransaction transac=null;
				String action=request.getParameter("operation");
				//wwitch for add
				switch (action) {
				//Connexion
				case "login":
				{
					  String  user=request.getParameter("username"); 
					  String password=request.getParameter("password");
					  //verification de username et password
					  if(password.equals("khalid") && user.equals("khalid") ) 
					  {
						  request.setAttribute("modallogin",true);
						  RequestDispatcher disq;
						  disq=request.getRequestDispatcher("dashboard.jsp");
						  disq.forward(request, response);
					  }
					  else {
						  //Envoyer le modele d'erreur
						  request.setAttribute("msgerreur","Username or Password false ");
						  request.getRequestDispatcher("logine.jsp").forward(request, response);
					  }
					  break;
				}
				case "ajoutercatergorie":
				{
					  String  catlib=request.getParameter("catlib"); 	
					  if(!catlib.isEmpty() ) {
						  transac = em.getTransaction();
						  transac.begin();
						  try{
						 Categorie categorie= new Categorie(catlib);
						  em.persist(categorie);
						  transac.commit();
						  //System.out.println("Valide Categogier");
						  Query q = em.createQuery("select cat from Categorie cat");
						  List<Categorie> resultList = (List<Categorie>) q.getResultList();
						  List<Categorie> catlist =resultList;
						  request.setAttribute("modallogin",true);
						  RequestDispatcher d=request.getRequestDispatcher("table.jsp");
						  d.forward(request, response);
						  //request.setAttribute("modcategories",catlist);
						  //response.sendRedirect("/Gestion_Boutique/operations.jsp");
						  }catch (Exception e) {
							  transac.rollback();
						}finally {
				            // Close the EntityManager
				            em.close();
				        }
					  }else {
						  //Envoyer le modele
						  request.setAttribute("msgerreur","Erreur Ajouter Categorie resaisir un nom  ");
						  RequestDispatcher d=request.getRequestDispatcher("forms.jsp");
						  d.forward(request, response);
					  }
					break;
				}
				case "ajoutermarque":
				{
					String  marqlib=request.getParameter("marqlib"); 	
					if(!marqlib.isEmpty() ) 
					{
						  transac = em.getTransaction();
						  transac.begin();
						  try{
							Marque marque= new Marque(marqlib);
						  em.persist(marque);
						  transac.commit();
						  System.out.println("Valide Marque");
						  Query q = em.createQuery("select marq from Marque marq");
						  List<Marque> resultList = (List<Marque>) q.getResultList();
						  List<Marque> marqlist =resultList;
						  request.setAttribute("modmarque",marqlist);
						  request.setAttribute("modallogin",true);
						  RequestDispatcher d=request.getRequestDispatcher("table.jsp");
						  d.include(request, response);
						  d.forward(request, response);
						  //request.getRequestDispatcher("operations.jsp").forward(request, response);
						  //response.sendRedirect("/Gestion_Boutique/operations.jsp");
						  }catch (Exception e) {
							  transac.rollback();
						}finally {
				            // Close the EntityManager
				            em.close();
				        }
					}else 
					{
						//Envoyer le modele
						request.setAttribute("msgerreur","Erreur Ajouter Marque resaisir un nom  ");
						RequestDispatcher d=request.getRequestDispatcher("forms.jsp");
						d.forward(request, response);
					}		
					break;
				}
				case "ajouterville":
				{
					  String  villelib=request.getParameter("villelib"); 	
					  if(!villelib.isEmpty() ) {
						  transac = em.getTransaction();
						  transac.begin();
						  try{
						  Ville ville= new Ville(villelib);
						  em.persist(ville);
						  transac.commit();
						  System.out.println("Valide Ville");
						  Query q = em.createQuery("select ville from Ville ville");
						  List<Ville> resultList = (List<Ville>) q.getResultList();
						  List<Ville> villelist =resultList;
						  request.setAttribute("modville",villelist);
						  request.setAttribute("modallogin",true);
						  request.getRequestDispatcher("table.jsp").forward(request, response);
						  //response.sendRedirect("/Gestion_Boutique/operations.jsp");
						  }catch (Exception e) {
							  transac.rollback();
						}finally {
				            // Close the EntityManager
				            em.close();
				        }
					  }
					  else {
						  //Envoyer le modele
						  request.setAttribute("msgerreur","Erreur Ajouter Ville resaisir un nom  ");
						  RequestDispatcher d=request.getRequestDispatcher("forms.jsp");
						  d.forward(request, response);
					  }
					break;
				}
				case "ajouterfourrnisseur":
				{
					String fouremail=request.getParameter("fouremail");
					String fourphone=request.getParameter("fourphone");
					String fourDescription=request.getParameter("fourDescription");
					String fouraddress=request.getParameter("fouraddress");
					String fourname=request.getParameter("fourname");
					if(!fouremail.isEmpty() 
							&& !fourphone.isEmpty() 
							&& !fourDescription.isEmpty() 
							&& !fouraddress.isEmpty()
							&& !fourname.isEmpty()) {
						  transac = em.getTransaction();
						  transac.begin();
						  try{
						  Fourrnisseur f=new Fourrnisseur();
						  f.setFourname(fourname);
						  f.setFouraddresse(fouraddress);
						  f.setFourdescription(fourDescription);
						  f.setFourphone(fourphone);
						  f.setFouremail(fouremail);
						  em.persist(f);
						  transac.commit();
						  request.setAttribute("modallogin",true);
						  request.getRequestDispatcher("table.jsp").forward(request, response);
						  //response.sendRedirect("/Gestion_Boutique/index.jsp");
						  }catch (Exception e) {
							  transac.rollback();
						 }finally {
				            // Close the EntityManager
				            em.close();
				        }
						
					}else {
						  //Envoyer le modele
						  request.setAttribute("msgerreur","Erreur Ajouter fourrnisseur   ");
						  RequestDispatcher d=request.getRequestDispatcher("forms.jsp");
						  d.forward(request, response);
					  }
					break;
				}
				case "ajouterarticle":
				{
					String  artdesc=request.getParameter("artdesc"); 
					  double artprix=Double.valueOf(request.getParameter("artprix"));
					  int  artqte=Integer.valueOf(request.getParameter("artqte"));
					  String  artdes=request.getParameter("artdes");
					  int marqid=Integer.valueOf(request.getParameter("marqid"));
					  int catid=Integer.valueOf(request.getParameter("catid"));
					  int fourid=Integer.valueOf(request.getParameter("fourid"));
					  Marque m= (Marque)em.createQuery("select m from Marque m where m.marqid =:id")
							  .setParameter("id", marqid)
							  .getSingleResult();
					  Categorie c= (Categorie)em.createQuery("select c from Categorie c where c.catid =:id")
							  .setParameter("id", catid)
							  .getSingleResult();
					  Fourrnisseur f= (Fourrnisseur)em.createQuery("select f from  Fourrnisseur f where f.fourid =:id")
							  .setParameter("id", fourid)
							  .getSingleResult();
					  if(!artdesc.isEmpty() 
							  && !artdes.isEmpty()  
							  && m!=null
							  && f!=null
							  && c!=null) {
						  
						  transac = em.getTransaction();
						  transac.begin();
						  try{
						  Article a=new Article();
						  a.setArtdescription(artdesc);
						  a.setArtdesignation(artdes);
						  a.setPrix(artprix);
						  a.setQtestock(artqte);
						  a.setMarque(new Marque(m.getMarqid(), m.getMarqlib()));
						  a.setCategorie(new Categorie(c.getCatid(),c.getCatlib()));
						  a.setFourrnisseur(new Fourrnisseur(f.getFourid(),f.getFourname(), 
								  f.getFouremail(), 
								  f.getFourphone(), 
								  f.getFouraddresse(), 
								  f.getFourdescription()));
						  em.persist(a);
						  transac.commit();
						  request.getRequestDispatcher("forms.jsp").forward(request, response);
						  }catch (Exception e) {
							  transac.rollback();
						 }finally {
				            // Close the EntityManager
				            em.close();
				        }
					  }
					  else {
						  //Envoyer le modele
						  request.setAttribute("msgerreur","Erreur Ajouter Client resaisir un nom  ");
						  RequestDispatcher d=request.getRequestDispatcher("dashbaord.jsp");
						  d.forward(request, response);
					  }
					break;
				}
				//switch for delete
				case "deletemarq":
				{
					
					break;	
				}
				case "deletecat":
				{
					
					break;	
				}
				case "deletecity":
				{
					
					break;	
				}
				case "deletearticle":
				{
					
					break;	
				}
				case "deletefour":
				{
					
					break;	
				}
				case "deleteclient":
				{
					
					break;	
				}
				//switch for Edit 
				case "editmarq":
				{
					
					break;	
				}
				case "editcat":
				{
					
					break;	
				}
				case "editcity1":
				{
					
					  int  cityid=Integer.valueOf(request.getParameter("cityid")); 	
					  if(request.getParameter("cityid")!=null) {
						  transac = em.getTransaction();
						  transac.begin();
						  try{
						  Ville ville;							  
						  Query q = em.createQuery("select v from Ville v where v.vileid=:id")
								  .setParameter("id", cityid);
						  Ville r = (Ville) q.getSingleResult();
						  transac.commit();
						  ville= new Ville(cityid,r.getVilelib());	
						  request.setAttribute("modedit",true);
						  request.setAttribute("ville",ville);
						  request.getRequestDispatcher("forms.jsp").forward(request, response);
						  }catch (Exception e) {
							  transac.rollback();
						}finally {
				            // Close the EntityManager
				            em.close();
				        }
					  }
					  else {
						  //Envoyer le modele
						  request.setAttribute("msgerreur","Erreur edit city");
						  RequestDispatcher d=request.getRequestDispatcher("table.jsp");
						  d.forward(request, response);
					  }
					break;	
				}
				case "editcity2":
				{
					  int  cityid=Integer.valueOf(request.getParameter("villeid")); 
					  String  villename=request.getParameter("villelib");
					  if(request.getParameter("villeid")!=null &&
						  request.getParameter("villelib")!=null) {
						  transac = em.getTransaction();
						  transac.begin();
						  try{
							  Query q=em.createQuery("UPDATE Ville v SET v.vilelib=:villelib WHERE v.vileid=:id");
							  q.setParameter("id",cityid);
							  q.setParameter("villelib", villename);
							  q.executeUpdate();
						  transac.commit();
						  request.getRequestDispatcher("table.jsp").forward(request, response);
						 
						  }catch (Exception e) {
							  transac.rollback();
						}finally {
				            // Close the EntityManager
				            em.close();
				        }
	
					 }else 
					  { //Envoyer le modele
					  request.setAttribute("msgerreur","Erreur edit city"); RequestDispatcher
					  d=request.getRequestDispatcher("table.jsp"); d.forward(request, response); 
					  }
					break;	
				}
				case "editfour":
				{
					
					break;	
				}
				case "editclient":
				{
					
					break;	
				}
					
				default:
				{
					  RequestDispatcher disq;
					  disq=request.getRequestDispatcher("dashboard.jsp");
					  disq.forward(request, response);	
					  break;
				}
					
				}	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		

	}
}
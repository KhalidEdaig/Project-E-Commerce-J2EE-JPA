<%@page import="com.sid.entities.Ville"%>
<%@page import="javax.persistence.Query"%>
<%@page import="com.sid.entities.Fourrnisseur"%>
<%@page import="com.sid.entities.Marque"%>
<%@page import="com.sid.entities.Categorie"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- ********************************************************** Start Code Java *****************************************************  -->    
     
<%


//*************************************************************************************
	// Create an EntityManagerFactory when you start the application
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("JEEJPA_Hibernate");
	// The EntityManager class allows operations such as create, read, update, delete
	EntityManager em = emf.createEntityManager();
	// Used to issue transactions on the EntityManager 
	EntityTransaction transac = em.getTransaction();
	transac.begin();
//**************************************************************************************
 
List<Categorie> catlist=null;
List<Marque> marqlist=null;
List<Fourrnisseur> fourlist=null;
List<Ville> citylist=null;
if(request.getAttribute("modcategories")!=null)
{
	catlist=(List<Categorie>)request.getAttribute("modcategories"); 
}else{
		  System.out.println("Valide Categogier");
		  Query q = em.createQuery("select cat from Categorie cat");
		  List<Categorie> resultList = (List<Categorie>) q.getResultList();
		  catlist =resultList;
}
/******************************Marque************************/
if(request.getAttribute("modmarque")!=null)
{
	System.out.println("OKOK");
	marqlist=(List<Marque>)request.getAttribute("modmarque"); 
}else{
		 System.out.println("Valide Marque");
		  Query q = em.createQuery("select marq from Marque marq");
		  List<Marque> resultList = (List<Marque>) q.getResultList();
		  marqlist =resultList;
	
}
/****************************************List fournisseur************************************/

if(request.getAttribute("modfour")!=null)
{
	fourlist=(List<Fourrnisseur>)request.getAttribute("modfour"); 
}else{
	
		 System.out.println("Valide Fourrnisseur");
		  Query q = em.createQuery("select four from Fourrnisseur four");
		  List<Fourrnisseur> resultList = (List<Fourrnisseur>) q.getResultList();
		  fourlist =resultList;
}
/****************************************List ville************************************/

if(request.getAttribute("modville")!=null)
{
	citylist=(List<Ville>)request.getAttribute("modville"); 
}else{
		  Query q = em.createQuery("select four from Fourrnisseur four");
		  List<Ville> resultList = (List<Ville>) q.getResultList();
		  citylist =resultList;
}	 						
/*************************************************************************************************/
boolean cnx;
request.setAttribute("modallogin",true);
if(request.getAttribute("modalSecret")!=null){
	cnx=(Boolean)request.getAttribute("modalSecret");
}else{
	cnx=false;
}



%>
<!-- ********************************************************** End Code Java *****************************************************  -->  
<%//if(cnx){ %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>Admin</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet" />

    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
</head>

<body>

    <div class="wrapper">
        <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-4.jpg">

            <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="http://www.creative-tim.com" class="simple-text">
                        ELECTRO KHALID
                    </a>
                </div>

                <ul class="nav">
                    <li>
                        <a href="dashboard.jsp">
                            <i class="pe-7s-graph"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li>
                        <a href="user.jsp">
                            <i class="pe-7s-user"></i>
                            <p>User Profile</p>
                        </a>
                    </li>
                    <li class="active">
                        <a href="forms.jsp">
                            <i class="pe-7s-settings"></i>
                            <p>Forms</p>
                        </a>
                    </li>
                    <li>
                        <a href="table.jsp">
                            <i class="pe-7s-note2"></i>
                            <p>Table List</p>
                        </a>
                    </li>

                    <li>
                        <a href="notifications.jsp">
                            <i class="pe-7s-bell"></i>
                            <p>Notifications</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="main-panel">
            <nav class="navbar navbar-default navbar-fixed">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#navigation-example-2">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Table List</a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-left">
                            <li>
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-dashboard"></i>
                                    <p class="hidden-lg hidden-md">Dashboard</p>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-globe"></i>
                                    <b class="caret hidden-sm hidden-xs"></b>
                                    <span class="notification hidden-sm hidden-xs">5</span>
                                    <p class="hidden-lg hidden-md">
                                        5 Notifications
                                        <b class="caret"></b>
                                    </p>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Notification 1</a></li>
                                    <li><a href="#">Notification 2</a></li>
                                    <li><a href="#">Notification 3</a></li>
                                    <li><a href="#">Notification 4</a></li>
                                    <li><a href="#">Another notification</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="">
                                    <i class="fa fa-search"></i>
                                    <p class="hidden-lg hidden-md">Search</p>
                                </a>
                            </li>
                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="">
                                    <p>Account</p>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <p>
                                        Dropdown
                                        <b class="caret"></b>
                                    </p>

                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">
                                    <p>Log out</p>
                                </a>
                            </li>
                            <li class="separator hidden-lg hidden-md"></li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!--*************************************************** Start Forms* **************************************************************-->
            <!--*************************************************** Start Add Article* **************************************************************-->
            <!--Start container -->
            <div class="content">
                <!--Start container-fluid -->
                <div class="container-fluid">
                    <!--Start Row -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">Add Article</h4>
                                </div>
                                <div class="content">
                                    <form class="card-body" method="POST" action="Controleur">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="artDesignation" class="">Designation</label>
                                                    <input type="text" id="artDesignation" name="artdes"
                                                        class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="artDescription" class="">Description</label>
                                                    <input type="text" id="artDescription" class="form-control"
                                                        name="artdesc">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="quantite" class="">Quantité de Stock</label>
                                                    <input type="text" id="quantite" name="artqte"
                                                        class="form-control" placeholder="Quantite...">

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="prix" class="">Prix (DH)</label>
                                                    <input type="text" id="prix" class="form-control" name="artprix"
                                                        placeholder="Prix par UnitÃ©">

                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <!--Grid column-->
                                            <div class="form-group col-md-4">
                                           	 
                                                <label for="categorie" class="">Select Categorie</label>
                                                <select class="custom-select d-block w-100" id="categorie"
                                                    name="catid" required>
                                                     <%
								                 for (Categorie cat : catlist){			
							                   %>
                                                    <option value="<%=cat.getCatid()%>"><%=cat.getCatlib()%></option>
                                                    <%} %>
                                                </select>
                                            </div>
                                            <!--Grid column-->
                                            <div class="form-group col-md-4">
                                                <label for="marque" class="">Select Marque</label>
                                                <select class="custom-select d-block w-100" id="marque" name="marqid"
                                                    required>
                                                     <%
									                 for (Marque marq : marqlist){			
								                   %>
								                    <option value="<%=marq.getMarqid() %>"><%=marq.getMarqlib() %></option>
								                    <%} %>
                                                </select>
                                            </div>
                                            <!--Grid column-->
                                            <div class="form-group col-md-4">
                                                <label for="four" class="">Select Fourrnisseur.</label>
                                                <select class="custom-select d-block w-100" id="four" name="fourid"
                                                    required>
                                                      <%
									                 for (Fourrnisseur four : fourlist){			
								                   %>
								                    <option value="<%=four.getFourid()%>"><%=four.getFourname() %></option>
								                    <% } %>
                                                </select>
                                            </div>
                                            <!--Grid column-->
                                        </div>
                                        <input type="hidden" name="operation" value="ajouterarticle">
                                        <hr class="mb-4">
                                        <button class="btn btn-info btn-fill pull-right" type="submit">Ajouter</button>
                                        <div class="clearfix"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!--*************************************************** End Add Article* **************************************************************-->
                        <!--*************************************************** Start Add four ***************************************************************-->
                        <div class="col-md-6">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">Add Fourrnisseur</h4>
                                </div>
                                <div class="content">
                                    <form class="card-body" method="POST" action="Controleur">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="fourname" class="">Fourrnisseur Name</label>
                                                    <input type="text" id="fourname" name="fourname"
                                                        class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="fouraddress" class="">Address</label>
                                                    <input type="text" id="fouraddress" class="form-control"
                                                        name="fouraddress">

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="fourDescription" class="">Description</label>
                                                    <input type="text" id="fourDescription" name="fourDescription"
                                                        class="form-control">


                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="fouremail" class="">Email</label>
                                                    <input type="text" id="fouremail" class="form-control"
                                                        name="fouremail" placeholder="youremail@gmail.com">


                                                </div>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="fourphone" class="">Description</label>
                                                    <input type="text" id="fourphone" name="fourphone"
                                                        class="form-control">


                                                </div>
                                            </div>
                                        </div>
                                        <input type="hidden" name="operation" value="ajouterfourrnisseur">
                                        <hr class="mb-4">
                                        <button class="btn btn-info btn-fill pull-right" type="submit">Ajouter</button>
                                        <div class="clearfix"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!--*************************************************** End Add four* **************************************************************-->
                    </div>
                    <!--End Row -->

                    <!--Start Row -->
                    <div class="row">
                        <!--*************************************************** Start Add Marque * **************************************************************-->
                        <div class="col-md-4">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">Add Marque</h4>
                                </div>
                                <div class="content">
                                    <form class="card-body" method="POST" action="Controleur">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="marque" class="">Marque</label>
                                                    <input type="text" id="marque" class="form-control" name="marqlib">
                                                </div>
                                            </div>
                                        </div>
                                        <input type="hidden" name="operation" value="ajoutermarque">
                                        <hr class="mb-4">
                                        <button class="btn btn-info btn-fill pull-right" type="submit">Ajouter</button>
                                        <div class="clearfix"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!--*************************************************** End Add Marque * **************************************************************-->
                        <!--*************************************************** Start Add Categorie * **************************************************************-->
                        <div class="col-md-4">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">Add Categorie</h4>
                                </div>
                                <div class="content">
                                    <form class="card-body" method="POST" action="Controleur">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="categorier" class="">Categorie</label>
                                                    <input type="text" id="categorier" class="form-control"
                                                        name="catlib">
                                                </div>
                                            </div>
                                        </div>
                                        <input type="hidden" name="operation" value="ajoutercatergorie">
                                        <hr class="mb-4">
                                        <button class="btn btn-info btn-fill pull-right" type="submit">Ajouter</button>
                                        <div class="clearfix"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!--*************************************************** End AddCategorier* **************************************************************-->
                        <!--*************************************************** Start Add Ville* **************************************************************-->
                        <div class="col-md-4">
                            <div class="card">

                                        <!-- For Edit -->
                                        <%
                                        boolean edit;
                                        if(request.getAttribute("modedit")!=null){
                                        edit=(Boolean)request.getAttribute("modedit");                         
                                        }else{
                                        edit=false;	
                                        }
                                        if(edit){ 
                                        	Ville v=(Ville)request.getAttribute("ville");
                                        %>
                                         <div class="header">
		                                    <h4 class="title">Add Ville</h4>
		                                </div>
		                                <div class="content">
                                        <form class="card-body" method="POST" action="Controleur">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="id" class="">ID</label>
                                                    <input type="text"  disabled="disabled"  id="id" class="form-control"  value="<%=v.getVileid()%>">
                                                    <input type="text" name="villeid" hidden="hidden" value="<%=v.getVileid()%>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="ville" class="">Ville</label>
                                                    <input type="text" id="ville" class="form-control" name="villelib" value="<%=v.getVilelib()%>">
                                                </div>
                                            </div>
                                        </div>
                                        <input type="hidden" name="operation" value="editcity2">
                                         <hr class="mb-4">
                                        <button class="btn btn-info btn-fill pull-right" type="submit">Edit</button>
                                        <div class="clearfix"></div>
                                        </form>
                                        </div>
                                        <%}else{ %>
                                         <div class="header">
                                    <h4 class="title">Add Ville</h4>
	                                </div>
	                                <div class="content">
                                        <form class="card-body" method="POST" action="Controleur">
                                        <!--Name Categorier-->
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="ville" class="">Ville</label>
                                                    <input type="text" id="ville" class="form-control" name="villelib">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- For Add -->
                                        <input type="hidden" name="operation" value="ajouterville">
                                        <hr class="mb-4">
                                        <button class="btn btn-info btn-fill pull-right" type="submit">Add</button>
                                        <div class="clearfix"></div>
                                        </form>
                                         </div>
                                        <%} %>
                            </div>
                        </div>
                        <!--*************************************************** End Add Ville* **************************************************************-->
                    </div>
                    <!--End Row -->
                </div>
                <!-- End Container-fluid -->
            </div>
            <!-- End Container -->

            <!--*************************************************** Start Forms* **************************************************************-->
            <footer class="footer">
                <div class="container-fluid">
                    <nav class="pull-left">
                        <ul>
                            <li>
                                <a href="#">
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Company
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Portfolio
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Blog
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <p class="copyright pull-right">
                        &copy; <script>
                            document.write(new Date().getFullYear())
                        </script> <a href="http://www.electrokhalid.com">Creative website</a>
                    </p>
                </div>
            </footer>


        </div>
    </div>
</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>


</html>

<%//}else if(!cnx) { %>


        
        <%//@include file="error.html" %>
        
  



<%//}%>
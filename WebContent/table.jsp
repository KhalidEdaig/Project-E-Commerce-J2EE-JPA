<%@page import="com.sid.entities.Article"%>
<%@page import="com.sid.entities.Client"%>
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
List<Client> clientlist=null;
List<Article> artlist=null;
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
	marqlist=(List<Marque>)request.getAttribute("modmarque"); 
}else{
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
		  Query q = em.createQuery("select ville from Ville ville");
		  List<Ville> resultList = (List<Ville>) q.getResultList();
		  citylist =resultList;
}	


/****************************************List client************************************/

if(request.getAttribute("modclient")!=null)
{
	citylist=(List<Ville>)request.getAttribute("modclient"); 
}else{
		  Query q = em.createQuery("select c from Client c");
		  List<Client> resultList = (List<Client>) q.getResultList();
		  clientlist =resultList;
}

/****************************************List Article************************************/

if(request.getAttribute("modart")!=null)
{
	citylist=(List<Ville>)request.getAttribute("modart"); 
}else{
		  Query q = em.createQuery("select art from Article art");
		  List<Article> resultList = (List<Article>) q.getResultList();
		  artlist =resultList;
}
%>
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
                    <li>
                        <a href="forms.jsp">
                            <i class="pe-7s-settings"></i>
                            <p>Forms</p>
                        </a>
                    </li>
                    <li class="active">
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

            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-plain">
                                <div class="header">
                                    <h4 class="title">Data of articles </h4>
                                </div>
                                <div class="content table-responsive table-full-width">
                                    <table class="table table-hover">
                                        <thead class="thead-dark">
                                            <th>Designation</th>
                                            <th>Prix(unit)</th>
                                            <th>Quantite</th>
                                            <th>Descriptionr</th>
                                            <th>Categorier</th>
                                            <th>Marque</th>
                                            <th>Fournisseur</th>
                                            <th>Delete</th>
                                            <th>Edit</th>
                                        </thead>
                                        <tbody>
                                        <%
                                        for(Article a:artlist){
                                        %>
                                            <tr>
                                                <td><%=a.getArtdesignation() %></td>
                                                <td><%=a.getPrix() %></td>
                                                <td><%=a.getQtestock() %></td>
                                                <td><%=a.getArtdescription() %></td>
                                                <td><%=a.getCategorie().getCatlib() %></td>
                                                <td><%=a.getMarque().getMarqlib() %></td>
                                                <td><%=a.getFourrnisseur().getFourname() %></td>
                                                <td>
                                                    <form method="post" action="Controleur">
                                                        <input type="hidden" name="artid" value="<%=a.getArtid() %>">
                                                        <input type="hidden" name="operation" value="deleteart">
                                                        <button type="submit" class="btn btn-danger"><i
                                                                class="pe-7s-trash"
                                                                style="color: red; font-size: 20px;"></i></button>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form method="post" action="Controleur">
                                                        <input type="hidden" name="artid" value="<%=a.getArtid() %>">
                                                        <input type="hidden" name="operation" value="editart">
                                                        <button type="submit" class="btn btn-success"><i
                                                                class="pe-7s-tools"
                                                                style="color: green; font-size: 20px;"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                            <%} %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <hr style=" border-width:100%; width: 100%; border-style: inset;">

                        <div class="col-md-12">
                            <div class="card card-plain">
                                <div class="header">
                                    <h4 class="title">Data of Clients</h4>
                                </div>
                                <div class="content table-responsive table-full-width">
                                    <table class="table table-hover">
                                        <thead>
                                            <th>Name</th>
                                            <th>Sexe</th>
                                            <th>CIN</th>
                                            <th>Username</th>
                                            <th>Address</th>
                                            <th>City</th>
                                            <th>@mail</th>
                                            <th>Phone</th>
                                            <th>Delete</th>
                                            <th>Edit</th>
                                        </thead>
                                        <tbody>
                                       <%
						                 for (Client c : clientlist){			
					                   %>
                                            <tr>
                                                <td><%=c.getCltnom()+" "+c.getCltprenom() %></td>
                                                <td><%=c.getCltsexe() %></td>
                                                <td><%=c.getCltcin() %></td>
                                                <td><%=c.getCltlogin() %></td>
                                                <td><%=c.getCltaddresse() %></td>
                                                <td><%=c.getCltvile().getVilelib() %></td>
                                                <td><%=c.getCltemail() %></td>
                                                <td><%=c.getCltphone() %></td>
                                                <td>
                                                    <form method="post" action="Controleur">
                                                        <input type="hidden" name="clientid" value="<%=c.getCltid() %>">
                                                        <input type="hidden" name="operation" value="deleteclient">
                                                        <button type="submit" class="btn btn-danger"><i
                                                                class="pe-7s-trash"
                                                                style="color: red; font-size: 20px;"></i></button>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form method="post" action="Controleur">
                                                        <input type="hidden" name="clientid" value="<%=c.getCltid() %>">
                                                        <input type="hidden" name="operation" value="editclient">
                                                        <button type="submit" class="btn btn-success"><i
                                                                class="pe-7s-tools"
                                                                style="color: green; font-size: 20px;"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                            <%} %>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>

                    <hr style=" border-width:100%; width: 100%; border-style: inset;">

                    <div class="col-md-12">
                        <div class="card card-plain">
                            <div class="header">
                                <h4 class="title">Data of Fournisseur</h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                        <th>Name</th>
                                        <th>Address</th>
                                        <th>@mail</th>
                                        <th >Phone</th>
                                        <th>Description</th>
                                        <th>Delete</th>
                                        <th>Edit</th>
                                    </thead>
                                    <tbody>
                                     	<%
						                 for (Fourrnisseur four : fourlist){			
					                   %>
                                        <tr>
                                            <td><%=four.getFourname() %></td>
                                            <td><%=four.getFouraddresse() %></td>
                                            <td><%=four.getFouremail() %></td>
                                            <td><%=four.getFourphone() %></td>
                                            
                                            <td ><%=four.getFourdescription() %></td>
                                            <td>
                                                <form method="post" action="Controleur">
                                                    <input type="hidden" name="fourid" value="<%=four.getFourid()%>">
                                                    <input type="hidden" name="operation" value="deletefour">
                                                    <button type="submit" class="btn btn-danger"><i class="pe-7s-trash"
                                                            style="color: red; font-size: 20px;"></i></button>
                                                </form>
                                            </td>
                                            <td>
                                                <form method="post" action="Controleur">
                                                    <input type="hidden" name="fourid" value="<%=four.getFourid()%>">
                                                    <input type="hidden" name="operation" value="editfour">
                                                    <button type="submit" class="btn btn-success"><i class="pe-7s-tools"
                                                            style="color: green; font-size: 20px;"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                        <%} %>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
                <hr style=" border-width:100%; width: 100%; border-style: inset;">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card card-plain">
                            <div class="header">
                                <h4 class="title">Data of Marques </h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                        <th>Name of Marque</th>
                                        <th>Delete</th>
                                        <th>Edit</th>
                                    </thead>
                                    <tbody>
                                     <%
									  for (Marque marq : marqlist){			
								      %>
                                        <tr>
                                            <td><%=marq.getMarqlib() %></td>
                                            <td>
                                                <form method="post" action="Controleur">
                                                    <input type="hidden" name="marqid" value="<%=marq.getMarqid() %>">
                                                    <input type="hidden" name="operation" value="deletemarque">
                                                    <button type="submit" class="btn btn-danger"><i class="pe-7s-trash"
                                                            style="color: red; font-size: 20px;"></i></button>
                                                </form>
                                            </td>
                                            <td>
                                                <form method="post" action="Controleur">
                                                    <input type="hidden" name="marqid"value="<%=marq.getMarqid() %>">
                                                    <input type="hidden" name="operation" value="editmarque">
                                                    <button type="submit" class="btn btn-success"><i class="pe-7s-tools"
                                                            style="color: green; font-size: 20px;"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                        <%} %>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-plain">
                            <div class="header">
                                <h4 class="title">Data of Category</h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                        <th>Name of Categorie </th>
                                        <th>Delete</th>
                                        <th>Edit</th>
                                    </thead>
                                    <tbody>
                                       <%
								                 for (Categorie cat : catlist){			
							            %>
                                           <tr>
                                            <td><%=cat.getCatlib() %></td>
                                            <td>
                                                <form method="post" action="Controleur">
                                                    <input type="hidden" name="catid" value="<%=cat.getCatid() %>">
                                                    <input type="hidden" name="operation" value="deletecat">
                                                    <button type="submit" class="btn btn-danger"><i class="pe-7s-trash"
                                                            style="color: red; font-size: 20px;"></i></button>
                                                </form>
                                            </td>
                                            <td>
                                                <form method="post" action="Controleur">
                                                    <input type="hidden" name="catid" value="<%=cat.getCatid()%>">
                                                    <input type="hidden" name="operation" value="editcat">
                                                    <button type="submit" class="btn btn-success"><i class="pe-7s-tools"
                                                            style="color: green; font-size: 20px;"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                        <%} %>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card card-plain">
                            <div class="header">
                                <h4 class="title">Data of City</h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                        <th>City</th>
                                        <th>Delete</th>
                                        <th>Edit</th>
                                    </thead>
                                    <tbody>
                                      <%
						                 for (Ville v : citylist){			
					                   %>
                                        <tr>
                                            <td><%=v.getVilelib() %></td>
                                            <td>
                                                <form method="post" action="Controleur">
                                                    <input type="hidden" name="cityid" value="<%=v.getVileid() %>">
                                                    <input type="hidden" name="operation" value="deletecity">
                                                    <button type="submit" class="btn btn-danger"><i class="pe-7s-trash"
                                                            style="color: red; font-size: 20px;"></i></button>
                                                </form>
                                            </td>
                                            <td>
                                                <form method="post" action="Controleur">
                                                    <input type="hidden" name="cityid" value="<%=v.getVileid() %>">
                                                    <input type="hidden" name="operation" value="editcity1">
                                                    <button type="submit" class="btn btn-success"><i class="pe-7s-tools"
                                                            style="color: green; font-size: 20px;"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                        <%} %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

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
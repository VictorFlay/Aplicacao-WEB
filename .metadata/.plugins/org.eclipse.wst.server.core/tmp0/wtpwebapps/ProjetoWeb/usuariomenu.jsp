<%@page import="model.Usuario"%>
<%@page import="model.Passagem" %>
	<%
		String nivelusuario = (String) session.getAttribute("nivelusuario");
		int converte = new Usuario().convert(nivelusuario);
		String usuarios = new Usuario().usuarios();
		if(converte == 2){
	%>
<html lang="pt">
<head>


	
	<%@ page contentType="text/html; charset=UTF-8" %>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/design.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/design.css">
 	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
    <title>Usuários</title>

</head>
<body>

	<div class="container-fluid px-0">
		<div class="row">
			<div class="col-12 col-lg-12 center">
				<img src="img/menuadm.jpg" class="img-fluid" id="menuadm">
			</div>
		</div>
        
        <div class="row mt-2 ml-2">
			<div class="col-8 col-lg-10 justify-content-between ">
	             <a href="index.jsp">
			    	<button type="button" class="btn btn-primary">Voltar</button>
			    </a>
			 </div>  
			 
			<div class="col-1 col-lg-1 mt-2 ml-2">
				<div class="dropdown">
				  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				   ADM
				  </a>
				
				  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				    <a class="dropdown-item" href="adicionarlocalizacao.jsp">Adicionar Localização</a>
				    <a class="dropdown-item" href="adicionarpassagem.jsp">Adicionar Passagem</a>
				    <a class="dropdown-item" href="adicionarlinha.jsp">Adicionar Companhia Aérea</a>
				    <a class="dropdown-item" href="usuariomenu.jsp">Menu Usuário</a>
				  </div>
				</div>


		    </div>
			 
		</div>
		
		
		<div class="row justify-content-center mt-2">
			<div class="col-3 col-lg-3 text-center h2">
				Menu Administrador
			</div>
		</div>
	
	
		<div class="row justify-content-center mt-4">
			<div class="col-6 col-lg-3 text-center h2">
				Menu Usuário
			</div>
		</div>
	
		<div class="row justify-content-center mt-5">
			<div class="col-6 col-lg-5 text-center h3">
				Usuários
			</div>
		</div>
	
		<%
			out.print(usuarios);
		%>




	
	
	</div>
		
		

















	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/script.js"></script>
</body>


<% 	
		}
	else{
		response.sendRedirect("index.jsp");
	}
%>
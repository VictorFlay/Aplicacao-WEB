<%@page import="model.Localizacao"%>
<%@page import="model.Usuario"%>

<html lang="pt">
	<head>
	
		<%
			
			String nivelusuario = (String) session.getAttribute("nivelusuario");
			int converte = new Usuario().convert(nivelusuario);
			if(converte == 2){
		%>
		
		<!-- CSS -->
	    <link rel="stylesheet" type="text/css" href="css/design.css">
	   
	    
	    <!-- Bootstrap CSS -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	    <!-- JQUEY e AJAX -->
	     <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	    
	    <title>Altera��o</title>
	</head>
<body>

	<div class="container-fluid px-0">
		<div class="row">
			<div class="col-12 col-lg-12 center">
				<img src="img/menuadm.jpg" class="img-fluid" id="menuadm">
			</div>
		</div>
        
        <div class="row mt-2 ml-2">
			<div class="col-8 col-lg-9 justify-content-between ">
				<!-- N�o esquece de voltar com o id -->
	             <a href="passagens.jsp">
			    	<button type="button" class="btn btn-primary">Voltar</button>
			    </a>
			 </div>  
		</div>
		
		
		<div class="row justify-content-center mt-2">
			<div class="col-3 col-lg-3 text-center h2">
				Menu Administrador
			</div>
		</div>

		<div class="row justify-content-center mt-5">
			<div class="col-3 col-lg-3 text-center h2">
				Altera��o
			</div>
		</div>

		<div class="row justify-content-center mt-5">
			<div class="col-6 col-lg-3 text-center h3">
				Dados Atual
			</div>
		</div>
		
		

		<div class="row justify-content-center mt-4">
			<div class="col-6 col-lg-3 text-center h3">
				Alterar para
			</div>
		</div>
		

		
		
		

</div>
















	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/script.js"></script>
</body>

<% 
		}else{
			response.sendRedirect("index.jsp");
		}
%>
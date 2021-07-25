<%@page import="model.Localizacao"%>
<%@page import="model.Usuario"%>
<%@page import="model.Passagem" %>
<%@page import="model.LinhaAerea" %>
<html lang="pt">
<head>

	<%
		
		String idpassagem = request.getParameter("idpassagem");
		String id = request.getParameter("idlinha");
		String classe = request.getParameter("classe");
		String nome = (String) session.getAttribute("nome");
		String idusuario = (String) session.getAttribute("idusuario");
		String nivelusuario = (String) session.getAttribute("nivelusuario");
		int converte = new Usuario().convert(nivelusuario);
		String localizacao = new Localizacao().localizacoes();
		String linhaaerea = new LinhaAerea().linhaAereaEspecifica(idpassagem, id);
		String alterarlinha = new LinhaAerea().alterarLinha(idpassagem, id);
		if(converte == 2 && idusuario != null && idpassagem != null && id != null){
	%>
	
	<!-- CSS -->
    <link rel="stylesheet" type="text/css" href="css/design.css">
   
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
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
				Linha A�rea Original
			</div>
		</div>
		
		
		<%
			out.print(linhaaerea);
		%>

		<div class="row justify-content-center mt-4">
			<div class="col-6 col-lg-3 text-center h3">
				Alterar para
			</div>
		</div>
		
		<%
			out.print(alterarlinha);
		%>
		
		
		

</div>
















	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/script.js"></script>
</body>

<% 
		}else{
			response.sendRedirect("index.jsp");
		}
%>
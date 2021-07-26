<%@page import="model.Compra"%>
<%@page import="model.Usuario"%>
<%
	String idusuario = (String) session.getAttribute("idusuario");
	String nivelusuario = (String) session.getAttribute("nivelusuario");
	String historico = new Compra().compras(idusuario);
	int converte = new Usuario().convert(nivelusuario);
	if (converte == 1) {
		String nome = (String) session.getAttribute("nome");
%>
<html lang="pt">
<head>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="css/design.css">

<!-- JQUEY e AJAX -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- Bootstrap CSS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>

	<div class="container-fluid px-0">
		<!-- Imagem de fundo -->
		<div class="row">
			<div class="col-12 col-lg-12 center">
				<img src="img/historico.jpg" class="img-fluid" id="historico">
			</div>
		</div>

		<!-- Bot�o para retornar para o menu principal -->
		<div class="row mt-3 ml-2">
			<div class="col-8 col-lg-9 justify-content-between ">
				<a href="index.jsp">
					<button type="button" class="btn btn-primary">Menu Principal</button>
				</a>
			</div>
		</div>

		<div class="row justify-content-center mt-1">
			<div class="col-3 col-lg-3 text-center h1">Hist�rico</div>
		</div>
	
		<!-- Intera��o com o usu�rio -->
		<div class="row justify-content-center mt-5">
			<div class="col-3 col-lg-3 text-center h3">
				<% out.print("Ol� " + nome); %>
			</div>
		</div>

		<div class="row justify-content-center mt-1">
			<div class="col-3 col-lg-3 text-center h3">
				Hist�rico de compra
			</div>
		</div>

		<!-- Exibe o hist�rico -->
		<% out.print(historico); %>
	</div>
</body>
</html>

<!-- Apenas o ADM tem acesso a essa p�gina caso ao contr�rio � redirecionado para o index -->
<% } else { response.sendRedirect("index.jsp"); } %>

<%@page import="model.Localizacao"%>
<%@page import="model.Usuario"%>

<html lang="pt">
<head>
<%
	String nivelusuario = (String) session.getAttribute("nivelusuario");
	int converte = new Usuario().convert(nivelusuario);
	if (converte == 2) {
		int idlocalizacao = Integer.valueOf(request.getParameter("idlocalizacao"));
		Localizacao localizacao = new Localizacao();
		localizacao.setIdlocalizacao(idlocalizacao);
		String lugar = localizacao.selectLocalizacao();
%>

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

<title>Altera��o</title>
</head>
<body>

	<div class="container-fluid px-0">
		<!-- Imagem de fundo -->
		<div class="row">
			<div class="col-12 col-lg-12 center">
				<img src="img/menuadm.jpg" class="img-fluid" id="menuadm">
			</div>
		</div>

		<!-- Bot�o para voltar para p�gina anterior -->
		<div class="row mt-2 ml-2">
			<div class="col-8 col-lg-9 justify-content-between ">
				<a href="adicionarlocalizacao.jsp">
					<button type="button" class="btn btn-primary">Voltar</button>
				</a>
			</div>
		</div>


		<div class="row justify-content-center mt-2">
			<div class="col-3 col-lg-3 text-center h2">Menu Administrador</div>
		</div>

		<div class="row justify-content-center mt-5">
			<div class="col-3 col-lg-3 text-center h2">Altera��o</div>
		</div>

		<div class="row justify-content-center mt-5">
			<div class="col-6 col-lg-3 text-center h3">Dados Atual</div>
		</div>


		<div class="row justify-content-center">
			<% out.print(lugar); %>
		</div>

	</div>
	<script type="text/javascript" src="js/script.js"></script>
</body>

<!-- Somente o adm pode acessar essa p�gina caso contr�rio � redirecionado ao index -->
<%
	} else { response.sendRedirect("index.jsp"); }
%>
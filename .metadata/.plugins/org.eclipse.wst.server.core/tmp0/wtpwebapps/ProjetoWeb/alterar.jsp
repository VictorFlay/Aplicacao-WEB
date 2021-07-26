<%@page import="model.Usuario"%>
<%@page import="model.LinhaAerea"%>
<html lang="pt">
<head>

<%
	String idpassagem = request.getParameter("idpassagem");
	String id = request.getParameter("idlinha");
	String nivelusuario = (String) session.getAttribute("nivelusuario");
	int converte = new Usuario().convert(nivelusuario);
	if (converte == 2 && idpassagem != null && id != null) {
		String linhaaerea = new LinhaAerea().linhaAereaEspecifica(idpassagem, id);
		String alterarlinha = new LinhaAerea().alterarLinha(idpassagem, id);
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

		<!-- Retornar para tela anterior -->
		<div class="row mt-2 ml-2">
			<div class="col-8 col-lg-9 justify-content-between ">
				<a href="passagens.jsp">
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
			<div class="col-6 col-lg-3 text-center h3">Linha A�rea Original
			</div>
		</div>

		<!-- Exibe a linha a�rea selecionada -->
		<%
			out.print(linhaaerea);
		%>

		<div class="row justify-content-center mt-4">
			<div class="col-6 col-lg-3 text-center h3">Alterar para</div>
		</div>

		<!-- Exibe um formul�rio para alterar a linha a�rea -->
		<%
			out.print(alterarlinha);
		%>

	</div>

	<script type="text/javascript" src="js/script.js"></script>
</body>

<!-- Apenas ADM pode acessar essa tela caso ao contr�rio � mandado de volta para o index -->
<% } else {	response.sendRedirect("index.jsp"); } %>
<%@page import="model.Usuario"%>
<%@page import="model.Passagem"%>

<%
	String nivelusuario = (String) session.getAttribute("nivelusuario");
	int converte = new Usuario().convert(nivelusuario);
	String passagem = new Passagem().passagemDisponivel();
	if (converte == 2) {
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

<title>Companhia A�rea</title>

</head>
<body>

	<div class="container-fluid px-0">
		<div class="row">
			<!-- Imagem de fundo -->
			<div class="col-12 col-lg-12 center">
				<img src="img/menuadm.jpg" class="img-fluid" id="menuadm">
			</div>
		</div>

		<!-- Bot�o para retornar para p�gina anterior -->
		<div class="row mt-2 ml-2">
			<div class="col-8 col-lg-9 justify-content-between ">
				<a href="index.jsp">
					<button type="button" class="btn btn-primary">Voltar</button>
				</a>
			</div>

			<!--  Menu ADM -->
			<div class="col-1 col-lg-1 mt-2 ml-2">
				<div class="dropdown">
					<a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ADM </a>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="adicionarlocalizacao.jsp">Localiza��o</a> 
						<a class="dropdown-item" href="adicionarpassagem.jsp">Passagem</a> 
						<a class="dropdown-item" href="adicionarlinha.jsp">Companhia A�rea</a> 
						<a class="dropdown-item" href="usuariomenu.jsp">Usu�rio</a>
					</div>
				</div>
			</div>
		</div>


		<div class="row justify-content-center mt-2">
			<div class="col-3 col-lg-3 text-center h2">Menu Administrador</div>
		</div>


		<div class="row justify-content-center mt-4">
			<div class="col-6 col-lg-3 text-center h2">Adicionar Linha A�rea</div>
		</div>

		<div class="row justify-content-center mt-5">
			<div class="col-6 col-lg-5 text-center h3">Formul�rio para adicionar linha</div>
		</div>

		<!-- Formul�rio para adicionar uma companhia a�rea -->
		<div class="row justify-content-center mt-2">
			<div class="col-lg-9 mt-1">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title text-center">Dados</h4>
						<form id="linha-form" method="POST">
							<div class="form-row">
								<div class="form-group col-md-3">
									<label for="cxpassagem" class="h6">Selecione a Passagem:</label>
									<% out.print(passagem); %>
								</div>
								<div class="form-group col-md-2 ml-5">
									<label for="cxnome" class="h6">Empresa</label> 
									<input type="text" class="form-control" id="cxnome" name="cxnome" placeholder="Nome empresa...">
								</div>

								<div class="form-group col-md-2 ml-5">
									<label for="cxpreco" class="h6">Pre�o: </label> 
									<input type="text" class="form-control" id="cxpreco" name="cxpreco" placeholder="Digite o pre�o...">
								</div>

								<div class="form-group col-md-3 ml-5">
									<label for="cxclasse" class="h6">Classe: </label> <select
										id="cxclasse" name="cxclasse" class="form-control">
										<option selected value="1">Classe Econ�mica</option>
										<option value="2">Classe Executiva</option>
									</select>
								</div>
							</div>
							<div class="row justify-content-center">
								<div class="form-group col-md-1">
									<button type="submit" class="btn btn-primary">Adicionar</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="js/script.js"></script>
</body>

<!-- Apenas administrador tem acesso a essa p�gina -->
<% } else { response.sendRedirect("index.jsp"); } %>
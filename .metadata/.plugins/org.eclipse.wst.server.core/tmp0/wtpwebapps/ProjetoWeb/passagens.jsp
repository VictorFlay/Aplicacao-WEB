<%@page import="model.Localizacao"%>
<%@page import="model.Usuario"%>
<%@page import="model.Passagem"%>
<%@page import="model.LinhaAerea"%>
<html lang="pt">
<head>

<%
	String idpassagem = request.getParameter("idpassagem");
	String id = request.getParameter("id");
	String classe = request.getParameter("classe");
	String nome = (String) session.getAttribute("nome");
	String idusuario = (String) session.getAttribute("idusuario");
	String nivelusuario = (String) session.getAttribute("nivelusuario");
	int converte = new Usuario().convert(nivelusuario);
	String localizacao = new Localizacao().localizacoes();
	String classes = new LinhaAerea().classes();
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

<title>Passagem</title>

</head>
<body>

	<div class="container-fluid px-0">
		<!-- Foto de fundo -->
		<div class="row">
			<div class="col-12 col-lg-12 center">
				<img src="img/aviao.jpg" class="img-fluid" id="aviaofundo">
			</div>
		</div>

		<div class="row">
			<div class="col-9 col-lg-9 justify-content-between mt-4 ml-2">
				<a href="index.jsp">
					<button type="button" class="btn btn-primary">
					Menu Principal</button>
				</a>
			</div>

			<!-- Cont�udo que apenas o visitante tem acesso -->
			<% if (converte == 0) { %>
			<div class="col-1 col-lg-1 mt-4">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#login" data-whatever="@mdo">Login</button>
					<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Login</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form method="POST" id="login-form">
									<div class="form-group">
										<!-- Mensagem de erro na hora de logar -->
										<div class="alert alert-danger center" role="alert" id="errologin"></div>
										<label for="login" class="col-form-label">Login:</label> <input type="text" class="form-control" id="username" name="username">
									</div>

									<div class="form-group">
										<label for="senha" class="col-form-label">Senha:</label> <input type="password" class="form-control" id="senha" name="senha">
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Fechar</button>
										<button type="submit" class="btn btn-primary">Entrar</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-1 col-lg-1 mt-4">
				<!-- Registrar -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#registrar" data-whatever="@mdo">Registrar</button>
				<div class="modal fade" id="registrar" tabindex="-1" role="dialog" aria-labelledby="registrar" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="register">Registrar</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form method="POST" id="register-form">
								
									<!-- Erro na hora de cadastrar -->
									<div class="alert alert-danger center" role="alert" id="erro">
										Nome ou Login j� cadastrado!
									</div>
									
									<div class="form-group">
										<label for="nome" class="col-form-label">
											Nome Completo:
										</label> 
										<input type="text" class="form-control" id="nome"name="nome" placeholder="Nome completo">
									</div>

									<div class="form-group">
										<label for="login" class="col-form-label">Login:</label> <input type="text" class="form-control" id="cxlogin" name="cxlogin" placeholder="Login">
									</div>

									<div class="form-group">
										<label for="senha" class="col-form-label">Senha:</label> 
										<input type="password" class="form-control" id="cxsenha"name="cxsenha" placeholder="Senha">
									</div>

									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="telefone" class="col-form-label">Telefone:</label>
											<input type="text" class="form-control" id="telefone" placeholder="Digite seu telefone..." name="telefone">
										</div>

										<div class="form-group col-md-3 ml-4">
											<label for="estado" class="col-form-label">Estado</label> <select
												id="estado" class="form-control">
												<option value="AC" selected>AC</option>
												<option value="AL">AL</option>
												<option value="AP">AP</option>
												<option value="AM">AM</option>
												<option value="BA">BA</option>
												<option value="CE">CE</option>
												<option value="ES">ES</option>
												<option value="GO">GO</option>
												<option value="MA">MA</option>
												<option value="MT">MT</option>
												<option value="MS">MS</option>
												<option value="MG">MG</option>
												<option value="PA">PA</option>
												<option value="PB">PB</option>
												<option value="PR">PR</option>
												<option value="PE">PE</option>
												<option value="PI">PI</option>
												<option value="RJ">RJ</option>
												<option value="RN">RN</option>
												<option value="RS">RS</option>
												<option value="RO">RO</option>
												<option value="RR">RR</option>
												<option value="SC">SC</option>
												<option value="SP">SP</option>
												<option value="SE">SE</option>
												<option value="TO">TO</option>
												<option value="DF">DF</option>
											</select>
										</div>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Fechar</button>
										<button type="submit" class="btn btn-primary">Entrar</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- N�vel usu�rio -->
			<% } else if (converte == 1) { %>
			
			<!-- Menu do usu�rio -->
			<div class="col-1 col-lg-1 mt-4 ml-4">
				<div class="dropdown">
					<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Perfil </a>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="historico.jsp">Hist�rico</a>
					</div>
				</div>
			</div>

			<!-- Deslogar -->
			<div class="col-1 col-lg-1 mt-4 ml-4">
				<a href="deslogar.jsp?pag=1">
					<button type="button" class="btn btn-primary">Deslogar</button>
				</a>
			</div>
		</div>

		<!-- N�vel ADM -->
		<% } else { %>
		
		<!-- Menu do ADM -->
		<div class="col-4 col-lg-1 mt-4 ml-2">
			<div class="dropdown">
				<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
					id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> ADM </a>

				<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<a class="dropdown-item" href="adicionarlocalizacao.jsp">Localiza��o</a> 
					<a class="dropdown-item" href="adicionarpassagem.jsp">Passagem</a> 
					<a class="dropdown-item" href="adicionarlinha.jsp">Companhia A�rea</a> 
					<a class="dropdown-item" href="usuariomenu.jsp">Usu�rio</a>
				</div>
			</div>
		</div>

		<!-- Deslogar -->
		<div class="col-4 col-lg-1 mt-4 ml-4">
			<a href="deslogar.jsp?pag=2&idpassagem=<%=idpassagem%>">
				<button type="button" class="btn btn-primary">Deslogar</button>
			</a>
		</div>

		<%	} %>

	</div>

	<form method="POST" id="buscar-form">
		<div class="form-row mt-5 ml-5">
			<div class="col-5 col-lg-3 buscarlocalizacao mt-4 ml-5">
				<% out.print(localizacao); %>
				<div class="jss30">
					<p>Buscar Localiza��o dispon�vel</p>
				</div>
				<div class="jss31">Qual pa�s voc� deseja viajar ?</div>
			</div>

			<div class="col-4 col-lg-3 classe mt-4 ml-5">
				<select multiple class="form-control buscarclasse">
					<option value="1" class="jss32">Classe Econ�mica</option>
					<option value="2" class="jss32">Classe Executiva</option>
				</select>

				<div class="jss30">
					<p>Seleciona o tipo de classe</p>
				</div>
				<div class="jss33">Qual classe voc� deseja viajar ?</div>
			</div>

			<div class="col-1 col-lg-1 mt-4 ml-5">
				<button type="submit" class="btn btn-success buscarlinha">Buscar</button>
			</div>
		</div>
	</form>
	
	<!-- Exibe mensagem de erro -->
	<div class="row justify-content-center mt-5" id="errobuscalinha">
		<div class="col-3 text-center" id="errobusca"></div>
	</div>

	<!-- Cr�ditos -->
	<div class="row">
		<div class="col-lg-6 mt-2 invisible">Cr�ditos: Kaique</div>
	</div>

	<!-- Exibe mensagem da quantidade de elementos -->
	<div class="row mt-5">
		<div class="col-lg-6 mt-5 ml-4 h6">
			<%
				if (idpassagem != null || idpassagem != "") {
					String quantidade = new LinhaAerea().quantidadeocaLinhaAerea(idpassagem, id, classe);
					out.print(quantidade);
				}
			%>
		</div>
	</div>

	<!-- Exibe dados da linha a�rea -->
	<%
		if (idpassagem != null) {
			String dadospassagem = new LinhaAerea().dadosLinha(idpassagem, converte, idusuario);
			out.print(dadospassagem);
		} else if (id != null && classe != null) {
			String dadospassagem = new LinhaAerea().dadosLinhabusca(id, classe, converte, idusuario);
			out.print(dadospassagem);
		}
	%>

	<script type="text/javascript" src="js/script.js"></script>
</body>
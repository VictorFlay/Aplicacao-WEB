<%@page import="model.Usuario"%>
<%@page import="model.Localizacao"%>
<%@page import="model.Passagem" %>
<%@page import="model.LinhaAerea" %>
<%@page import="model.LinhaAerea" %>

<html lang="pt">
<head>
	<%@ page contentType="text/html; charset=UTF-8" %>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/design.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <title>Agência</title>
    <%
    	String carousel = new Passagem().CarouselPromocao();
    	String carouselcards = new Passagem().CarouselCards();
    	String nome = (String) session.getAttribute("nome");
    	String localizacao = new Localizacao().localizacoes();
		String nivelusuario = (String) session.getAttribute("nivelusuario");
		int converte = new Usuario().convert(nivelusuario);
		
    %>
</head>
<body>


	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    

    <div class="container-fluid px-0">
     
     <div class="row">
			<div class="col-12 col-lg-12 center">
				<img src="img/menu.jpg" class="img-responsive" alt="Responsive image" id="imagem">
			</div>
		</div>
     
     
        
    

    <div class="row">
    
    
        <div class="col-8 col-lg-9 justify-content-between mt-4 ml-2" id="mensagem">
            "Seu primeiro destino é aqui"
        </div>
        
  	
  	
	<% if(converte == 0){ %>
    <div class="col-1 col-lg-1 mt-4">
      			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#login" data-whatever="@mdo">Login</button>
				
				<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">Login</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <form method="POST" id="login-form">
				          <div class="form-group">
				          	<div class="alert alert-danger center" role="alert" id="errologin">
  								
							</div>
				          
				            <label for="login" class="col-form-label">Login:</label>
				            <input type="text" class="form-control" id="username" name="username">
				          </div>
				          
				          <div class="form-group">
				          
							<label for="senha" class="col-form-label">Senha:</label>
				            <input type="password" class="form-control" id="senha" name="senha">
				       
				          </div>
				          
				          
				        
				      
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
				        <button type="submit" class="btn btn-primary">Entrar</button>
				      </div>
				      </form>
				      </div>
				    </div>
				  </div>
				</div>
      
      
      
    </div>

<div class="col-1 col-lg-1 mt-4">
      			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#registrar" data-whatever="@mdo">Registrar</button>
				
				<div class="modal fade" id="registrar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">Registrar</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <form method="POST" id="register-form">
				        	<div class="alert alert-danger center" role="alert" id="erro">
  								Nome ou Login já cadastrado!
							</div>
				          <div class="form-group">
				            <label for="nome" class="col-form-label">Nome Completo:</label>
				            <input type="text" class="form-control" id="nome" name="nome">
				          </div>
				          
				          <div class="form-group">
							<label for="login" class="col-form-label">Login:</label>
				            <input type="text" class="form-control" id="cxlogin" name="cxlogin">
				          </div>
				          
				          <div class="form-group">
							<label for="senha" class="col-form-label">Senha:</label>
				            <input type="password" class="form-control" id="cxsenha" name="cxsenha">
				          </div>
				         
				         <div class="form-row">
						<div class="form-group col-md-6">
							<label for="telefone" class="col-form-label">Telefone:</label>
				            <input type="text" class="form-control" id="telefone" placeholder="Digite seu telefone..." name="telefone">
				          </div>
				          
	
						<div class="form-group col-md-3 ml-4">
							<label for="estado" class="col-form-label">Estado</label>
      						<select id="estado" class="form-control">
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
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
				        <button type="submit" class="btn btn-primary">Entrar</button>
				      </div>
				      </form>
				      </div>
				    </div>
				  </div>
				</div>
  			</div>
	<% }
	
	else if(converte == 1){
	%>

	
		<div class="row justify-content-end">
			<div class="col-1 col-lg-1 mt-4 ml-4">
				<a href="deslogar.jsp?pag=1">
				<button type="button" class="btn btn-primary">Deslogar</button>
		        </a>
		    </div>
	    </div>
  

	<% } else{%>
	
				    <div class="col-1 col-lg-1 mt-4 ml-2">
				<div class="dropdown">
				  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				   ADM
				  </a>
				
				  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				    <a class="dropdown-item" href="adicionarlocalizacao.jsp">Adicionar Localização</a>
				    <a class="dropdown-item" href="adicionarpassagem.jsp">Adicionar Passagem</a>
				    <a class="dropdown-item" href="adicionarlinha.jsp">Adicionar Companhia Aérea</a>
				    <a class="dropdown-item" href="usuariomenu.jsp">Menu Usuários</a>
				  </div>
				</div>


		    </div>
	

		<div class="col-1 col-lg-1 mt-4 ml-4">
			<a href="deslogar.jsp?pag=1">
			<button type="button" class="btn btn-primary">Deslogar</button>
	        </a>
	    </div>
	
	<% } %>

	</div>
    <div class="row">
        <div class="col-12 col-lg-3 ml-2" id="mensagem2">
            Aqui você encontra os melhores preços para viajar
        </div>
    </div>

	<form method="POST" id="buscar-form" >
    <div class="row mt-4">
        <div class="col-2 col-lg-2 aeroporto mt-4 ml-4">
            <div class="jss30"><p>Origem</p></div>
            <div class="jss35">GRU - Aeroporto</div>
        </div>

	
		<div class="col-3 col-lg-3 buscarlocalizacao mt-4 ml-5">
				
				<% out.print(localizacao); %>
            	<div class="jss30"><p>Buscar Localização</p></div>
            	<div class="jss31">Qual país você deseja viajar ?</div>
        </div>

				<div class="col-3 col-lg-3 classe mt-4 ml-5">
					<select multiple class="form-control buscarclasse">
						<option value="1" class="jss32">Classe Econômica</option>
						<option value="2"  class="jss32">Classe Executiva</option>
					</select>
					
				
            		<div class="jss30"><p>Seleciona a classe</p></div>
            		<div class="jss33">Qual classe você deseja viajar ?</div>
        		</div>
		
		<div class="col-1 col-lg-1 mt-4 ml-5">
			<button type="submit" class="btn btn-success buscarlinha">Buscar</button>
			
		</div>
       
      </div>
      </form>
      
      <div class="row justify-content-center mt-5" id="errobuscalinha">
        	<div class="col-3 text-center" id="errobusca"></div>
    	</div>

	

      <div class="row mt-5">
        <div class="col-6 col-lg-6 jss37 mt-5" id="titulo">
           <div class="row justify-content-center mt-5" id="mensagem"">
          		Passagens na promoção
           </div>
           
			<div class="row justify-content-center" id="mensagem"">
          		Basta clicar na imagem ao lado
          		</div>


         </div>
         <div class="col-6 col-lg-5 mt-5">
			<% out.print(carousel); %>
         </div>

		</div>
		
		<div class="row">
			        <div class="col-12 col-lg-12 ">
            <div class="mx-auto msg mt-4" style="width: 500px;">
  				Passagens com preços imbatíveis
			</div>
         </div>
		</div>
		
		
		<div class="row mt-4">
			<div class="col-sm-12">
				
				<% out.print(carouselcards); %>
				
			</div>
		</div>
		
		
</div>







<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/script.js"></script>






</body>
</html>
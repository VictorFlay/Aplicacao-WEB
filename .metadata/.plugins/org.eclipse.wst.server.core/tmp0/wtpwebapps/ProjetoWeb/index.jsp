<%@page import="model.Passagem" %>
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
    
    <title>Document</title>
    <%
    	String carousel = new Passagem().CarouselPromocao();
    	String carouselcards = new Passagem().CarouselCards();
    %>
</head>
<body>


	<link rel="stylesheet" type="text/css" href="css/design.css">
 	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    

    <div class="container-fluid px-0">
     
     
        <img src="img/menu.jpg" class="img-responsive" alt="Responsive image" id="imagem">
    

    <div class="row">
    
    
        <div class="col-12 col-lg-9 justify-content-between mt-4 ml-2" id="mensagem">
            "Seu primeiro destino é aqui"
        </div>
        
  	
  	

    <div class="col-4 col-lg-1 mt-4">
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
				            <label for="login" class="col-form-label">Login:</label>
				            <input type="text" class="form-control" id="username" name="username">
				          </div>
				          
				          <div class="form-group">
				          
							<label for="senha" class="col-form-label">Senha:</label>
				            <input type="password" class="form-control" id="senha" name="senha">
				       
				          </div>
				          
				          
				        
				      
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        <button type="submit" class="btn btn-primary">Send message</button>
				      </div>
				      </form>
				      </div>
				    </div>
				  </div>
				</div>
      
      
      
    </div>
<div class="col-4 col-lg-1 mt-4">
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
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        <button type="submit" class="btn btn-primary">Send message</button>
				      </div>
				      </form>
				      </div>
				    </div>
				  </div>
				</div>
  </div>

        
        
        
    </div>

    <div class="row">
        <div class="col-12 col-lg-3 ml-2" id="mensagem2">
            Aqui você encontra os melhores preços para viajar
        </div>
    </div>

    <div class="row">
        <div class="col-2 col-lg-1 mt-4 ml-2">
            <div class="form-check" >
                <input class="form-check-input" type="radio" name="exampleRadios" id="radio1" value="option1" checked>
                <label class="form-check-label jss29 ml-2 mt-1" for="exampleRadios1">
                    Ida e volta
                </label>
            </div>
        </div>

        <div class="col-2 col-lg-1 mt-4 ml-2">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="exampleRadios" id="radio1" value="option1">
                <label class="form-check-label jss29 ml-2 mt-1" for="exampleRadios1">
                    Somente ida
                </label>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-5 col-lg-2 mt-4 ml-4" id="origem">
            <div class="jss1"><p>Origem</p></div>
            <div class="jss2">De onde você vai sair ?</div>
        </div>

        <div class="col-5 col-lg-2 mt-4 ml-4" id="destino">
            <div class="jss3">Destino</div>
            <div class="jss4">Para onde vai?</div>
        </div>

        <div class="col-5 col-lg-2 mt-4 ml-4" id="calendario">
            <img src="img/calendario.jpg" width="25px" height="25px" id="iconecalendario">
            <div class="jss5">Escolha as datas</div>
        </div>

        <div class="col-5 col-lg-2 mt-4 ml-4" id="passageiro">
            <div id="perfil">
                <img src="img/perfil.png" width="40px" height="40px" >
            </div>
            <div class="jss6">1 Passageiro</div>
        </div>

		

       
      </div>

	<div class="row mt-5">
		 <div class="col-sm-6 col-lg-2">
		.
        </div>
	</div>
	

      <div class="row mt-5">
        <div class="col-6 col-lg-6 ">
            Um dia você aprende que as verdadeiras amizades continuam a crescer, mesmo a longas distâncias. E o que importa não é o que você tem na vida, mas quem tem na vida. Aprende que não temos que mudar de amigos, se compreendermos que os amigos mudam.
         </div>
         <div class="col-6 col-lg-5">
			<% out.print(carousel); %>
         </div>
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
		
		









    <script type="text/javascript">
    
    
    
    
    
        $(document).ready(function(){
            $('.primeirabarra').click(function(){
                $('.origem').css({'visibility': 'visible'});
            });

        });

        $('.quartabarra').click(function(){
            $('.barrapassageiroescondido').css({'visibility': 'visible'});
        });


        
        var countadulto = 0;

        $('.jss22').click(function(){
            if(countadulto >= 0 && countadulto < 9){
                countadulto++;
                $('.jss23').val(countadulto);
                var i = countadulto;
                if(i > 0){
                    $('.jss153').attr("src", "img/diminuir.png");
                }
                if(i == 9){
                    $('.jss154').attr("src", "img/aumentardesativado.png");
                    $('.jss22').css({'cursor': 'default'});
                }
                aplicar($('.jss23').val(), $('.jss28').val());
            }
        });


        $('.jss21').click(function(){
            if(countadulto > 0 && countadulto <= 9){
                countadulto--;
                $('.jss23').val(countadulto);
                $('.jss154').attr("src", "img/aumentar.png");
                if(countadulto == 0){
                    $('.jss153').attr("src", "img/diminuirdesativado.png");
                }
                aplicar($('.jss23').val(), $('.jss28').val());
            }
        });
        




        var countcrianca = 0;

    $('.jss26').click(function(){
        if(countcrianca >= 0 && countcrianca < 9){
            countcrianca++;
            $('.jss28').val(countcrianca);
            var i = countcrianca;
            if(i > 0){
                $('.jss155').attr("src", "img/diminuir.png");
            }
            if(i == 9){
                $('.jss156').attr("src", "img/aumentardesativado.png");
                $('.jss26').css({'cursor': 'default'});
            }
            aplicar($('.jss23').val(), $('.jss28').val());
        }
    });

    $('.jss25').click(function(){
        if(countcrianca > 0 && countcrianca <= 9){
            countcrianca--;
            $('.jss28').val(countcrianca);
            $('.jss156').attr("src", "img/aumentar.png");
            if(countcrianca == 0){
                $('.jss155').attr("src", "img/diminuirdesativado.png");
            }
            aplicar($('.jss23').val(), $('.jss28').val());
        }
    });

    
        
    function aplicar(adulto, crianca){
            if(adulto > 0 || crianca > 0){
                $('.jss20').css({'color': 'black', 'cursor': 'pointer'});
            }
            if(adulto == 0 && crianca == 0){
                $('.jss20').css({'color': 'grey', 'cursor': 'default'});
            }

        }

        




        $('.jss152').click(function(){
            $('.jss16').css({'background-color': 'white'});
            $('.jss17').css({'background-color': 'cornflowerblue'});
            $('.jss17').prop('checked', true);
        });

        $('.jss151').click(function(){
            $('.jss18').prop('disabled', true);
            $('.jss16').css({'background-color': 'cornflowerblue'});
            $('.jss17').css({'background-color': 'white'});
            $('.jss16').prop('checked', true);
        });

        





            $('#aumentar').click(function(){
                count++;
                $('.jss69').val(count);
            });

            $('#diminuir').click(function(){
                count--;
                $('#testar').text(count);
            });
        
            
            $('.jss20').prop("readonly", true);


			$( '#login-form' ).submit(function(event){
				
				event.preventDefault();
				var data ={
						login: $('#username').val(),
						senha: $('#senha').val(),
				}
				
				
				
				$.ajax({
					url: "${pageContext.request.contextPath}/Auth",
					type: "post",
					dataType: "json",
					data: data,
					success: function(data, textStatus, jqXHR){
						if(data.status){
							window.location.href = 'teste1.jsp';
						}else{
							alert(data.mensagem);
						}
					
					}
				})
				

				
				
				
			});
			
			
			
			$( '#register-form' ).submit(function(event){
				
				event.preventDefault();
				var data ={
						nome: $('#nome').val(),
						login: $('#cxlogin').val(),
						senha: $('#cxsenha').val(),
						telefone: $('#telefone').val(),
						estado: $('#estado').val()
				}
				
				
				$.ajax({
					url: "${pageContext.request.contextPath}/Register",
					type: "post",
					dataType: "json",
					data: data,
					success: function(data, textStatus, jqXHR){
						if(data.status){
							alert(data.mensagem);
							window.location.href = 'teste1.jsp';
						}else{
							alert(data.mensagem);
						}
					
					}
				})
				

				
				
				
			});
			
			
    </script>









</body>
</html>
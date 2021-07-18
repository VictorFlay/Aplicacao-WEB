$(document).ready(function(){


	$('.primeirabarra').click(function(){
            $('.origem').css({'visibility': 'visible'});
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
				url: "/ProjetoWeb/Auth",
				type: "post",
				dataType: "json",
				data: data,
				success: function(data, textStatus, jqXHR){
					if(data.status){
						
						window.location.href = $(location).attr('href');
					}else{
						$( '#errologin' ).text( data.mensagem );
						$( '#errologin' ).css({'display': 'block'});
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
				url: "/ProjetoWeb/Register",
				type: "post",
				dataType: "json",
				data: data,
				success: function(data, textStatus, jqXHR){
					if(data.status){
						alert(data.mensagem);
						window.location.href = 'teste1.jsp';
					}else{
						$( '#erro' ).text( data.mensagem );
						$( '#erro' ).css({'display': 'block'});
					}
				
				}
			})
			
		});
		
		$('.buscarlocalizacao').on('click', function(){

			$('.buscarloca').css({'visibility': 'visible'});
			$('.buscarlocalizacao').css({'visibility': 'hidden'});
		});
	
		
		$('.buscarloca').on('click', function(e){
			e.stopPropagation();
			$('.buscarlocalizacao').css({'visibility': 'visible'});
			$('.buscarloca').css({'visibility': 'hidden'});
			$('.jss31').text($( ".buscarloca option:selected" ).text());
		});
			
		
		$('.classe').on('click', function(){
			$('.buscarclasse').css({'visibility': 'visible'});
			$('.classe').css({'visibility': 'hidden'});
		});
	
		$('.buscarclasse').on('click', function(e){
			e.stopPropagation();
			$('.classe').css({'visibility': 'visible'});
			$('.buscarclasse').css({'visibility': 'hidden'});
			$('.jss33').text($( ".buscarclasse option:selected" ).text());
		});
		
		
		
		 $(document).mouseup(function(e){
			$('.buscarloca').css({'visibility': 'hidden'});
			$('.buscarlocalizacao').css({'visibility': 'visible'});

	      });
	

		 $( '#buscar-form' ).submit(function(event){
			 	
				 
				var data ={
						idlocalizacao: $('select.buscarloca').children("option:selected").val(),
						classe: $("select.buscarclasse").children("option:selected").val(),
				}	
				
				$.ajax({
					url: "/ProjetoWeb/Search",
					type: "post",
					dataType: "json",
					data: data,
					success: function(data, textStatus, jqXHR){
						if(data.status){
							
							window.location.href = "passagens.jsp?id="+data.id+"&classe="+data.classe;
						}else{
							alert(data.mensagem);
						}
					
					}
				})
				
			});
		 

});
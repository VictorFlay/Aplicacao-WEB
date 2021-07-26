<%@page import="model.Usuario"%>
<%
	int nivel = Integer.valueOf(request.getParameter("nivelusuario"))==1? 2:1;
	int idusuario = Integer.valueOf(request.getParameter("idusuario"));
	String nivelusuario = (String) session.getAttribute("nivelusuario");
	int converte = new Usuario().convert(nivelusuario);

	if(converte == 2){
		Usuario usuario = new Usuario();
		usuario.setIdUsuario(idusuario);
		usuario.setNivelusuario(nivel);
		usuario.alterarUsuario();
		response.sendRedirect("usuariomenu.jsp");
		
	}else{
		response.sendRedirect("index.jsp");
	}

	
%>
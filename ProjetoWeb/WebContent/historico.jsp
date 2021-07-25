<%@page import="model.Usuario"%>
<%
	String nivelusuario = (String) session.getAttribute("nivelusuario");
	int converte = new Usuario().convert(nivelusuario);
	if(converte == 1){
		out.print("olá usuario normal");
	}else{
		response.sendRedirect("index.jsp");
	}

%>
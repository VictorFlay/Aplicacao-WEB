<%@page import="model.Usuario"%>
<%@page import="model.Compra"%>
<%
	String nivelusuario = (String) session.getAttribute("nivelusuario");
	int converte = new Usuario().convert(nivelusuario);
	String idusuario = request.getParameter("idusuario");
	String idpassagem = request.getParameter("idpassagem");
	String idlinha = request.getParameter("idlinha");
	
	
	
	if((idusuario != null && idpassagem != null && idlinha != null) && converte == 1){
		Compra compra = new Compra(idusuario, idpassagem, idlinha);
		compra.save();
		response.sendRedirect("passagens.jsp");
	}else{
		response.sendRedirect("index.jsp");
	}
	
		
%>
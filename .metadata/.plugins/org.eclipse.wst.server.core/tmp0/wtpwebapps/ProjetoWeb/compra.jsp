<%@page import="model.Compra"%>
<%
	String nivelusuario = (String) session.getAttribute("nivelusuario");
	String idusuario = request.getParameter("idusuario");
	String idpassagem = request.getParameter("idpassagem");
	String idlinha = request.getParameter("idlinha");
	if((idusuario != null && idpassagem != null && idlinha != null) && nivelusuario != null){
		Compra compra = new Compra(idusuario, idpassagem, idlinha);
		compra.save();
		response.sendRedirect("passagens.jsp");
	}else{
		response.sendRedirect("passagens.jsp");
	}

	
		
%>
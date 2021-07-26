<%@page import="model.Usuario"%>
<%@page import="model.Compra"%>
<%
	String nivelusuario = (String) session.getAttribute("nivelusuario");
	int converte = new Usuario().convert(nivelusuario);
	String idusuario = request.getParameter("idusuario");
	String idpassagem = request.getParameter("idpassagem");
	String idlinha = request.getParameter("idlinha");
	String classe = request.getParameter("classe");
	
	
	if((idusuario != null && idpassagem != null && idlinha != null && classe != null) && converte == 2){
		new Usuario().excluir(idpassagem, idlinha);
		response.sendRedirect("passagens.jsp?id="+idpassagem+"&classe="+classe);
	}
	//Só ADM pode excluir um usuário caso contrário é redirecionado para passagens
	else{
		response.sendRedirect("passagens.jsp");
	}
%>

<%@page import="model.Usuario"%>
<%
	String nome = request.getParameter("cxnome") == "" ? null : request.getParameter("cxnome");;
	String classe = request.getParameter("cxclasse");
	String preco = request.getParameter("cxpreco") == "" ? null : request.getParameter("cxpreco");
	String nivelusuario = (String) session.getAttribute("nivelusuario");
	int converte = new Usuario().convert(nivelusuario);
	
	if(nome != null && classe != null & preco != null && converte == 2){
		out.print("nome: " + nome + "classe: " + classe + "preco: " + preco);
	}else{
		response.sendRedirect("index.jsp");
	}
	

	
%>
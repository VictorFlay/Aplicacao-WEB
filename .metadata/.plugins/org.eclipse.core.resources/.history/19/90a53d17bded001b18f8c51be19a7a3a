<%@page import="model.Passagem"%>
<%@page import="model.Usuario"%>
<%
	int idpassagem = Integer.valueOf(request.getParameter("idpassagem"));
	String nivelusuario = (String) session.getAttribute("nivelusuario");
	int converte = new Usuario().convert(nivelusuario);
	
	if(converte == 2){
		Passagem passagem = new Passagem();
		passagem.setIdPassagem(idpassagem);
		passagem.deletePassagem();
		response.sendRedirect("adicionarpassagem.jsp");
	}else{
		response.sendRedirect("index.jsp");
	}
%>
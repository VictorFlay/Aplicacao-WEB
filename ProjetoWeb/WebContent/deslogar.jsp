<%
	int pag = Integer.valueOf(request.getParameter("pag"));
	String idpassagem = request.getParameter("idpassagem");
	session.invalidate();
	
	//Ap�s deslogar ele � redirecionado para mesma p�gina
	if(pag == 2){ response.sendRedirect("passagens.jsp"); }
	
	//Ap�s deslogar ele � redirecionado para mesma p�gina
	if(pag == 1){ response.sendRedirect("index.jsp"); }

%>
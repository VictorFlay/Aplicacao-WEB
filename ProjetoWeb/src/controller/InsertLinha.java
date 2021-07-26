package controller;

import java.io.IOException;
import java.io.PrintWriter;

import model.LinhaAerea;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;





@WebServlet("/InsertLinha")
public class InsertLinha extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CONTENT_TYPE="text/html;charset=UTF-8";
	private String mensagem;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType(CONTENT_TYPE);
		
		Gson gson = new Gson();
		JSONObject jo = new JSONObject();
		
		String idpassagem = request.getParameter("idpassagem");
		String nome = request.getParameter("nome");
		String preco = request.getParameter("preco");
		String classe = request.getParameter("classe");
		
	
	
		if(idpassagem.equals("") || nome.equals("") || preco.equals("") || classe.equals("")) {
			jo.put("status", false);
			jo.put("mensagem", "Algum campo est� vazio");
			mensagem = gson.toJson(jo);
			out.print(mensagem);
		}else {
			LinhaAerea linha = new LinhaAerea(idpassagem, nome, preco, classe);
			linha.save();
			jo.put("status", true);
			jo.put("mensagem", "Linha A�rea adicionado a passagem!");
			mensagem = gson.toJson(jo);
			out.print(mensagem);
		}
	}

}

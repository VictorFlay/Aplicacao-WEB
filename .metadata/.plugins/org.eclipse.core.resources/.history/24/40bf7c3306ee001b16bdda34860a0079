package controller;

import java.io.IOException;
import java.io.PrintWriter;

import model.Localizacao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;





@WebServlet("/AlterLocalizacao")
public class AlterLocalizacao extends HttpServlet {
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
		
		String nome = request.getParameter("nome");
		String url = request.getParameter("url");
		String id = request.getParameter("id");
	
		if(nome.equals("") || url.equals("") || id.equals("")) {
			jo.put("status", false);
			jo.put("mensagem", "Algum campo está vazio");
			mensagem = gson.toJson(jo);
			out.print(mensagem);
		}else {
			Localizacao localizacao = new Localizacao(nome,url);
			localizacao.setIdlocalizacao(Integer.valueOf(id));
			localizacao.alterarLocalizacao();
			jo.put("status", true);
			jo.put("mensagem", "Localização alterado com sucesso!");
			mensagem = gson.toJson(jo);
			out.print(mensagem);

			
			
		}
	}

}

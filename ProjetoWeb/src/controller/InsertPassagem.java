package controller;

import java.io.IOException;
import java.io.PrintWriter;

import model.Localizacao;
import model.Passagem;
import model.Usuario;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;





@WebServlet("/InsertPassagem")
public class InsertPassagem extends HttpServlet {
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
		
		String idlocalizacao = request.getParameter("idlocalizacao") == ""? null : request.getParameter("idlocalizacao");
		String promocao = request.getParameter("promocao") == ""?  null : request.getParameter("promocao");
	
		if(idlocalizacao == null || promocao == null) {
			jo.put("status", false);
			jo.put("mensagem", "Algum campo est� vazio");
			mensagem = gson.toJson(jo);
			out.print(mensagem);
		}else {
			Passagem passagem = new Passagem(idlocalizacao, promocao);
			if(passagem.save()) {
				jo.put("status", false);
				jo.put("mensagem", "Dados da passagem j� presente no banco de dados");
				mensagem = gson.toJson(jo);
				out.print(mensagem);
			}else {
				jo.put("status", true);
				jo.put("mensagem", "Passagem adicionado ao banco de dado!");
				mensagem = gson.toJson(jo);
				out.print(mensagem);
			}
			
			
		}
	}

}

package controller;

import java.io.IOException;
import java.io.PrintWriter;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import database.DBQuery;
import model.LinhaAerea;
import model.Usuario;


import org.json.simple.JSONObject;

import com.google.gson.Gson;

import database.DBQuery;
import model.Usuario;


@WebServlet("/Alter")
public class Alter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CONTENT_TYPE="text/html;charset=UTF-8";
	private DBQuery dbQuery = null;
	private String mensagem;
       
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	

	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType(CONTENT_TYPE);
		
		Gson gson = new Gson();
		JSONObject jo = new JSONObject();
		
		String nome = request.getParameter("nome");
		String classe = request.getParameter("classe");
		String preco = request.getParameter("preco");
		String id = request.getParameter("id");
		
		
		
		
		if(nome.equals("") || classe.equals("") || preco.equals("") || id.equals("")) {
			jo.put("status", false);
			jo.put("mensagem", "Algum campo est� v�zio");
			mensagem = gson.toJson(jo);
			out.print(mensagem);
		}else {
			new LinhaAerea().alterar(nome, preco, classe, id);
			jo.put("status", true);
			jo.put("mensagem", "Alterado com sucesso!");
			mensagem = gson.toJson(jo);
			out.print(mensagem);
		}


	}

}

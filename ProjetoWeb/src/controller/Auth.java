package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mysql.cj.protocol.Resultset;

import database.DBQuery;

/**
 * Servlet implementation class Auth
 */
@WebServlet("/Auth")
public class Auth extends HttpServlet {
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
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		response.setContentType(CONTENT_TYPE);
		
		Gson gson = new Gson();
		JSONObject jo = new JSONObject();
		
		String nome = request.getParameter("nome");
		String senha = request.getParameter("senha");
		
		
		
		this.dbQuery = new DBQuery("usuario", "idUsuario, nome, senha", "idUsuario");
		
		
		
		if(nome.equals("") || senha.equals("")) {
			jo.put("status", false);
			jo.put("mensagem", "Please Fill Username or Password");
			mensagem = gson.toJson(jo);
			out.print(mensagem);
		}else {
			ResultSet rs = dbQuery.select("nome = '"+nome+"' and senha='"+senha+"'");
			
			try {
				if(rs.next()) {
					session.setAttribute("nome", rs.getString("nome"));
					jo.put("status", true);
					jo.put("mensagem", "Login Sucesss");
					mensagem = gson.toJson(jo);
					out.print(mensagem);
					
					
					
					session.setAttribute("nome", rs.getString("nome"));

				}else {
					jo.put("status", false);
					jo.put("mensagem", "Checa sua conta ai brother errou feio");
					mensagem = gson.toJson(jo);
					out.print(mensagem);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					if(rs!= null) {
						rs.close();
					}
				}catch (Exception e) {
					
				}
			}
		}
		
	}

	
	public DBQuery getDbQuery() {
		return dbQuery;
	}

	public void setDbQuery(DBQuery dbQuery) {
		this.dbQuery = dbQuery;
	}
}

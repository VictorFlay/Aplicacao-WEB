package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Aviao {
	private int idaviao;
	private String nome;
	private float preco;

	private String tableName = "";
	private String fieldsName = "";
	private String keyField = "";
	private DBQuery dbQuery = null;
	
	public Aviao() {
		this.tableName = "aviao";
		this.fieldsName = "idaviao, nome, preco";
		this.keyField = "idaviao";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public Aviao(String idaviao, String nome, String preco) {
		this.tableName = "aviao";
		this.fieldsName = "idaviao, nome, preco";
		this.keyField = "idaviao";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);

		this.setIdaviao(Integer.valueOf(idaviao));
		this.setNome(nome);
		this.setPreco(Float.valueOf(preco));
	}
	

	
	public void save() {
		this.dbQuery.insert(this.toArray());
	}
	
	public String[] toArray() {
		return(
			new String[] {
				""+this.getIdaviao(),
				""+this.getNome(),
				""+this.getPreco()
			}
		);
	}

	
	public String listAll() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br>";
		saida += "<table border=1>";
		
		try {
			while(rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("idPassagem") + "</td>";
				saida += "<td>" + rs.getString("localizacao") + "</td>";
				saida += "<td>" + rs.getString("promocao") + "</td>";
				saida += "<td><a href='teste.jsp?conteudo="+ rs.getString("idPassagem") + "'>" + "enviar</a></td>";
				saida += "</td> <br>";
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}
	
	
	
	public String idPassagem() {
		ResultSet rs = this.dbQuery.selectID("idPassagem=(select max(idPassagem) from passagens)");
		String id = "";
		try {
			while(rs.next()) {
				id = rs.getString("idPassagem");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return (id);
	}

	
	
	public int getIdaviao() {
		return idaviao;
	}

	public void setIdaviao(int idaviao) {
		this.idaviao = idaviao;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public float getPreco() {
		return preco;
	}

	public void setPreco(float preco) {
		this.preco = preco;
	}
	
	
	

	
	
}


package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Localizacao {
	private String nome;
	private String url;
	
	private String tableName = "";
	private String fieldsName = "";
	private String keyField = "";
	private String where = "";
	private DBQuery dbQuery = null;
	
	
	public Localizacao() {
		this.tableName = "Localizacao";
		this.fieldsName = "idLocalizacao, nome, URL";
		this.keyField = "idLocalizacao";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public Localizacao(String nome, String url) {
		this.tableName = "localizacao";
		this.fieldsName = "nome, URL";
		this.keyField = "idLocalizacao";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);

		this.setNome(nome);
		this.setUrl(url);
	}
	

	
	

	
	public String[] toArray() {
		return(
			new String[] {
				""+this.getNome(),
				""+this.getUrl()
			}
		);
	}

	public String localizacoes() {
		ResultSet rs = this.dbQuery.selectLocalizacao("");
		String saida = "<select multiple class=\"form-control buscarloca\">";
		
		try {
			while(rs.next()) {
				saida += "<option value="+ rs.getInt("id")+" name=\"opcaoid\" class=\"jss32\" id=\"opcaoid\">"+ rs.getString("nome") + "</option>";
			}
			saida += "</select>";
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return(saida);
	}
	
	public String localizacoesNotKey() {
		ResultSet rs = this.dbQuery.selectLocalizacaoNotKey("NOT EXISTS (SELECT pa.idLocalizacao FROM passagem pa WHERE l.idLocalizacao = pa.idLocalizacao)");
		String saida = "<select id=\"cxlocalizacao\" name=\"cxlocalizacao\" class=\"form-control\">";
		try {
			while(rs.next()) {
				saida += "<option value="+ rs.getInt("id")+" name=\"cxid\" id=\"cxid\">"+ rs.getString("nome") + "</option>";
			}
			saida += "</select>";
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return(saida);
	}
	
	
	public boolean save() {
		ResultSet rs = this.dbQuery.select("nome = '"+this.getNome()+"' or URL='"+this.getUrl()+"'");
		try {
			while(rs.next()) {
				return true;
			}
		} catch (SQLException e) {

		}
		this.dbQuery.insert(this.toArray());
		return false;
	}

	
	
	public String idPassagem() {
		ResultSet rs = this.dbQuery.selectID("NOT EXISTS (SELECT passagem.idLocalizacao FROM passagem WHERE localizacao.idLocalizacao = passagem.idLocalizacao)");
		String nome = "<br>";
		try {
			while(rs.next()) {
				nome += "<img src='" + rs.getString("URL") + "'>";
				nome += rs.getString("nome");
				
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return (nome);
	}
	
	


	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
}

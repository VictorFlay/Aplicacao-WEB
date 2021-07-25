package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Localizacao {
	private int idlocalizacao;
	private String nome;
	private String url;
	
	private String tableName = "";
	private String fieldsName = "";
	private String keyField = "";
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
	
	public String lugares() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "";
		
		try {
			while(rs.next()) {
				saida += "<div class=\"col-md-3 mt-3\">"+
						"<div class=\"card\">\r\n" + 
						"  <img class=\"card-img-top\" src="+rs.getString("url")+" alt=\"Card image cap\">\r\n" + 
						"  <div class=\"card-body\">\r\n" + 
						"    <h5 class=\"card-title\">"+rs.getString("nome")+"</h5>\r\n" +  
						"		<a href="+"excluirlocalizacao.jsp?idlocalizacao="+rs.getInt("idLocalizacao")+">" +
						"			<button type=\"button\" class=\"btn btn-primary excluirlocalizacao\" data-toggle=\"modal\" data-target=\"#myModal\">\r\n" + 
						"				Excluir" +
						"			</button>\r\n"+
						"		</a>" +
						"		<a href="+"alterarlocalizacao.jsp?idlocalizacao="+rs.getInt("idLocalizacao")+">" +
						"			<button type=\"button\" class=\"btn btn-primary excluirlocalizacao\" data-toggle=\"modal\" data-target=\"#myModal\">\r\n" + 
						"				Alterar" +
						"			</button>\r\n"+
						"		</a>" +
						"  </div>\r\n" + 
						"</div></div>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return(saida);
	}
	

	public void deleteLocalizacao() {
		ResultSet rs = this.dbQuery.selectLocalizacaoPassagem("localizacao.idLocalizacao="+""+this.getIdlocalizacao());
		int qntd = 0;
		
		try {
			while(rs.next()) {
				qntd = rs.getInt("qntd");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(qntd > 0) {
			this.dbQuery.deletePassagem("idLocalizacao=" + "" + this.getIdlocalizacao());
			this.dbQuery.deleteLocalizacao("idLocalizacao=" + "" + this.getIdlocalizacao());
		}else {
			this.dbQuery.deleteLocalizacao("idLocalizacao=" + "" + this.getIdlocalizacao());
		}
		
	}
	
	
	public int getIdlocalizacao() {
		return idlocalizacao;
	}

	public void setIdlocalizacao(int idlocalizacao) {
		this.idlocalizacao = idlocalizacao;
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

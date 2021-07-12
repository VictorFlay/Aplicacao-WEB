package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Usuario {
	private int idUsuario;
	private String nome;
	private String login;
	private String senha;
	private String telefone;
	private String estado;
	private int nivelusuario;
	
	private String tableName = "";
	private String fieldsName = "";
	private String keyField = "";
	private String where = "";
	private DBQuery dbQuery = null;
	
	
	public Usuario(String nome, String login, String senha, String telefone, String estado) {
		this.tableName = "usuario";
		this.fieldsName = "nome, login, senha, telefone, estado";
		this.keyField = "idUsuario";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setNome(nome);
		this.setLogin(login);
		this.setSenha(senha);
		this.setTelefone(telefone);
		this.setEstado(estado);
	}

	
	public String[] toArray() {
		return(
			new String[] {
					""+this.getNome(),
					""+this.getLogin(),
					""+this.getSenha(),
					""+this.getTelefone(),
					""+this.getEstado(),
			}
		);
	}
	
	public boolean save() {
		ResultSet rs = this.dbQuery.select("nome = '"+this.getNome()+"' and login='"+this.getLogin()+"'");
		try {
			while(rs.next()) {
				return true;
			}
		} catch (SQLException e) {

		}
		this.dbQuery.insert(this.toArray());
		return false;
	}
	

	public int getIdUsuario() {
		return idUsuario;
	}


	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getLogin() {
		return login;
	}


	public void setLogin(String login) {
		this.login = login;
	}


	public String getSenha() {
		return senha;
	}


	public void setSenha(String senha) {
		this.senha = senha;
	}


	public String getTelefone() {
		return telefone;
	}


	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}


	public String getEstado() {
		return estado;
	}


	public void setEstado(String estado) {
		this.estado = estado;
	}


	public int getNivelusuario() {
		return nivelusuario;
	}


	public void setNivelusuario(int nivelusuario) {
		this.nivelusuario = nivelusuario;
	}


	public DBQuery getDbQuery() {
		return dbQuery;
	}


	public void setDbQuery(DBQuery dbQuery) {
		this.dbQuery = dbQuery;
	}
	
	
	
	

	
}

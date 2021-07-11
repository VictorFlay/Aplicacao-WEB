package model;

import database.DBQuery;

public class Usuario {
	private int idUsuario;
	private String nome;
	private String senha;
	
	private String tableName = "";
	private String fieldsName = "";
	private String keyField = "";
	private String where = "";
	private DBQuery dbQuery = null;
	
	
	public Usuario(String nome, String senha) {
		this.tableName = "usuario";
		this.fieldsName = "idUsuario, nome, senha";
		this.keyField = "idUsuario";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setNome(nome);
		this.setSenha(senha);
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
	
	public String getSenha() {
		return senha;
	}
	
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	
}

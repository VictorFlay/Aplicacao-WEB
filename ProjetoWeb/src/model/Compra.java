package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.Locale;

import database.DBQuery;

public class Compra {
	private int idusuario;
	private String nomedestino;
	private String nomelinha;
	private float preco;
	private int classe;
	
	
	private String tableName = "";
	private String fieldsName = "";
	private String keyField = "";
	private DBQuery dbQuery = null;
	
	
	
	public Compra(String idusuario, String nomedestino, String nomelinha, String preco, String classe) {
		this.tableName = "compra";
		this.fieldsName = "idUsuario, nomeDestino, nomeLinha, preco, classe";
		this.keyField = "notaFiscal";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdusuario(Integer.parseInt(idusuario));
		this.setNomedestino(nomedestino);
		this.setNomelinha(nomelinha);
		this.setPreco(Float.parseFloat(preco));
		this.setClasse(Integer.parseInt(classe));
		
	}
	
	

	public String[] toArray() {
		return(
			new String[] {
				""+this.getIdusuario(),
				""+this.getNomedestino(),
				""+this.getNomelinha(),
				""+this.getPreco(),
				""+this.getClasse()
			}
		);
	}
	
	
	
	public void save() {
		this.dbQuery.insert(this.toArray());
	}




	public int getIdusuario() {
		return idusuario;
	}

	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
	}

	public String getNomedestino() {
		return nomedestino;
	}

	public void setNomedestino(String nomedestino) {
		this.nomedestino = nomedestino;
	}

	public String getNomelinha() {
		return nomelinha;
	}

	public void setNomelinha(String nomelinha) {
		this.nomelinha = nomelinha;
	}

	public float getPreco() {
		return preco;
	}

	public void setPreco(float preco) {
		this.preco = preco;
	}

	public int getClasse() {
		return classe;
	}

	public void setClasse(int classe) {
		this.classe = classe;
	}
	
}

package database;

import java.sql.ResultSet; 
import java.sql.SQLException;
import java.sql.Statement;

public class DBQuery {
	
	private Statement statement =  null;
	private String    tableName 	= "";
	private String[]  fieldsName 	= new String[]{};
	private String    fieldKey  	= "";
	private int		  keyFieldIndex = -1;
	
	
	public DBQuery() {
		try {
			this.statement = new DBConnection().getConnection().createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public String[] dontInjectionStrings(String[] values) {
		String[] tempValues = values;
		for (int i = 0; i < tempValues.length; i++) {
			
		}
		return null;
	}
	
	public DBQuery(	String tableName, String fieldsName,  String fieldKey) {
		this.setTableName	( tableName  );
		this.setFieldsName	( fieldsName );
		this.setFieldKey	( fieldKey   ); 
		try {
			this.statement = new DBConnection().getConnection().createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private int whereIsKeyField() {
		for ( int i =0; i < this.fieldsName.length; i ++ ){
			if( this.fieldsName[i].equals(this.fieldKey) ){
				return(i);
			}
		}
		return(-1);
	}
	
	public ResultSet query(String sql) { // select
		try {
			ResultSet rs = statement.executeQuery(sql);
			return (rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String joinElements (String[] elements, String separator ){
		String out = "";
		for (int i=0; i< elements.length; i++) {
			out +=  elements[i].trim() +  ((i == elements.length-1) ? "" : separator );
		}
		return (out);
	}
	
	public int execute(String sql) { // insert, delete, update
		try {
			int rs = statement.executeUpdate(sql);
			return (rs);
		}catch (SQLException e) {
			System.out.println("\nErro: Verifique o comando ou a dependencia de chave extrangeira!");
		}
		
		return 0;
	}

	public ResultSet select(String where) {
		String sql = "SELECT "+  this.joinElements(this.fieldsName, ", ") + " FROM " + this.tableName;
		sql += (( where!="") ? " WHERE "+ where : "" );
		System.out.print(sql);
		return this.query(sql);
	} 
	
	public ResultSet selectLocalizacao(String where) {
		String sql = "select li.idPassagem, pa.idPassagem as id, lo.nome as nome from linha_aerea li ";
		sql += "inner join passagem pa on li.idPassagem = pa.idPassagem ";
		sql += "inner join localizacao lo on lo.idLocalizacao = pa.idLocalizacao group by lo.nome";
		sql += (( where!="") ? " WHERE "+ where : "" );
		System.out.print(sql);
		return this.query(sql);
	}
	
	public ResultSet selectLocalizacaoNotKey(String where) {
		String sql = "SELECT l.nome as nome, l.idLocalizacao as id FROM localizacao l ";
		sql += (( where!="") ? " WHERE "+ where : "" );
		System.out.print(sql);
		return this.query(sql);
	}
	
	public ResultSet linhasDisponivel(String where) {
		String sql = "select p.idPassagem, lo.nome, li.nomeEmpresa, li.classe as classe from passagem p  ";
		sql += "inner join localizacao lo on p.idLocalizacao = lo.idLocalizacao ";
		sql += "inner join linha_aerea li on p.idPassagem = li.idPassagem ";
		sql += (( where!="") ? " WHERE "+ where : "" );
		System.out.print(sql);
		return this.query(sql);
	}
	
	public ResultSet dadosLinha(String where) {
		String sql = "select lo.nome as nome, li.nomeEmpresa as empresa, li.preco as preco, li.classe as classe, p.idpassagem as id, li.idLinhaAerea from passagem p  ";
		sql += "inner join localizacao lo on p.idLocalizacao = lo.idLocalizacao ";
		sql += "inner join linha_aerea li on p.idPassagem = li.idPassagem ";
		sql += (( where!="") ? " WHERE "+ where : "" );
		System.out.print(sql);
		return this.query(sql);
	}
	
	
	public ResultSet linhasQuantidade(String where) {
		String sql = "select count(*) as quantidade from passagem p  ";
		sql += "inner join localizacao lo on p.idLocalizacao = lo.idLocalizacao ";
		sql += "inner join linha_aerea li on p.idPassagem = li.idPassagem ";
		sql += (( where!="") ? " WHERE "+ where : "" );
		System.out.print(sql);
		return this.query(sql);
	}
	
	public ResultSet linhasQuantidadeIdClasse(String where) {
		String sql = "select count(*) as quantidade from passagem p  ";
		sql += "inner join localizacao lo on p.idLocalizacao = lo.idLocalizacao ";
		sql += "inner join linha_aerea li on p.idPassagem = li.idPassagem ";
		sql += (( where!="") ? " WHERE "+ where : "" );
		System.out.print(sql);
		return this.query(sql);
	}
	
	public ResultSet selectID(String where) {
		String sql = "SELECT "+  this.joinElements(this.fieldsName, ", ") + " FROM " + this.tableName;
		sql += (( where!="") ? " WHERE "+ where : "" );
		System.out.print(sql);
		return this.query(sql);
	}
	
	public ResultSet selectPassagem(String where) {
		String sql = "SELECT idPassagem, nome FROM " + this.tableName;
		sql += " inner join localizacao on localizacao.idLocalizacao="+this.tableName+".idLocalizacao";
		sql += (( where!="") ? " WHERE "+ where : "" );
		System.out.print(sql);
		return this.query(sql);
	}
	
	public ResultSet selectPromocao(String where) {
		String sql = "SELECT la.nomeEmpresa, la.preco as preco, pa.promocao, lo.nome, la.idPassagem as passagem, lo.URL FROM linha_aerea la ";
		sql += "inner join passagem pa on la.idPassagem = pa.idPassagem ";
		sql += " inner join localizacao lo on lo.idLocalizacao = pa.idLocalizacao ";
		sql += (( where!="") ? " WHERE "+ where : "" );
		System.out.print(sql);
		return this.query(sql);
	}
	
	public int deleteLinha(String where) {
		String sql = "DELETE FROM linha_aerea ";
		sql += (( where!="") ? " WHERE "+ where : "" );
		System.out.print(sql);
		return( this.execute(sql) );
	}
	
	
	public int deletePassagem(String where) {
		String sql = "DELETE FROM passagem ";
		sql += (( where!="") ? " WHERE "+ where : "" );
		System.out.print(sql);
		return( this.execute(sql) );
	}
	
	public int deleteCompra(String where) {
		String sql = "DELETE FROM compra ";
		sql += (( where!="") ? " WHERE "+ where : "" );
		System.out.print(sql);
		return( this.execute(sql) );
	}
	
	
	public int insert(String[] values) {
		for (String value : values) {
			System.out.println(value);
		}
		if ( values.length == this.fieldsName.length){
			String sql = "INSERT INTO "+this.tableName+" ( "+  this.joinElements(this.fieldsName, ", ");
			sql += ") VALUES ('"+joinElements(values, "','")+"')";
			System.out.print(sql);
			return ( this.execute(sql));
		}else{
			System.out.print("O n�mero de valores informados n�o � equivalente aos campos da tabela!");
		}	
		return 0;
	}
	
	public int delete(String[] values) {
		if (values.length != this.fieldsName.length){
			System.out.println("\n A quantidade de campos � diferente da quantidade de valores!");
			return ( 0 );
		}
		
		String sql = "\nDELETE FROM "+this.tableName+" ";
		if ( this.keyFieldIndex < 0 ){
			return(0);
		}
		sql += "\n WHERE "+ this.fieldKey +" = '"+ values[this.keyFieldIndex] +"'";
		System.out.print( sql );
		return ( this.execute(sql) );
	}
	
	public int update(String nomeEmpresa, String preco, String classe, String id) {
		String sql = "\nUPDATE "+this.tableName+" SET ";
		sql += "nomeEmpresa='"+nomeEmpresa+"', preco='"+ preco+"',classe='"+classe+"' ";
		sql += "WHERE idLinhaAerea ='"+id+"'";
		System.out.print( sql );
		return ( this.execute(sql) );
		
	}

	public String getTableName() {
		return tableName;
	}


	public void setTableName(String tableName) {
		this.tableName = tableName;
	}


	public String[] getFieldsName() {
		return fieldsName;
	}


	public void setFieldsName(String fieldsName) {
		this.fieldsName	= fieldsName.split(",");
		for (int i=0;  i< this.fieldsName.length; i++) {
			this.fieldsName[i] = this.fieldsName[i].trim();
		};
	}

	public String getFieldKey() {
		return fieldKey;
	}


	public void setFieldKey(String fieldKey) {
		this.fieldKey = fieldKey;
		this.keyFieldIndex = whereIsKeyField();

	}

	public int getKeyFieldIndex() {
		return keyFieldIndex;
	}

	public void setKeyFieldIndex(int keyFieldIndex) {
		this.keyFieldIndex = keyFieldIndex;
	}

}

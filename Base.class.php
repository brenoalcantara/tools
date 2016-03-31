<?php

/**
 * Classe abstrata para implementações das classes das entidades do banco
 *
 * @version 1.0.0
 * @license GPL
 * @license http://opensource.org/licenses/gpl-license.php GNU Public License
 *
 */
abstract class Base
{
	/**
	 * @var string $tableName    Recebe o nome da tabela.
	 */
    private $tableName;

    /**
     * Variáveis usadas pelas classes de entidades do sistema.
     */
    public $rotulo     = null;
	public $query_sql  = null; 
	public $numrows    = 0; 
	public $numrows_incluir = 0; 
	public $numrows_alterar = 0; 
	public $numrows_excluir = 0; 
	public $erro_status = 0; 
	public $erro_sql    = null; 
	public $erro_banco  = null;  
	public $erro_msg    = null;  
	public $erro_campo  = null;  
	public $pagina_retorno = null; 

	/**
	 * Método construtor
	 * 
	 * @param string $tableName
     * @return void
	 */
    public function __construct($tableName) {
        $this->tableName = $tableName;
        $this->rotulo = new rotulo($tableName); 
		$this->pagina_retorno = basename($GLOBALS["HTTP_SERVER_VARS"]["PHP_SELF"]);
    }

    /**
     * Método erro: mostra a mensagem de erro.
     * 
     * @param bool $mostra
     * @param bool $retorna 
     *
     * @return void
     */
    public function erro($mostra,$retorna) {
    	if(($this->erro_status == 0) || ($mostra == true && $this->erro_status != null )) {
        	echo "<script>alert(\"".$this->erro_msg."\");</script>";
	        
	        if($retorna==true){
	        	echo "<script>location.href='".$this->pagina_retorno."'</script>";
	        }
     	}
    }

    /**
     * Método abstrato incluir.
     *
     * @return bool
     */
    abstract public function incluir();

    /**
     * Método abstrato alterar.
     * 
     * @param int|null $codigoSequencial
     *
     * @return bool
     */
    abstract public function alterar($primaryKey = null);

    /**
     * Método abstrato excluir.
     * 
     * @param int|null $codigoSequencial
     *
     * @return bool
     */
    abstract public function excluir($primaryKey = null);

    /**
     * Método recordset: invoca o método db_query que executa o método pg_query (PostgreSQL)
     *
     * @param string $sql
     * 
     * @return resource|bool $result
     * 
     */
    public function sql_record($sql) {
    	$result = db_query($sql);

    	if($result == false)	{
			$this->numrows     = 0;
			$this->erro_banco  = str_replace("\n","",@pg_last_error());
			$this->erro_sql    = "Erro ao selecionar os registros na tabela: {$this->tableName}.";
			$this->erro_msg    = "Usuário: \\n ".$this->erro_sql." \\n";
			$this->erro_msg   .=  str_replace('"',"",str_replace("'","",  "Administrador: \\n ".$this->erro_banco." \\n"));
			$this->erro_status = 0;
       		return false;
     	}

     	$this->numrows = pg_numrows($result);

		if($this->numrows == 0) {
			$this->erro_banco  = "";
			$this->erro_sql    = "Record vazio na tabela: {$this->tableName}.";
			$this->erro_msg    = "Usuário: \\n ".$this->erro_sql." \\n";
			$this->erro_status = 0;
			return false;
		}

    	return $result;
    }

    /**
     * Método sql genérico
     *  
     * @param string $columns
     * @param string $where
     * @param string $orderBy
     * @param string $groupBy
     *
     * @return string $sql
     * 
     */
    public function sql_query($columns = '*', $where = '', $orderBy = '', $groupBy = '') {
        $sql = " SELECT {$columns} FROM {$this->tableName} ";

        if ($where != '') {
            $sql .= " WHERE {$where}";
        }

        if ($orderBy != '') {
            $sql .= " ORDER BY {$orderBy}";
        }

        if ($groupBy != '') {
            $sql .= " GROUP BY {$groupBy}";
        }

        return $sql;
    }
} // end class

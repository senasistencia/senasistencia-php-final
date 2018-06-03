<?php
//clase inicializada
class Usuario{
  //atributos de la tabla
  private $id_usuario;//llave primaria
  private $password_hash;
  private $estado;
  private $fechaCreacion;
  private $fechaInactivacion;//opcional
  #las siguientes variables corresponden
  #a llaves foraneas de la tabla
  private $FK_docCliente//campo correspondiente al "usuario";
 //metodos de ingreso y sustraccion de valores
  public function __SET($atributo,$valor)
  {
    return $this->$atributo = $valor;
  }
  public function __GET($atributo)
  {
    return $this->$atributo;
  }

}
?>

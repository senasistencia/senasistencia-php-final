<?php
//clase inicializada
class Rol{
  //atributos de la tabla
  private $id_rol;//llave primaria
  private $tipo_rol;
  private $estado;
  private $fechaCreacion;
  private $fechaInactivacion;//opcional
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

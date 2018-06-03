<?php
//clase inicializada
class TipoDocumento{
  //atributos de la tabla
  private $id_tipoDocumento;//llave primaria
  private $nombreTipoDocumento;
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

<?php
//clase inicializada
class Notificacion{
  //atributos de la tabla
  private $id_notifiacacion;//llave primaria
  private $asunto;
  private $mensaje;


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

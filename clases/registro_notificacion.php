<?php
//clase inicializada
class RegistroNotificacion{
  //atributos de la tabla
  private $id_registro;//llave primaria
  private $fecha;
  #las siguientes variables corresponden
  #a llaves foraneas de la tabla

  private $FK_docAprendiz;//llave foranea de la tabla aprendiz
  private $FK_asistencia;//llave foranea de la tabla asistencia
  private $FK_docCliente;//llave foranea de la tabla cliente
  private $FK_notificacion;//llave foranea de la tabla notificacion
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

<?php
//clase inicializada
class Ficha{
  //atributos de la tabla
  private $id_ficha;//llave primaria
  private $num_ficha;
  private $grupo;
  private $jornada;
  private $trimestre;
  private $estado;
  private $fechaCreacion;
  private $fechaInactivacion;//opcional
  
  #las siguientes variables corresponden
  #a llaves foraneas de la tabla
  private $FK_programa;//llave foranea de la tabla programa formacion

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

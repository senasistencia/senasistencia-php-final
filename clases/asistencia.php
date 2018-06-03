<?php
//clase inicializada
  class Asistencia{
    //atributos de la tabla
    private $id_asistencia;//llave primaria
    private $estado_asistencia;
    private $fecha;
    #las siguientes variables corresponden
    #a llaves foraneas de la tabla
    private $FK_docAprendiz;//llave foranea de la tabla aprendiz
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

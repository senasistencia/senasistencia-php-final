<?php
//clase inicializada
  class Excusa{
    //atributos de la tabla
    private $id_excusa;
    private $fechaInicio;
    private $fechaFin; 
    private $comentario;
    private $url_excusa;//campo opcional que corresponde a la imagen que se adjunte
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

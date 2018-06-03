<?php
//clase inicializada
  class Aprendiz{
    //atributos de la tabla

     private $documentoAprendiz;//llave primaria
     private $primerNombre;
     private $segundoNombre;//opcional
     private $primerApellido;
     private $segundoApellido;//opcional
     private $correo;
     private $telefono;//opcional
     private $estado;
     private $fechaCreacion;
     private $fechaInactivacion;//opcional
     #las siguientes variables corresponden
     #a llaves foraneas de la tabla
     private $FK_tipoDocumento;//llave foranea de la tabla tipo de documento
     private $FK_ficha;//llave foranea de la tabla ficha
     
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

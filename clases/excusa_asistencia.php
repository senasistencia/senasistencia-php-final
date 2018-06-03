<?php 
class Excusa_Asistencia{
    //atributos
    private $FK_Excusa;//llave foranea de la tabla excusa
    private $FK_Asistencia;//llave foranea de la tabla asistencia
 //metodos de ingreso y sustraccion de valores
    public function __SET($atributo,$valor)
    {
        return $this->$atributo = $valor;
    }

    public function __GET($atriburo)
    {
        return $this->$atributo;
    }
}


?>
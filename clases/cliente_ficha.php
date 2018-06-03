<?php 
class Cliente_Ficha{
    //atributos
    private $FK_docCliente;//llave foranea de la tabla cliente
    private $FK_Ficha;//llave foranea de la tabla ficha
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
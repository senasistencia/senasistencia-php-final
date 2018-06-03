<?php 
class Cliente_Rol{
    //atributos
    private $FK_docCliente;//llave foranea de la tabla cliente
    private $FK_Rol;//llave foranea de la tabla rol
    
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
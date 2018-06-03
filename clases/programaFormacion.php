<?php
//clase inicializada
class ProgramaFormacion{
  //atributos de la tabla
  private $id_programa;//llave primaria
  private $nombre;
  private $estado;
  private $fechaCreacion;
  private $fechaInactivacion;//opcional
  //metodos
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

class Nave{
  var velocidad
  var direccion

  method acelerar(cuando){
    velocidad = (velocidad).min(100000)
  }
  method desacelerar(cuando) {
    velocidad = (velocidad).max(0)
  }
  method irHaciaElSol() {
    
  }
  method escaparDelSol() {
    
  }
  method ponerseParaleloAlSol() {

  }
  method acercarseUnPocoAlSol() {
    
  }
  method alejarseUnPocoAlSol() {
    
  }
}
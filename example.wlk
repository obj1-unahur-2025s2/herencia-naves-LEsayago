class Nave {
  const velMaxima = 100000
  var velocidad
  var direccion
  var combustible
  
  // metodo abstracto lo que hace que no pueda instanciarse   y poner arriba por buenas practicas
  method prepararViaje()

  method estaTranquila()

  method condicionesParaLaTranquilidad() = combustible >= 4000 and velocidad <= 12000

  method accionAdicional(){

    self.cargarCombustible(30000)
    self.acelerar(5000)
  }

  method cargarCombustible(cantidad) {
    combustible += cantidad
  }

  method descargarCombustible(cantidad) {
    combustible = (combustible - cantidad).max(0)
  }

  method acelerar(cuanto) {
    velocidad = (velocidad + cuanto ).min(velMaxima)
  }
  
  method desacelerar(cuanto) {
    velocidad = (velocidad - cuanto ).max(0)
  }
  
  method irHaciaElSol() {
    direccion = 10
  }
  
  method escaparDelSol() {
   direccion = -10
  }
  
  method ponerseParaleloAlSol() {
    direccion = 0
  }
  
  method acercarseUnPocoAlSol() {
    direccion = (direccion + 1).min(10)
  }
  
  method alejarseUnPocoAlSol() {
    direccion = (direccion - 1).max(-10)
  } 

}

class NaveBaliza inherits Nave {
  var colorBaliza
  
  method cambiarColorDeBaliza(colorNuevo) {
    colorBaliza = colorNuevo
  }

  method color() = colorBaliza

  override method prepararViaje(){
    self.cambiarColorDeBaliza("verde")
    self.ponerseParaleloAlSol()
    self.accionAdicional()

  }

  override method estaTranquila() = self.condicionesParaLaTranquilidad() and (colorBaliza != "rojo")  
}

class NaveDePasajeros inherits Nave {
  var property pasajeros
  var comida
  var bebida
  
  method cargarComida(unaCantidad) {
    comida += unaCantidad
  }
  
  method descargarComida(unaCantidad) {
    comida = (comida - unaCantidad).max(0)
  }
  
  method cargarBebida(unaCantidad) {
    bebida += unaCantidad
  }
  
  method descargarBebida(unaCantidad) {
    bebida = (bebida - unaCantidad).max(0)
  }

  override method prepararViaje(){
    const cantComida = 4*pasajeros
    self.cargarComida(cantComida)
    const cantBebidas = 6*pasajeros
    self.cargarBebida(cantBebidas)

    self.acercarseUnPocoAlSol()
    self.accionAdicional()
  }
  override method estaTranquila() = self.condicionesParaLaTranquilidad()
}

class NaveHospital inherits NaveDePasajeros{
  var quirofanosPreparados = false
  method prepararQuirofano() {
    quirofanosPreparados = true
  }

  method estanLosQuirodanosOperados() = quirofanosPreparados  


  method utilizarQuirofanos(){
    quirofanosPreparados = false
  }
override method estaTranquila() = self.condicionesParaLaTranquilidad() and not self.estanLosQuirodanosOperados()
}
class NaveDeCombate inherits Nave {
  var invisible = true
  var misilesDesplegados = true
  const mensajes = []

  method estaInvisible() = invisible
  
  method ponerseVisible() {
    invisible = false
  }
  
  method ponerseInvisible() {
    invisible = true
  }
  
  method emitirMensaje(mensaje) {
    mensajes.add(mensaje)
  }
  method misilesDesplegados() = misilesDesplegados

  method desplegarMisiles() {
    misilesDesplegados = true
  }
  method replegarMisiles(){
    misilesDesplegados = false

    
  }

  method mensajesEmitidos() = mensajes
  
  method primerMensajeEmitido() = mensajes.first()
  
  method ultimoMensajeEmitido() = mensajes.last()
  
  method esEscueta() = not mensajes.any({ m => m.length() > 30 })
  
  method emitioMensaje(unMensaje) = mensajes.contains(unMensaje) 
  
  override method prepararViaje(){
    self.ponerseVisible()

    self.replegarMisiles()

    self.acelerar(15000)

    self.emitirMensaje("Saliendo en misión")
    
    self.accionAdicional()
  
    self.acelerar(15000)

  }

  override method estaTranquila() = self.condicionesParaLaTranquilidad() and not self.misilesDesplegados()
}


class NaveSigilosa inherits NaveDeCombate {
 override method estaTranquila() = super() and not self.estaInvisible() 
}

class Nave {
  const velMaxima = 100000
  var velocidad
  var direccion
  
  method acelerar(cuanto) {
    velocidad = (velocidad + cuanto ).min(velMaxima)
  }
  
  method desacelerar(cuanto) {
    velocidad = (velocidad - cuanto ).max(0)
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

class NaveBaliza inherits Nave {
  var colorDeBaliza
  
  method cambiarColorDeBaliza(colorNuevo) {
    colorDeBaliza = colorNuevo
  }
}

class NaveDePasajeros inherits Nave {
  var property cantidadDePasajeros
  var racionesDeComida
  var racionesDeBebidas
  
  method cargarComida(unaCantidad) {
    racionesDeComida += unaCantidad
  }
  
  method descargarComida(unaCantidad) {
    racionesDeComida = (racionesDeComida - unaCantidad).max(0)
  }
  
  method cargarBebida(unaCantidad) {
    racionesDeBebidas += unaCantidad
  }
  
  method descargarBebida(unaCantidad) {
    racionesDeBebidas = (racionesDeBebidas - unaCantidad).max(0)
  }
}

class NaveDeCombate inherits Nave {
  var visible
  const mensajes = []
  
  method ponerseVisible() {
    visible = true
  }
  
  method ponerseInvisible() {
    visible = false
  }
  
  method emitirMensaje(mensaje) {
    mensajes.add(mensaje)
  }
  
  method mensajesEmitidos() = mensajes
  
  method primerMensajeEmitido() = if (self.emitioMensaje()) mensajes.first()
  
  method ultimoMensajeEmitido() = if (self.emitioMensaje()) mensajes.end()
  
  method esEscueta() = mensajes.any({ m => m.length() > 30 })
  
  method emitioMensaje() = mensajes.size() > 0
}
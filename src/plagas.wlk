import elementos.*

class Plaga {
	var property poblacion
	
	method puedeTransmitirEnfermedades() = self.poblacionSuficiente() && self.condicionAdicional() 

	method efectoDelAtaque() {
		poblacion += poblacion * 0.1
	}
	
	method atacar(elemento){
		elemento.recibeAtaqueDe(self)
		self.efectoDelAtaque()
	}
	
	method poblacionSuficiente() = poblacion >= 10
	
	method condicionAdicional()
	
}

class Cucarachas inherits Plaga {
	var property pesoPromedio 
	
	method nivelDeDanio() = poblacion / 2
	
//	override method puedeTransmitirEnfermedades() = super() && pesoPromedio >= 10

	override method condicionAdicional() = pesoPromedio >= 10
	
	override method efectoDelAtaque() {
		super()
		pesoPromedio += 2
	}
} 

class Parasito inherits Plaga {
	method nivelDeDanio() = poblacion * 2
	
	override method condicionAdicional() = true
}

class Garrapatas inherits Parasito {

	override method efectoDelAtaque(){
		poblacion += poblacion * 0.2
	}
}

class Mosquito inherits Plaga {
	method nivelDeDanio() = poblacion
	
//	override method puedeTransmitirEnfermedades() = super() && (poblacion % 3 == 0)
	override method condicionAdicional() = poblacion % 3 == 0

}

// Agregado para mostar un objeto que hereda de una clase
object dengue inherits Plaga(poblacion=1000){
	override method efectoDelAtaque() {
		poblacion += 1
	}
	override method condicionAdicional() = false
	
	method nivelDeDanio() = 1
}

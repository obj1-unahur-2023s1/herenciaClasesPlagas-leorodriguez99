import elementos.*

class Plaga {
	var property poblacion
	
	method puedeTransmitirEnfermedades() = poblacion >= 10
	
	method efectoDelAtaque() {
		poblacion += poblacion * 0.1
	}
	
	method elementoRecibeAtaqueDe(elemento, plaga){
		plaga.efectoDelAtaque()
		elemento.recibeAtaqueDe(plaga)
	}
}

class Cucarachas inherits Plaga {
	var property pesoPromedio 
	
	method nivelDeDanio() = poblacion / 2
	
	method transmiteEnfermedades() = self.puedeTransmitirEnfermedades() && pesoPromedio >= 10

	override method efectoDelAtaque() {
		super()
		pesoPromedio += 2
	}
} 

class Pulgas inherits Plaga {
	method nivelDeDanio() = poblacion * 2
	
	method transmitenEnfermedades() = self.puedeTransmitirEnfermedades()
}

class Garrapatas inherits Plaga {
	method nivelDeDanio() = poblacion * 2
	
	method transmitenEnfermedades() = self.puedeTransmitirEnfermedades()
	
	override method efectoDelAtaque(){
		poblacion += poblacion * 0.2
	}
}

class Mosquito inherits Plaga {
	method nivelDeDanio() = poblacion
	
	method transmiteEnfermedades() = self.puedeTransmitirEnfermedades() && (poblacion % 3 == 0)
}

import plagas.*

class Elemento {
	var property nivel
	
	method elementoRecibeAtaqueDe(elemento, plaga){
		elemento.recibeAtaqueDe(plaga)
	}
}

class Hogar inherits Elemento {
	var property confort
	
	method nivelDeMugre() = nivel
	
	method esBueno() {return (self.nivelDeMugre() <= confort/2)}
	
	method recibeAtaqueDe(plaga){
		nivel = nivel + plaga.nivelDeDanio()
	}
}


class Huerta inherits Elemento {
	var property capacidadProduccion
	var property nivelComun = 10
	
	method nivelComun() = nivelComun

	method esBueno() = capacidadProduccion > self.nivelComun()
	
	method recibeAtaqueDe(plaga){
		if(plaga.transmiteEnfermedades()){
			capacidadProduccion = capacidadProduccion - (plaga.nivelDeDanio() * 0.1) - 10
		}else {
			capacidadProduccion = capacidadProduccion - plaga.nivelDeDanio() * 0.1
		}
	}
}


class Mascota inherits Elemento {
	method nivelDeSalud() = nivel
	
	method esBueno() = self.nivelDeSalud() > 250
	
	method recibeAtaqueDe(plaga){
		if(plaga.transmiteEnfermedades()){
			nivel = nivel - plaga.nivelDeDanio()
		}
	}
}


class Barrio {
	const elementos = []
	
	method agregarElemento(unElemento) {
		elementos.add(unElemento)
	}
	
	method elementos() = elementos
	
	method esCopado() {
		const elementosBuenos = elementos.count({elemento => elemento.esBueno()})
		const elementosMalos = elementos.count({elemento => !elemento.esBueno()})
		return elementosBuenos > elementosMalos
	}
}
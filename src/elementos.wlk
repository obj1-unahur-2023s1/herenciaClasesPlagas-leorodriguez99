import plagas.*


object horticultura{
	var property nivelProduccionMinimo = 10 //estoy asumiendo un valor de 10 por defecto
}

class Hogar {
	var property confort
	var property nivelDeMugre
	
	method esBueno() {return (self.nivelDeMugre() <= confort/2)}
	
	method recibeAtaqueDe(plaga){
		nivelDeMugre = nivelDeMugre + plaga.nivelDeDanio()
	}
}


class Huerta {
	var property capacidadProduccion


	method esBueno() = capacidadProduccion > horticultura.nivelProduccionMinimo()
	
	method recibeAtaqueDe(plaga){
		capacidadProduccion -= plaga.nivelDeDanio() * 0.1 -
		 	(if(plaga.puedeTransmitirEnfermedades()) 10 else 0)
	}
}


class Mascota{
	var property nivelDeSalud
	
	method esBueno() = self.nivelDeSalud() > 250
	
	method recibeAtaqueDe(plaga){
		if(plaga.puedeTransmitirEnfermedades()){
			nivelDeSalud -= plaga.nivelDeDanio()
		}
	}
}

class Barrio {
	const elementos = []
	
	method agregarElemento(unElemento) {
		elementos.add(unElemento)
	}
	
	method cantElementosBuenos() = elementos.count({elemento => elemento.esBueno()})

	method esCopado() {
		return self.cantElementosBuenos() > elementos.size() / 2
	}
}
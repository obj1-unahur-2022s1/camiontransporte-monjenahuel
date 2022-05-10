import cosas2.*

//Bultos


object camion {
	var cosas  = []
	
	method cargar(cosa){
		cosas.add(cosa)
		cosa.consecuenciaDeCarga()
		}
	method descargar(cosa) = cosas.remove(cosa)
	method hayAlgunoQuePesa(peso) = cosas.any(  {c => c.peso() == peso }  )
	method elDelNivel(nivel) = cosas.find( {c => c.nivelDePeligrosidad() == nivel })
	method pesoTotal() = cosas.sum( {c => c.peso() }) + 1000
	method excedidoDePeso() = self.pesoTotal() > 2500
	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter({c => c.nivelDePeligrosidad() > nivel})
	method objetosMasPeligrososQue(cosa) = cosas.filter({c => c.nivelDePeligrosidad() > cosa.nivelDePeligrosidad()})
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = 
		not(self.excedidoDePeso()) and 
		self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	
	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({	c => min <= c.peso() and c.peso() <= max })
	}
	
	method cosaMasPesada(){
		return cosas.max({c => c.peso()})
	}
	
	method pesos(){
		return cosas.map({c => c.peso()})
	}
	
	method totalBultos(){
		return cosas.sum({c => c.bultos()})
	}
}

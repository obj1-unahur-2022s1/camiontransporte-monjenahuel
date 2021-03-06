object knightRider {
	method peso() = 500
	method nivelDePeligrosidad() = 10
}

object bumblebee {
	var formaActual = "auto"
	
	method cambiarDeForma(){
		if (formaActual == "auto"){
			formaActual = "robot"
		}else{formaActual = "auto"}
	}
	method formaActual() = formaActual
	method peso() = 800
	
	method nivelDePeligrosidad(){
		if (formaActual == "auto"){
			return 15
		}else{return 30}
	}

}

object paqueteLadrillos{
	var property cantLadrillos
	
	method nivelDePeligrosidad() = 2
	method peso() = cantLadrillos * 2
}


object arena {
	var property peso
	
	method nivelDePeligrosidad() = 1
	
}

object bateriaAntiarea {
	var property contieneMisiles
	
	method peso(){
		if (self.contieneMisiles()){
			return 300
		}else{return 200}
	}
	
	method nivelDePeligrosidad(){
		if (self.contieneMisiles()){
			return 100
		}else{return 0}
	}
}

object contenedor {
	var contenido = []
	
	method peso() = 100 + contenido.sum({c => c.peso()})
	
	method nivelDePeligrosidad(){
		 if (contenido.isEmpty()){
		 	return 0
		 }else{
		 	return contenido.max({c => c.nivelDePeligrosidad()}).nivelDePeligrosidad()
		 }
	}	
	method cargar(cosa) = contenido.add(cosa)
	method descargar(cosa) = contenido.remove(cosa)
}

object residuosRadioactivos {
	var property peso
	
	method nivelDePeligrosidad() = 200
	}



object embalajeSeguridad {
	var cosaEnvuelta
	
	method envolver(cosa){cosaEnvuelta = cosa} 
	method peso()= cosaEnvuelta.peso()
	method nivelDePeligrosidad() = cosaEnvuelta.nivelDePeligrosidad()/2
	
}






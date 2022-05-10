//Bultos

object knightRider {
	method peso() = 500
	method nivelDePeligrosidad() = 10
	method bultos()= 1
	method consecuenciaDeCarga(){}
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
		}else{
			return 30
		}
	}
	method bultos() = 2
	method consecuenciaDeCarga(){formaActual = "robot"}

}

object paqueteLadrillos{
	var property cantLadrillos
	
	method nivelDePeligrosidad() = 2
	
	method peso() = cantLadrillos * 2
	
	method bultos(){
		if(cantLadrillos <= 100){
			return 1
		}else{
			if(cantLadrillos <= 300){
				return 2
			}else{
				return 3
				}
			}
		}
	method consecuenciaDeCarga(){cantLadrillos += 12}
		
}

object arena {
	var property peso = 0
	
	method nivelDePeligrosidad() = 1
	method bultos() = 1
	method consecuenciaDeCarga(){peso += 20}
	
}

object bateriaAntiarea {
	var property contieneMisiles = true
	
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
	method bultos(){
		if (self.contieneMisiles()){
			return 2
		}else{return 1}
	}
	method consecuenciaDeCarga(){contieneMisiles = true}
	
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
	method bultos(){
		return 1 + contenido.sum({c => c.bultos()})
	}
	method consecuenciaDeCarga(){contenido.forEach({c => c.consecuenciaDeCarga()})}
}

object residuosRadioactivos {
	var property peso = 0
	
	method nivelDePeligrosidad() = 200
	method bultos() = 1
	method consecuenciaDeCarga(){peso += 15}
	
}



object embalajeSeguridad {
	var cosaEnvuelta
	
	method envolver(cosa){cosaEnvuelta = cosa} 
	method peso()= cosaEnvuelta.peso()
	method nivelDePeligrosidad() = cosaEnvuelta.nivelDePeligrosidad()/2
	method bultos() = 2
	method consecuenciaDeCarga(){}
	
}






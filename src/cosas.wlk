/* Bien. Te cambié el objeto bumblebee para que quede igual a cosas2, el resto
 * fijate las sugerencias en cosas2
 */

object knightRider {
	method peso() = 500
	method nivelDePeligrosidad() = 10
}

object bumblebee {
		/* Bien. Hubiese sido más simple usar una variable booleana
		 * para representar si está transformado en auto, ya que 
		 * puede tener 2 estados: auto o robot. No está mal tu solución
		 * solo te dejo la variante usando la variable booleana, verás
		 * que queda más simple. Otra cosa a tener en cuenta que por lo
		 * general no conviene usar string para definir valores de un atributo, 
		 * siempre será mejor opción usar objetos.
		 */
	var property transformadoEnAuto = true
	method peso() = 800
	method nivelDePeligrosidad() = if (transformadoEnAuto) 15 else 30
	method consecuenciaDeCarga(){transformadoEnAuto = false}

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






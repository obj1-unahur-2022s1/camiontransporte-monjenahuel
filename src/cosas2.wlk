/*
 * cosas2: Bien. Solo te dejé sugerencias de otras formas para
 * escribir el código y/o simplificarlo 
 */

//Bultos

object knightRider {
	/* Bien */
	method peso() = 500
	method nivelDePeligrosidad() = 10
	method bultos()= 1
	method consecuenciaDeCarga(){}
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
	method bultos() = 2
	method consecuenciaDeCarga(){transformadoEnAuto = false}

}

object paqueteLadrillos{
	/* Bien. Te simplifico un poco el código de bultos() */
	var property cantLadrillos
	
	method nivelDePeligrosidad() = 2
	
	method peso() = cantLadrillos * 2
	
	method bultos() = 
		if(cantLadrillos.between(1,100)) 1
		else if(cantLadrillos <= 300) 2
		else 3

	method consecuenciaDeCarga(){cantLadrillos += 12}
		
}

object arena {
	/* Bien */
	var property peso = 0
	
	method nivelDePeligrosidad() = 1
	method bultos() = 1
	method consecuenciaDeCarga(){peso += 20}
	
}

object bateriaAntiarea {
	/* Bien */
	var property contieneMisiles = true
	
	method peso(){
		if (self.contieneMisiles()){
			return 300
		}else{return 200}
	}
	
	method nivelDePeligrosidad(){ 
	/* Bien. Te escribo otra forma de expresarlo */
		return 
		if (self.contieneMisiles()) {100}
		else {0}
	}
	method bultos(){
		/* Bien */
		if (self.contieneMisiles()){
			return 2
		}else{return 1}
	}
	method consecuenciaDeCarga(){contieneMisiles = true}
	
}

object contenedor {
	/* Bien */
	const contenido = [] // las listas pueden ser constantes si solo cambiarán sus elementos.
	
	method peso() = 100 + contenido.sum({c => c.peso()})
	
	method nivelDePeligrosidad() =
		/* Bien. Cuando una expresión queda tan extensa, es oportuno pensar
		 * en utilizar métodos auxiliares. Está correcta tu solución, solo
		 * te dejo otra forma que queda más simplificado.
		 */
		 if (contenido.isEmpty()) 0
		 else self.contConMaxPeligrosidad().nivelDePeligrosidad()
	
	method contConMaxPeligrosidad() = contenido.max({c => c.nivelDePeligrosidad()})
	method cargar(cosa) = contenido.add(cosa)
	method descargar(cosa) = contenido.remove(cosa)
	method bultos(){
		return 1 + contenido.sum({c => c.bultos()})
	}
	method consecuenciaDeCarga(){contenido.forEach({c => c.consecuenciaDeCarga()})}
}

object residuosRadioactivos {
	/* Bien */
	var property peso = 0
	
	method nivelDePeligrosidad() = 200
	method bultos() = 1
	method consecuenciaDeCarga(){peso += 15}
	
}



object embalajeSeguridad {
	/* Bien */
	var cosaEnvuelta
	
	method envolver(cosa){cosaEnvuelta = cosa} 
	method peso()= cosaEnvuelta.peso()
	method nivelDePeligrosidad() = cosaEnvuelta.nivelDePeligrosidad()/2
	method bultos() = 2
	method consecuenciaDeCarga(){}
	
}






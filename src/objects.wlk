class Prenda{
	var tipoOferta
	var precioEstandar
	
	
	method precio(){
		return tipoOferta.precio(precioEstandar)
	}
	
}

class Oferta{
	
	method precio(unPrecioEstanda){
		return unPrecioEstanda
	}
}

class PrendaNueva inherits Oferta{
	
	
}

class PrendaPromocion inherits Oferta{
	
	var descuentoEstandar
	
	override method precio(unPrecioEstandar){
		return unPrecioEstandar - descuentoEstandar
	}
}

class PrendaLiquidacion inherits Oferta{

	override method precio(unPrecioEstandar){
		return unPrecioEstandar / 2
	}
}

class Venta{
	var listaPrendasAdquiridas
	var metodoPago
	
	
	method valorFinal(){
		return metodoPago.valorFinal(listaPrendasAdquiridas)
	}
	
	method agregarPrendaACompra(unaPrenda){
		listaPrendasAdquiridas += unaPrenda
	}
}

class MetodoPago{
	
	method valorFinal(listaPrendasAdquiridas){
		return 0
	}
	
	
}

class Efectivo inherits MetodoPago{
	
	override method valorFinal(listaPrendasAdquiridas){
	
	return listaPrendasAdquiridas.foldl{unaPrenda => unaPrenda.precio()}
	}
}
/*
class Tarjeta inherits MetodoPago{
	var cantidadCuotas
	var coeficienteFijo
	
	method recargo(unValor){
		return unValor + cantidadCuotas * coeficienteFijo + unValor*0.01
	}
	
	override method valorFinal(listaPrendasAdquiridas){
		var unValorSinRegargo = listaPrendasAdquiridas.foldl{unaPrenda => unaPrenda.precio()}
			
		
		return recargo(unValorSinRegargo) //se que esta mal escrito pero no receurdo como se hace bien la idea es aplicar el recargo a un
		valor especifico que devolviera el fold 
		
	
}

}
*/
class Macowins{
	var listaVentas
	
	method gananciaVentas(){
		return listaVentas.foldl{unaVenta => unaVenta.valorFinal()}
	}
}


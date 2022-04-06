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
	var fechaCompra
	
	method verificarFecha(unaFecha){
		
	return fechaCompra == unaFecha
	}
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

class Tarjeta inherits MetodoPago{
	var cantidadCuotas
	var coeficienteFijo
	
	method recargo(unValor){
		return unValor + cantidadCuotas * coeficienteFijo + unValor*0.01
	}
	
	override method valorFinal(listaPrendasAdquiridas){
		var unValorSinRegargo = listaPrendasAdquiridas.foldl{unaPrenda => unaPrenda.precio()}
			
		
		return self.recargo(unValorSinRegargo) 
		
	
}

}

class Macowins{
	var listaVentas
	
	method ventasDeUnDiaEspecifico(unDia){
		return listaVentas.filter{unaVenta => unaVenta.verificarFecha(unDia)}
	}
	
	method gananciaVentasDeUnDiaEspecifico(unDia){
		var listaVentasDiaEspecifico = listaVentas.ventasDeUnDiaEspecifico(unDia)
		return listaVentasDiaEspecifico.foldl{unaVenta => unaVenta.valorFinal()}
	}
}


object pepita {
	var energia = 100
	
	method validarVuelo(distancia) {
		if (self.energiaQueGastaVolando(distancia) > energia) self.error(
				(("La energia " + energia) + " no es suficiente para volar ") + distancia
			)
	}
	
	method energiaQueGastaVolando(distancia) = 10 + distancia
	
	method comer(comida) {
		energia += comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		self.validarVuelo(distancia)
		energia -= self.energiaQueGastaVolando(distancia)
	}
	
	method puedeVolar(distancia){
		return self.energiaQueGastaVolando(distancia) < energia
	}

	method energia() = energia
}

object alpiste {
	method energiaQueAporta() = 20
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() = madurez
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() = base * madurez
}

object pepon {
	var energia = 30
	
	method energia() = energia
	
	method validarVuelo(distancia) {
		if (self.energiaQueGastaVolando(distancia) > energia) self.error(
				(("La energia " + energia) + " no es suficiente para volar ") + distancia
			)
	}
	
	method energiaQueGastaVolando(distancia) = 20 + (2 * distancia)
	
	method comer(comida) {
		energia += energia + (comida.energiaQueAporta() / 2)
	}
	
	method volar(distancia) {
		self.validarVuelo(distancia)
		energia -= self.energiaQueGastaVolando(distancia)
	}

	method puedeVolar(distancia){
		return self.energiaQueGastaVolando(distancia) < energia
	}
}

object roque {
	var ave = pepita
	var cenas = 0
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas += 1
	}
}

object milena {
	const aves = #{}
	
	method agregarAve(ave) {
		aves.add(ave)
	}
	
	method movilizarTodasSusAves(distancia) {
		if(not aves.all({ave => ave.puedeVolar(distancia)})){
			self.error("No puede movilizar todas sus aves")
		}
		aves.forEach({ ave => 
		ave.volar(distancia) })
	}
}
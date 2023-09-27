class Pasajero{
    const property ancho 
    const property largo
    const property tieneBanio = true
    var property estaOrdenado = true 

    method capacidadMax() = 0.max(self.cantidadPasajerosPosible() - self.restaPorOrden())
    
    method cantidadPasajerosPosible() = if(ancho <= 3){8*largo}else{10*largo}

    method restaPorOrden() = if(estaOrdenado){0}else{15}

    method cargaMax() = if(tieneBanio){300}else{800}

    method pesoMax() = 2000 + (self.capacidadMax()*80) + self.cargaMax()

    method esPopular() = self.capacidadMax() > 50

    method esCarguero = self.cargaMax() > 1000

    method recibirMantenimiento(){
        self.estaOrdenado(true)
    }

    method conPasajeros() = self.capacidadMax > 0

}

class Carga{
    const property cargaMaxIdeal
    var property maderasSueltas

    method capacidadMax() = 0

    method cargaMax() = 0.max(cargaMaxIdeal - (maderasSueltas*400))

    method pesoMax() = 1500 + self.cargaMax()

    method tieneBanio() = false

    method esPopular() = self.capacidadMax() > 50

    method esCarguero = self.cargaMax() > 1000

    method recibirMantenimiento(){
        maderasSueltas = 0.max(maderasSueltas - 2)
    }

    method conPasajeros() = self.capacidadMax() > 0

}

class Dormitorio{
    const property compartimientos 
    const property camas

    method capacidadMax() = compartimientos*camas

    method cargaMax() = 1200

    method pesoMax() = 4000 + (self.capacidadMax()*80) + self.cargaMax()

    method tieneBanio() = true

    method esPopular() = self.capacidadMax() > 50

    method esCarguero = self.cargaMax() > 1000

    method recibirMantenimiento(){}

    method conPasajeros() = self.capacidadMax > 0

}
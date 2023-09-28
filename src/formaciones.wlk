import vagones.*
import locomotoras.*

class Formacion{
    const locomotoras = []
    const vagones = []

    //vagones
    method agregarVagon(unVagon){
        vagones.add(unVagon)
    }

    method sacarVagon(unVagon){
        vagones.remove(unVagon)
    }

    method capacidadMax() = vagones.sum({vagon => vagon.capacidadMax()})

    method cantidadVagonesPopulares() = vagones.count({vagon => vagon.esPopular()})

    method esCarguero() = vagones.all({vagon => vagon.esCarguero()})

    method vagonMasPesado() = vagones.max({vagon => vagon.pesoMax()})

    method vagonMasLiviano() = vagones.min({vagon => vagon.pesoMax()})

    method dispersionDePesos() = self.vagonMasPesado.pesoMax() - self.vagonMasLiviano.pesoMax()

    method cantidadBanios() = vagones.count({vagon => vagon.tieneBanio()})

    method hacerMantenimientoVagones(){
        vagones.forEach({vagon => vagon.recibirMantenimiento()})
    }

    method vagonesConPasajeros() = vagones.filter({vagon => vagon.conPasajeros()})

    method vagonConPasajerosMin() = self.vagonesConPasajeros.min({vagon => vagon.capacidadMax()})
    
    method vagonConPasajerosMax() = self.vagonesConPasajeros.max({vagon => vagon.capacidadMax()})

    method estaEquilibrada() = (self.vagonConPasajerosMax().capacidadMax() - self.vagonConPasajerosMin().capacidadMax()) <= 20

    method estaOrganizada() = not (1..vagones.size()-1).any({i => not vagones.get(i-1).conPasajeros() and vagones.get(i).conPasajeros()})

    method pesoVagones() = vagones.sum({vagon => vagon.pesoMax()})

    //locomotoras
     method agregarLocomotora(unaLocomotora){
        locomotoras.add(unaLocomotora)
    }

    method sacarLocomotora(unaLocomotora){
        locomotoras.remove(unaLocomotora)
    }

    method velocidadMax() = self.locomotoraMenosVeloz().velocidadMax()

    method locomotoraMenosVeloz() = locomotoras.min({locomotora => locomotora.velocidadMax()})

    method esEficiente() = locomotoras.all({locomotora => locomotora.esEficiente()})

    method puedeMoverse() = self.kgEmpujeFaltantes() == 0

    method pesoAArrastrarMax() = locomotoras.sum({locomotora => locomotora.pesoAArrastrar()})

    method kgEmpujeFaltantes() = 0.max( self.pesoTotal() - self.pesoAArrastrarMax())

    method pesoLocomotoras() = locomotoras.sum(locomotora => locomotora.peso())

    method pesoTotal() = self.pesoLocomotoras() + self.pesoVagones()

}
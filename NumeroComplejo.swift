//
//  NumeroComplejo.swift
//  Matrix Resolve
//
//  Created by Mario Leguízamo Vega on 13/11/21.
//

import Foundation

class NumeroComplejo {
    var real:Fraccion
    var imaginario:Fraccion
    
    
    init() {
        self.real = Fraccion()
        self.imaginario = Fraccion()
    }
    
    init(aEntreB fracionReal:Fraccion, cEntreDi fracionImaginaria:Fraccion) {
        self.real = fracionReal
        self.imaginario = fracionImaginaria
    }
    
    init(a real:Int, bi imaginario:Int) {
        self.real = Fraccion(real, entre: 1)
        self.imaginario = Fraccion(imaginario, entre: 1)
    }
    
    init(a numeradorReal:Int, entreB denominadorReal:Int, ci numeradorImaginario:Int, entreD denominadorImaginario:Int) {
        self.real = Fraccion(numeradorReal, entre: denominadorReal)
        self.imaginario = Fraccion(numeradorImaginario, entre: denominadorImaginario)
    }
    
    
    
    class func sumarNumerosComplejos(_ numeroComplejoA:NumeroComplejo, mas numeroComplejoB:NumeroComplejo) -> NumeroComplejo {
        //let sumaReal = Fraccion.sumarFracciones(numeroComplejoA.real, mas: numeroComplejoB.real)
        //let sumaImaginaria = Fraccion.sumarFracciones(numeroComplejoA.imaginario, mas: numeroComplejoB.imaginario)
        return NumeroComplejo(aEntreB: Fraccion.sumarFracciones(numeroComplejoA.real, mas: numeroComplejoB.real), cEntreDi: Fraccion.sumarFracciones(numeroComplejoA.real, mas: numeroComplejoB.real))
    }
    
    class func restarNumerosComplejos(_ numeroComplejoA:NumeroComplejo, menos numeroComplejoB:NumeroComplejo) -> NumeroComplejo {
        return NumeroComplejo(aEntreB: Fraccion.restarFracciones(numeroComplejoA.real, menos: numeroComplejoB.real), cEntreDi: Fraccion.restarFracciones(numeroComplejoA.real, menos: numeroComplejoB.real))
    }
    
    class func multiplicarrNumerosComplejos(_ numeroComplejoA:NumeroComplejo, por numeroComplejoB:NumeroComplejo) -> NumeroComplejo {
        return NumeroComplejo(aEntreB: Fraccion.multiplicarFracciones(numeroComplejoA.real, por: numeroComplejoB.real), cEntreDi: Fraccion.multiplicarFracciones(numeroComplejoA.real, por: numeroComplejoB.real))
    }
    
    class func dividirNumerosComplejos(_ numeroComplejoA:NumeroComplejo, entre numeroComplejoB:NumeroComplejo) -> NumeroComplejo {
        return NumeroComplejo(aEntreB: Fraccion.dividirFracciones(numeroComplejoA.real, entre: numeroComplejoB.real), cEntreDi: Fraccion.dividirFracciones(numeroComplejoA.real, entre: numeroComplejoB.real))
    }
}

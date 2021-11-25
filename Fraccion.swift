//
//  Fraccion.swift
//  Matrix Resolve
//
//  Created by Mario Leguízamo Vega on 05/11/21.
//

import Foundation

class Fraccion {
    var numerador:Int
    var denominador:Int
    
    
    init() {
        self.numerador = 0
        self.denominador = 1
    }
    
    init(_ numerador:Int, entre denominador:Int) {
        if denominador > 0 {                    //Si el denominador es positivo inicializa normal
            self.numerador = numerador
            self.denominador = denominador
        } else  if denominador < 0 {            //Si el denominador es negativo cambiamos los signos
            self.numerador = -1 * numerador
            self.denominador = -1 * denominador
        } else {                                //Si el denominador es 0 no se puede dividir entre 0
            self.numerador = 0
            self.denominador = 1
        }
        reducirFraccion()
    }
    
    init(decimal:Double) {
        let cadenaDecimal = String(decimal)
        let rangoDecimales:Range<String.Index> = cadenaDecimal.firstIndex(of: ".")!..<cadenaDecimal.endIndex
        var multiplicador:Double = 1.0
        
        for _ in 0 ..< cadenaDecimal[rangoDecimales].count - 1 {
            multiplicador *= 10
        }
        
        self.numerador = Int(decimal * multiplicador)
        self.denominador = Int(multiplicador)
        reducirFraccion()
    }
    
    
    
    func reducirFraccion() {
        let signo = self.denominador < 0 ? -1:1
        var numerador = abs(self.numerador)
        var denominador = abs(self.denominador)
        var residuo:Int
        
        while denominador != 0 {
            residuo = numerador % denominador
            numerador = denominador
            denominador = residuo
        }
        self.numerador /= numerador * signo
        self.denominador /= numerador * signo
    }
    
    
    class func sumarFracciones(_ fraccionA:Fraccion, mas fraccionB:Fraccion) -> Fraccion {
        return Fraccion(fraccionA.numerador * fraccionB.denominador + fraccionA.denominador * fraccionB.numerador, entre: fraccionA.denominador * fraccionB.denominador)
    }
    
    class func restarFracciones(_ fraccionA:Fraccion, menos fraccionB:Fraccion) -> Fraccion {
        return Fraccion(fraccionA.numerador * fraccionB.denominador - fraccionA.denominador * fraccionB.numerador, entre: fraccionA.denominador * fraccionB.denominador)
    }
    
    class func multiplicarFracciones(_ fraccionA:Fraccion, por fraccionB:Fraccion) -> Fraccion {
        return Fraccion(fraccionA.numerador * fraccionB.numerador, entre: fraccionA.denominador * fraccionB.denominador)
    }
    
    class func dividirFracciones(_ fraccionA:Fraccion, entre fraccionB:Fraccion) -> Fraccion {
        return Fraccion(fraccionA.numerador * fraccionB.denominador, entre: fraccionA.denominador * fraccionB.numerador)
    }
}

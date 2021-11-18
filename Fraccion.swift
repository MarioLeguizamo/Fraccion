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
        reducir()
    }
    init(decimal:Double) {
        let parteEntera = Int(decimal)
        let parteDecimal = decimal - Double(parteEntera)
        
        self.numerador = parteEntera * Int(1/parteDecimal) + 1
        self.denominador = Int(1 / parteDecimal)
        if denominador < 0 {                    //Si el denominador es negativo cambiamos los signos
            self.numerador = -1 * numerador
            self.denominador = -1 * denominador
        }
        
        var var0 = Int(decimal)
        var var1 = decimal - Double(var0)
        var var2 = 1.0
        var cifrasDecimales = 0
        while abs(var2) > 0 {
            var1 *= 10
            var2 = var1 - Double(Int(var1))
            cifrasDecimales += 1
        }
    }
    
    func reducir() {
        let signo = self.denominador < 0 ? -1:1
        var numerador = abs(self.numerador)
        var denominador = abs(self.denominador)
        var residuo: Int
        
        while denominador != 0 {
            residuo = numerador % denominador
            numerador = denominador
            denominador = residuo
        }
        self.numerador /= numerador * signo
        self.denominador /= numerador * signo
    }
    
    class func sumar(_ fraccionA:Fraccion, mas fraccionB:Fraccion) -> Fraccion {
        let resultado = Fraccion(fraccionA.numerador * fraccionB.denominador + fraccionA.denominador * fraccionB.numerador, entre: fraccionA.denominador * fraccionB.denominador)
        resultado.reducir()
        
        return resultado
    }
    
    class func restar(_ fraccionA:Fraccion, menos fraccionB:Fraccion) -> Fraccion {
        let resultado = Fraccion(fraccionA.numerador * fraccionB.denominador - fraccionA.denominador * fraccionB.numerador, entre: fraccionA.denominador * fraccionB.denominador)
        resultado.reducir()
        
        return resultado
    }
    
    class func multiplicar(_ fraccionA:Fraccion, por fraccionB:Fraccion) -> Fraccion {
        let resultado = Fraccion(fraccionA.numerador * fraccionB.numerador, entre: fraccionA.denominador * fraccionB.denominador)
        resultado.reducir()
        
        return resultado
    }
    
    class func dividir(_ fraccionA:Fraccion, entre fraccionB:Fraccion) -> Fraccion {
        let resultado = Fraccion(fraccionA.numerador * fraccionB.denominador, entre: fraccionA.denominador * fraccionB.numerador)
        resultado.reducir()
        
        return resultado
    }
}

//let v = Fraccion(decimal: 3.025)

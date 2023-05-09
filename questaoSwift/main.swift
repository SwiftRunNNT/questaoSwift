// Crie uma struct chamada "Ponto" com as propriedades "x" e "y" que representam
// coordenadas em um plano cartesiano. Escreva uma função que receba um array de
// pontos e um ponto como parâmetros e retorne o ponto mais próximo ao pontodado.

import Foundation

// Struct Ponto com as propriedades x e y
struct Ponto {
    var x: Double
    var y: Double
    
    // Calcula a distância entre dois pontos
    func distanciaAoPonto(_ ponto: Ponto) -> Double {
        // d = sqrt((x2 - x1)^2 + (y2 - y1)^2)
        return sqrt(pow(self.x - ponto.x, 2) + pow(self.y - ponto.y, 2))
    }

}

// Função que recebe um array de ponto e um ponto como parâmetros
// e retorna o ponto mais próximo ao ponto dado
func pontoMaisProximo(pontos: [Ponto], ponto: Ponto) -> Ponto? {
    guard !pontos.isEmpty else { // Se o array de pontos estiver vazio, retorna nil
        return nil
    }
    
    var pontoMaisProximo = pontos[0] // Inicializa com o primeiro ponto do array
    
    for p in pontos {
        if p.distanciaAoPonto(ponto) < pontoMaisProximo.distanciaAoPonto(ponto) {
            // Se a distância do ponto atual for menor que a do ponto mais próximo
            // encontrado até agora, atualiza o ponto mais próximo
            pontoMaisProximo = p
        }
    }
    
    return pontoMaisProximo
}


let pontoA = Ponto(x: 2.0, y: 3.0)
let pontoB = Ponto(x: -1.0, y: 4.0)
let pontoC = Ponto(x: 0.0, y: 1.0)
let pontoD = Ponto(x: 5.0, y: 0.0)

let pontos = [pontoA, pontoB, pontoC, pontoD]

let pontoProximo = pontoMaisProximo(pontos: pontos, ponto: Ponto(x: 1.0, y: 1.0))

print(pontoProximo as Any) // Saída: Ponto(x: 0.0, y: 1.0)

//
//  ViagemOfertaViewModel.swift
//  AluraViagensStoryboard
//
//  Created by Caio Serpa on 18/08/22.
//

import Foundation

class ViagemOfertaViewModel: ViagemViewModel {
    var tituloSessao: String {
        return "Ofertas"
    }

    var tipo: ViagemViewModelType {
        return .ofertas
    }

var viagens: [Viagem]

    var numeroDeLinhas: Int {
        return 1
    }

    // MARK: INICIALIZADOR
    
    init(_ viagens: [Viagem]) {
        self.viagens = viagens
    }

}

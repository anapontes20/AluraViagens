//
//  ViagemDestaqueViewModel.swift
//  AluraViagensStoryboard
//
//  Created by Caio Serpa on 22/07/22.
//

import Foundation

class ViagemDestaqueViewModel: ViagemViewModel {
    var tituloSessao: String {
        return "Destaques"
    }
    var tipo: ViagemViewModelType {
        return .destaques
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        return viagens.count
    }
    init (_ viagens: [ Viagem ]) {
        self .viagens = viagens
    }
}

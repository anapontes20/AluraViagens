//
//  OfertaTableViewCell.swift
//  AluraViagensStoryboard
//
//  Created by Caio Serpa on 18/08/22.
//

import UIKit

protocol OfertaTableViewCellDelegate: AnyObject{
    func didSelectView( _ viagem:Viagem?)
}
class OfertaTableViewCell: UITableViewCell {

    
    //MARK: IBOUTLET
    
    @IBOutlet var viagemImages: [UIImageView]!
    @IBOutlet var tituloViagemLabels: [UILabel]!
    @IBOutlet var precoLabels: [UILabel]!
    @IBOutlet var subtituloViagemLabels: [UILabel]!
    @IBOutlet var precoSemDescontoLabels: [UILabel]!
    @IBOutlet var fundoViews: [UIView]!
    
    weak var delegate: OfertaTableViewCellDelegate?
    
    private var viagens: [Viagem]?
    
    
    func configuraCelula( _ viagens: [Viagem]?) {
        
        self.viagens = viagens
        guard let listaDeViagens = viagens else { return }
        
        for i in 0..<listaDeViagens.count {
            setOutlets (i, viagem: listaDeViagens[i])
        }
        fundoViews.forEach{ viewAtual in
            viewAtual.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didSelectView(_:))))
            viewAtual.addSombra()
        }
    }
    func setOutlets ( _ index: Int, viagem: Viagem) {
        let imageOutlet = viagemImages[index]
        imageOutlet.image = UIImage( named: viagem.asset)
        
        let tituloOutlet = tituloViagemLabels[index]
        tituloOutlet.text = viagem.titulo
        
        let subtituoOutlet = subtituloViagemLabels [index]
        subtituoOutlet.text = viagem.subtitulo
        
        let precoSemDescontoOutlet = precoSemDescontoLabels[index]
        precoSemDescontoOutlet.text = "A partir de R$ \(viagem.precoSemDesconto)"
        
        let precoOutlet = precoLabels[index]
        precoOutlet.text = "R$ \(viagem.preco)"
        
    }
    
    @objc func didSelectView(_ gesture: UIGestureRecognizer){
        
        if let selectedView = gesture.view{
            let viagemSelecionada = viagens?[selectedView.tag]
            delegate?.didSelectView(viagemSelecionada)
        }
    }
}

//
//  DetalheViewController.swift
//  AluraViagensStoryboard
//
//  Created by Caio Serpa on 19/08/22.
//

import UIKit

class DetalheViewController: UIViewController {

    
    // MARK: - IBoutlets:
    
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var diariaViagemLabel: UILabel!
    @IBOutlet weak var continuarButton: UIButton!
    @IBOutlet weak var precoViagemLabel: UILabel!
    @IBOutlet weak var precoSemDescontoLabel: UILabel!
    
    //MARK: - ATRIBUTOS
    
    var viagem: Viagem?
    
    // MARK: - View Life Cycle:

    
    class func instanciar(_ viagem: Viagem) -> DetalheViewController {
        let detalhesViewController = DetalheViewController(nibName: String(describing: self), bundle: nil)
        detalhesViewController.viagem = viagem
        
        return detalhesViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configuraView()
    }
    
    func configuraView() {
        viagemImage.image = UIImage(named: viagem?.asset ?? "")
        tituloViagemLabel.text = viagem?.titulo
        subtituloViagemLabel.text = viagem?.subtitulo
        precoViagemLabel.text = "R$ \(viagem?.preco ?? 0)"
        continuarButton.layer.cornerRadius = 5
        
        let atributoString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(viagem?.precoSemDesconto ?? 0)")
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, atributoString.length))
        precoSemDescontoLabel.attributedText = atributoString
        
        if let numeroDeDias = viagem?.diaria, let numeroDeHospedes = viagem?.hospedes {
            let diarias = numeroDeDias == 1 ? "Diária" : "Diárias"
            let hospedes = numeroDeHospedes == 1 ? "Pessoa" : "Pessoas"
            
            diariaViagemLabel.text = "\(numeroDeDias) \(diarias) - \(numeroDeHospedes) \(hospedes)"
        }
    }
    
    
// MARK: - Actions
    
    @IBAction func botaolVoltar(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
  }


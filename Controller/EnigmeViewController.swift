//
//  ViewController.swift
//  enigmes
//
//  Created by DZ on 30/01/2021.
//

import UIKit

class EnigmeViewController: UIViewController {
    
    var enigme: Enigme = Enigme(titre: "", texte: "", reponse: "", explication: "")
    
    @IBOutlet weak var titreEnigmeLabel: UILabel!
    
    @IBOutlet weak var texteEnigmeLabel: UILabel!
    
    @IBOutlet weak var reponseTextFieldLabel: UITextField!
    
    @IBOutlet weak var reponseBouton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titreEnigmeLabel.text = enigme.titre
        self.texteEnigmeLabel.text = enigme.texte
    }

}


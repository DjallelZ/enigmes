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
    
    
    @IBAction func clicBoutonReponse(_ sender: Any) {
        var alertController:UIAlertController
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        if reponseTextFieldLabel.text!.contains(enigme.reponse) {
            alertController = UIAlertController(title: "Félicitations !", message: enigme.explication, preferredStyle: .alert)
        } else {
            alertController = UIAlertController(title: "Dommage", message: "Ce n'est pas la réponse attendue.", preferredStyle: .alert)
        }
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}


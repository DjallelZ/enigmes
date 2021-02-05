//
//  ViewController.swift
//  enigmes
//
//  Created by DZ on 30/01/2021.
//

import UIKit

class EnigmeViewController: UIViewController {
    
    // Variable contenant l'enigme envoyé par ListViewController suite au clic sur celle-ci dans la liste
    var enigme: Enigme = Enigme(titre: "", texte: "", reponse: "", explication: "", difficulte: "", statut: "")
    
    @IBOutlet weak var titreEnigmeLabel: UILabel!
    
    @IBOutlet weak var texteEnigmeLabel: UILabel!
    
    @IBOutlet weak var reponseTextFieldLabel: UITextField!
    
    @IBOutlet weak var reponseBouton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titreEnigmeLabel.text = enigme.titre
        self.texteEnigmeLabel.text = enigme.texte
    }
    
    // Méthode lancée au clic sur le bouton "Soumettre"
    @IBAction func clicBoutonReponse(_ sender: Any) {
        var alertController:UIAlertController
        
        // Définition du bouton de réponse à l'alerte donnée juste après
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        // Si la réponse donnée contient la réponse de l'énigme, on félicite l'utilisateur au travers d'une alerte tout en lui affichant un petit texte explicatif
        if reponseTextFieldLabel.text!.lowercased().contains(enigme.reponse.lowercased()) {
            alertController = UIAlertController(title: "Félicitations !", message: enigme.explication, preferredStyle: .alert)
        }
        // Sinon on l'informe que ce n'est pas la bonne réponse
        else {
            alertController = UIAlertController(title: "Dommage", message: "Ce n'est pas la réponse attendue.", preferredStyle: .alert)
        }
        // Ajout du de l'action du bouton à l'alerte
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}


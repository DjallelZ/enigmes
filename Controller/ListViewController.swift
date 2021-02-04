//
//  ViewController.swift
//  enigmes
//
//  Created by DZ on 30/01/2021.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var enigmeLabel: UILabel!
    
    @IBOutlet weak var enigmeTitreBouton: UIButton!
    
    var difficulte: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = difficulte
    }
    
    // Récupération de la liste d'énigme depuis l'instance unique de EnigmeService
    let enigmes: [Enigme] = EnigmeService.serviceEnigme.listeEnigmes
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return enigmes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as! Cell
        
        cell.enigmeTitreBouton.setTitle(enigmes[indexPath.row].titre, for: .normal)
        
        return cell
    }
    
    // Préparation de l'énigme à transmettre à la view contenant la liste des enigmes
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Cast du paramètre Any? afin de pouvoir manipuler les attributs de la classe UIButton
        let boutonEmetteur: UIButton = sender as! UIButton
        // objet énigme à envoyer à destination de la view l'affichant
        let enigmeEmise:Enigme = EnigmeService.serviceEnigme.recupererEnigmeViaTitre(titre: boutonEmetteur.currentTitle!)
    
        if segue.destination is EnigmeViewController {
            let viewController = segue.destination as? EnigmeViewController
            viewController?.enigme = enigmeEmise
        }
    }

}


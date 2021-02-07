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
    
    var difficulteChoisie: String = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Modification du titre de navigation avec pour valeur la difficulté choisie
        title = difficulteChoisie
    }
    
    // Récupération de la liste d'énigme depuis l'instance unique de EnigmeService en fonction de la difficulte choisie
    lazy var enigmes: [Enigme] = EnigmeService.serviceEnigme.recupererListeEnigmesParDifficulte(difficulte: difficulteChoisie)
    
    // Génère le nombre de lignes de la tableView en fonction du nombre d'énigmes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return enigmes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Déclaration d'une cellule en utilisant notre classe perso "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as! Cell
        // Affectation du titre du bouton/cellule à partir du titre de l'enigme
        cell.enigmeTitreBouton.setTitle(enigmes[indexPath.row].titre, for: .normal)
        
        return cell
    }
    
    // Préparation de l'énigme à transmettre à la view contenant la liste des enigmes
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Cast du paramètre Any? afin de pouvoir manipuler les attributs de la classe UIButton
        let boutonEmetteur: UIButton = sender as! UIButton
        // Objet énigme à envoyer à destination de la view l'affichant
        let enigmeEmise:Enigme = EnigmeService.serviceEnigme.recupererEnigmeViaTitre(titre: boutonEmetteur.currentTitle!)
        // Si la View destinataire est bien celle qu'il faut, on lui envoie une variable contenant l'objet Enigme
        if segue.destination is EnigmeViewController {
            let viewController = segue.destination as? EnigmeViewController
            viewController?.enigme = enigmeEmise
        }
    }

}


//
//  ViewController.swift
//  enigmes
//
//  Created by DZ on 30/01/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var boutonFacile: UIButton!
    
    @IBOutlet weak var boutonMoyen: UIButton!
    
    @IBOutlet weak var boutonDifficile: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let boutonEmetteur: UIButton = sender as! UIButton
        var difficulteEmise = ""
        
        if boutonEmetteur.currentTitle == "Facile" {
            difficulteEmise = "Facile"
        } else if boutonEmetteur.currentTitle == "Moyen" {
            difficulteEmise = "Moyen"
        } else if boutonEmetteur.currentTitle == "Difficile" {
            difficulteEmise = "Difficile"
        }
        
        if segue.destination is ListViewController {
            let viewController = segue.destination as? ListViewController
            viewController?.difficulte = difficulteEmise
        }
    }
}


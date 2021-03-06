import UIKit

class ViewController: UIViewController {
    // Boutons de difficulté
    @IBOutlet weak var boutonFacile: UIButton!
    @IBOutlet weak var boutonMoyen: UIButton!
    @IBOutlet weak var boutonDifficile: UIButton!
    
    
    // Préparation de la valeur de la variable de difficulté à transmettre à la view contenant la liste des enigmes
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Cast du paramètre Any? afin de pouvoir manipuler les attributs de la classe UIButton
        let boutonEmetteur: UIButton = sender as! UIButton
        // Paramètre de difficulté à envoyer pour générer la liste des enigmes selon le niveau choisi par l'utilisateur
        var difficulteEmise = ""
        
        // Selon le bouton utilisé par l'utilisateur, on affecte la bonne valeur à la variable à envoyer
        if boutonEmetteur.currentTitle == "Facile" {
            difficulteEmise = "Facile"
        } else if boutonEmetteur.currentTitle == "Moyen" {
            difficulteEmise = "Moyen"
        } else if boutonEmetteur.currentTitle == "Difficile" {
            difficulteEmise = "Difficile"
        }
        // On vérifie que c'est bien la vue List qui est destinataire du clic pour lui envoyer la variable
        if segue.destination is ListViewController {
            let viewController = segue.destination as? ListViewController
            viewController?.difficulteChoisie = difficulteEmise
        }
    }
}


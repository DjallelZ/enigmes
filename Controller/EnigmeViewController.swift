import UIKit

class EnigmeViewController: UIViewController {
    
    // Variable contenant l'enigme envoyé par ListViewController suite au clic sur celle-ci dans la liste
    var enigme: Enigme = Enigme(titre: "", texte: "", reponse: "", explication: "", difficulte: "", statut: false)
    
    // Titre de l'énigme
    @IBOutlet weak var titreEnigmeLabel: UILabel!
    // Texte descriptif de l'énigme
    @IBOutlet weak var texteTextView: UITextView!
    // Champ de saisie de la réponse
    @IBOutlet weak var reponseTextFieldLabel: UITextField!
    // Bouton de soumission de la réponse
    @IBOutlet weak var reponseBouton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // A l'affichage de la View on modifie le Label et le TextField pour afficher l'enigme
        self.titreEnigmeLabel.text = enigme.titre
        self.texteTextView.text = enigme.texte
    }
    
    // Méthode lancée au clic sur le bouton "Soumettre"
    @IBAction func clicBoutonReponse(_ sender: Any) {
        // Définition d'une alerte
        var alertController:UIAlertController
        
        // Définition du bouton de réponse à l'alerte donnée juste après
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        // Si la réponse donnée contient la réponse de l'énigme, on félicite l'utilisateur au travers d'une alerte tout en lui affichant un petit texte explicatif
        if reponseTextFieldLabel.text!.lowercased().contains(enigme.reponse.lowercased()) {
            alertController = UIAlertController(title: "Félicitations !", message: enigme.explication, preferredStyle: .alert)
        }
        // Sinon on l'informe que ce n'est pas la bonne réponse
        else {
            alertController = UIAlertController(title: "Réessayez !", message: "Ce n'est pas la réponse attendue.", preferredStyle: .alert)
        }
        // Ajout de l'action du bouton à l'alerte
        alertController.addAction(action)
        // Présentation de l'alerte à la View
        present(alertController, animated: true, completion: nil)
    }
}


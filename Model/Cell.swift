import UIKit

class Cell : UITableViewCell {
    // Label du titre de l'énigme
    @IBOutlet weak var enigmeLabel: UILabel!
    // Bouton englobant le titre afin de pouvoir passer sur la vue EnigmeView via un clic
    @IBOutlet weak var enigmeTitreBouton: UIButton!
}

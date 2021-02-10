// Classe représentant les objets Enigme
class Enigme: Codable { // Codable est l'alias des deux protocoles Encodable et Decodable pour l'encodage/décodage des fichiers
    // Attributs
    var titre: String = ""
    var texte: String = ""
    var reponse: String = ""
    var explication: String = ""
    var difficulte: String = ""
    // Le statut représente le succès ou non à cette énigme
    var statut: Bool
    
    // Constructeur
    init(titre: String, texte: String, reponse: String, explication: String, difficulte: String, statut: Bool) {
        self.titre = titre
        self.texte = texte
        self.reponse = reponse
        self.explication = explication
        self.difficulte = difficulte
        self.statut = statut
    }
}

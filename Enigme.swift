class Enigme: Codable {
    // Attributs
    var titre: String = ""
    var texte: String = ""
    var reponse: String = ""
    var explication: String = ""
    var difficulte: String = ""
    var statut: String = ""
    
    // Constructeur
    init(titre: String, texte: String, reponse: String, explication: String, difficulte: String, statut: String) {
        self.titre = titre
        self.texte = texte
        self.reponse = reponse
        self.explication = explication
        self.difficulte = difficulte
        self.statut = statut
    }
    
}

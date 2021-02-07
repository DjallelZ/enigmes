import Foundation

class EnigmeService {
    
    static var serviceEnigme = EnigmeService()
    
    private init(){
        remplirCollectionEnigmes()
    }

    var listeEnigmes: [Enigme] = []
    
    // Remplissage du tableau d'enigmes à partir d'un fichier JSON
    private func remplirCollectionEnigmes() {
        if let cheminFichier = Bundle.main.url(forResource: "enigmes", withExtension: "json") {
            do {
                let donnees = try Data(contentsOf: cheminFichier)
                let jsonDecoder = JSONDecoder()
                let donneesJson = try jsonDecoder.decode([Enigme].self, from: donnees)
                print(donneesJson)
                self.listeEnigmes = donneesJson
            } catch {
                print(error)
            }
        }
    }
    
    func recupererEnigmeViaTitre(titre: String) -> Enigme {
        var enigmeARenvoyer:Enigme = Enigme(titre: "", texte: "", reponse: "", explication: "", difficulte: "", statut:"")
        for enigme in listeEnigmes {
            if enigme.titre == titre {
                enigmeARenvoyer = enigme
            }
        }
        return enigmeARenvoyer
    }
    
    func recupererListeEnigmesParDifficulte(difficulte: String) -> [Enigme] {
        var listeEnigmesARenvoyer: [Enigme] = []
        for enigme in listeEnigmes {
            if enigme.difficulte == difficulte {
                listeEnigmesARenvoyer.append(enigme)
            }
        }
        return listeEnigmesARenvoyer
    }

}

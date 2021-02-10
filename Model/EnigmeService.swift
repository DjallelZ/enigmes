import Foundation

class EnigmeService {
    // Objet déclaré pour le Singleton
    static var serviceEnigme = EnigmeService()
    // Tableau contenant les différentes énigmes
    var listeEnigmes: [Enigme] = []
    
    // A la création de l'instance, on lance la récupération des énigmes et son remplissage dans le tableau listeEnigmes
    private init(){
        remplirCollectionEnigmes()
    }

    // Remplissage du tableau d'enigmes à partir de la lecture d'un fichier JSON
    private func remplirCollectionEnigmes() {
        // Déclaration du chemin d'accès au fichier
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
    
    // Renvoie une énigme à partir de son titre
    func recupererEnigmeViaTitre(titre: String) -> Enigme {
        var enigmeARenvoyer:Enigme = Enigme(titre: "", texte: "", reponse: "", explication: "", difficulte: "", statut:false)
        // Pour chaque énigme contenue dans le tableau listeEnigmes
        for enigme in listeEnigmes {
            // Si le titre correspond à celui que l'on recherche, on renvoie l'enigme
            if enigme.titre == titre {
                enigmeARenvoyer = enigme
            }
        }
        return enigmeARenvoyer
    }
    
    // Renvoie une liste d'enigmes ayant pour difficulté la difficulté saisie
    func recupererListeEnigmesParDifficulte(difficulte: String) -> [Enigme] {
        var listeEnigmesARenvoyer: [Enigme] = []
        // Pour chaque énigme
        for enigme in listeEnigmes {
            // Si celle-ci a la difficulté voulue, on l'ajoute à un tableau
            if enigme.difficulte == difficulte {
                listeEnigmesARenvoyer.append(enigme)
            }
        }
        // On renvoie le tableau d'enigmes avec la bonne difficulté
        return listeEnigmesARenvoyer
    }

}

class EnigmeService {
    
    static var serviceEnigme = EnigmeService()
    
    private init(){
        remplirCollectionEnigmes()
    }

    var listeEnigmes: [Enigme] = []
    
    private func remplirCollectionEnigmes() {
        let enigme:Enigme = Enigme(titre: "Titre 1",texte: "Texte ",reponse: "Reponse ",explication: "Explication ")
        
        self.listeEnigmes.append(enigme)
        
        for _ in 1...10 {
            let enigme:Enigme = Enigme(titre: "Titre ",texte: "Texte ",reponse: "Reponse ",explication: "Explication ")
            
            self.listeEnigmes.append(enigme)
        }
    }
    
    func recupererEnigmeViaTitre(titre: String) -> Enigme {
        var enigmeARenvoyer:Enigme = Enigme(titre: "", texte: "", reponse: "", explication: "")
        for enigme in listeEnigmes {
            if enigme.titre == titre {
                enigmeARenvoyer = enigme
            }
        }
        return enigmeARenvoyer
    }

}

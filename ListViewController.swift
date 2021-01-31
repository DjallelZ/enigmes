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
    
    let enigmes = ["Enigme 1", "Enigme 2", "Enigme 3"]
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return enigmes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as! Cell
        
        cell.enigmeTitreBouton.setTitle(enigmes[indexPath.row], for: .normal)
        
        return cell
    }

}


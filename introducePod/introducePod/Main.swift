//
//  ViewController.swift
//  introducePod
//
//  Created by myoung on 27/09/2018.
//  Copyright © 2018 myoung. All rights reserved.
//

import UIKit


class Main: UIViewController {
    
    var tableTitles = ["1. Magnetic Library"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let segueIdentifier = segue.identifier else {
            print("error")
            return
        }
        
        switch segueIdentifier {
        case "segue magnetic": break
        default: break
        }
        

    }
}

extension Main: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableView", for: indexPath) as? MainCell else { return UITableViewCell() }
        cell.titleLabel.text = tableTitles[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

class MainCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

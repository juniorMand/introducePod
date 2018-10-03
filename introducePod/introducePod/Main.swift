//
//  ViewController.swift
//  introducePod
//
//  Created by myoung on 27/09/2018.
//  Copyright © 2018 myoung. All rights reserved.
//

import UIKit


class Main: UIViewController {
    
    var tableTitles = ["1. Magnetic Library", "2. SwiftyJSON"]
    var storyboardIds = ["magneticCocoaPods", "SwiftyJSONCocoaPods"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
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
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: storyboardIds[indexPath.row])
        self.navigationController?.pushViewController(controller, animated: true)
                
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

class MainCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

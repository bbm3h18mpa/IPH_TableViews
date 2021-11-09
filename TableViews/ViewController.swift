//
//  ViewController.swift
//  TableViewskge
//
//  Created by Florian Panten / BBS2H20A BBM3H18M on 08.11.21.
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var games = ["Gta V", "Minecraft", "CS:GO"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.rightBarButtonItem = editButtonItem
        title = "Spiele"
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = games[indexPath.row]
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

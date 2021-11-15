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
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var games = ["Gta V", "Minecraft", "CS:GO"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.rightBarButtonItem = editButtonItem
        title = "Spiele"
        tableView.tableFooterView = UIView()
    }
    @IBAction func onAddButton(_ sender: UIBarButtonItem) {
        var textField: UITextField? = nil
        let alert = UIAlertController(title: "Neues Spiel", message: "Welches Spiel möchtest du hinzufügen?", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (tf) in
            textField = tf
        })
        
        alert.addAction(UIAlertAction(title: "Hinzufügen", style: .default, handler: { (action) in
            let text = textField!.text?.trimmingCharacters(in: [" "])
            if (text != nil && text != "") {
                self.games.insert(text!, at: 0)
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
            }
        }))
        present(alert, animated: true, completion: nil)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
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
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let selectedGame = games.remove(at: sourceIndexPath.row)
        games.insert(selectedGame, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            games.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

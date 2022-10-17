//
//  ViewController.swift
//  CampeoesDaCopa
//
//  Created by Leticia Speda on 26/09/22.
//

import UIKit

final class HomeTableViewController: UITableViewController {
    
    let identifier = "cell"
    var worldCups: [WorldCup] = [] {didSet{updateList()}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Campeoes"
        loadWorldCups()
        tableView.register(WorldCupTableViewHeader.self, forHeaderFooterViewReuseIdentifier: WorldCupTableViewHeader.identifier)
        tableView.register(WordCupTableViewCell.self, forCellReuseIdentifier: WordCupTableViewCell.identifier)
        
    }
    
    func loadWorldCups() {
        guard let fileURL =  Bundle.main.url(
            forResource: "winners.json", withExtension: nil) else { return }
        
        guard let jsonData = try? Data(contentsOf: fileURL) else { return }
        
        do {
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateList() {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return worldCups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: WordCupTableViewCell.identifier, for: indexPath) as? WordCupTableViewCell {
            
            cell.update(word: worldCups[indexPath.row] )
            return cell
        }
       
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: WorldCupTableViewHeader.identifier) as? WorldCupTableViewHeader

        return view
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let worldCup = worldCups[indexPath.row]
        let controller = WorldCupViewController(worldCup: worldCup)
        present(controller, animated: true)
    }
    
}

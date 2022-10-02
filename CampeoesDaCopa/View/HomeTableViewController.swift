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
        tableView.register(HomeTableViewHeader.self, forHeaderFooterViewReuseIdentifier: HomeTableViewHeader.identifier)
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell {
            
            cell.update(word: worldCups[indexPath.row] )
            return cell
        }
       
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: HomeTableViewHeader.identifier) as? HomeTableViewHeader

        return view
    }
}

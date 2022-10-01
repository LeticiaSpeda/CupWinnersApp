//
//  ViewController.swift
//  CampeoesDaCopa
//
//  Created by Leticia Speda on 26/09/22.
//

import UIKit

final class HomeTableViewController: UITableViewController {
    
    let identifier = "cell"
    var worldCups: [WorldCup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Campeoes"
        loadWorldCups()
        tableView.register(HomeTableViewHeader.self, forHeaderFooterViewReuseIdentifier: HomeTableViewHeader.identifier)
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
    }
    
    private func loadWorldCups() {
        guard let fileURL =  Bundle.main.url(
            forResource: "winners.json", withExtension: nil) else { return }
        
        guard let jsonData = try? Data(contentsOf: fileURL) else { return }
        
        do {
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return worldCups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath)
//        let worldCup = worldCups[indexPath.row]
//        cell.textLabel?.text = "Copa \(worldCup.year) - \(worldCup.country)"
//        cell.detailTextLabel?.text = "\(worldCup.winner) vs \(worldCup.vice)"
//        cell.imageView?.image = UIImage(named: "calendar")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: HomeTableViewHeader.identifier) as? HomeTableViewHeader

        return view
    }
}

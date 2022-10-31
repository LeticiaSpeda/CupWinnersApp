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
        configureStyle()
        loadWorldCups()
        tableView.register(WorldCupTableViewHeader.self, forHeaderFooterViewReuseIdentifier: WorldCupTableViewHeader.identifier)
        tableView.register(WorldCupTableViewCell.self, forCellReuseIdentifier: WorldCupTableViewCell.identifier)
    }
    
    private func configureStyle() {
        view.backgroundColor = .white.withAlphaComponent(0.9)
        navigationItem.title = Constants.Home.title.rawValue
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white.withAlphaComponent(0.5)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: WorldCupTableViewCell.identifier, for: indexPath) as? WorldCupTableViewCell {
            
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
        let navigation = UINavigationController(rootViewController: controller)
        navigation.modalPresentationStyle = .overFullScreen
        present(navigation, animated: true)
    }
}

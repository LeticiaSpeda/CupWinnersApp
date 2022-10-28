//
//  WordCupViewController.swift
//  CampeoesDaCopa
//
//  Created by Leticia Speda on 26/09/22.
//

import UIKit

final class WorldCupViewController: UIViewController {
    
    var worldCup: WorldCup
    
    private lazy var flagImage: UIImageView = {
        let image = UIImage(named: "\(worldCup.winner)")
        let imageview = UIImageView(image: image)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    private lazy var opponentFlagImage: UIImageView = {
        let image = UIImage(named: "\(worldCup.vice)")
        let imageview = UIImageView(image: image)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameCountry: UILabel = {
        let label = UILabel()
        label.text = "\(worldCup.winner)"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameOponnentCountry: UILabel = {
        let label = UILabel()
        label.text = " \(worldCup.vice) "
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var trajectoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Trajetoria do campeão"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray.withAlphaComponent(0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.backgroundColor = .white
        table.register(WorldTableViewCell.self, forCellReuseIdentifier: WorldTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //MARK: Construtor
    init(worldCup: WorldCup) {
        self.worldCup = worldCup
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    //MARK: Helpers
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureHierarchy() {
        view.addSubview(flagImage)
        view.addSubview(opponentFlagImage)
        view.addSubview(resultLabel)
        view.addSubview(nameCountry)
        view.addSubview(nameOponnentCountry)
        view.addSubview(trajectoryLabel)
        view.addSubview(dividerView)
        view.addSubview(tableView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            flagImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            flagImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            flagImage.heightAnchor.constraint(equalToConstant: 58),
            flagImage.widthAnchor.constraint(equalToConstant: 84),
            
            opponentFlagImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            opponentFlagImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            opponentFlagImage.heightAnchor.constraint(equalToConstant: 58),
            opponentFlagImage.widthAnchor.constraint(equalToConstant: 84),
            
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 46),
            resultLabel.leftAnchor.constraint(equalTo: flagImage.rightAnchor, constant: 50),
            resultLabel.rightAnchor.constraint(equalTo: opponentFlagImage.leftAnchor, constant: -50),
            
            nameCountry.topAnchor.constraint(equalTo: flagImage.bottomAnchor, constant: 10),
            nameCountry.centerXAnchor.constraint(equalTo: flagImage.centerXAnchor),
            
            nameOponnentCountry.topAnchor.constraint(equalTo: opponentFlagImage.bottomAnchor, constant: 10),
            nameOponnentCountry.centerXAnchor.constraint(equalTo: opponentFlagImage.centerXAnchor),
            
            trajectoryLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 60),
            trajectoryLabel.centerXAnchor.constraint(equalTo: resultLabel.centerXAnchor),
            
            dividerView.topAnchor.constraint(equalTo: trajectoryLabel.bottomAnchor, constant: 12),
            dividerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            dividerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 2),
            
            tableView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureStyle() {
        view.backgroundColor = .white
        navigationItem.title = "WorldCup \(worldCup.year)"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white.withAlphaComponent(0.2)
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = .blue.withAlphaComponent(0.5)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.leftBarButtonItem = .init(
            title: "Voltar", image: .init(systemName: "chevron.backward"),
            target: self, action: #selector(backButtonAction)
        )
    }
    
    @objc private func backButtonAction() {
        dismiss(animated: true)
    }
}

extension WorldCupViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup.matches[section].games
        
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = UITableViewCell()
        //        let data = worldCup.matches[indexPath.section].games[indexPath.row]
        //        cell.textLabel?.text = "Teste"
        //        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: WorldTableViewCell.identifier, for: indexPath)
        return cell
    }
}

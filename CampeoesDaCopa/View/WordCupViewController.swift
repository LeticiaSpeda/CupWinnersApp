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
        let image = UIImage(named: "Brasil")
        let imageview = UIImageView(image: image)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    private lazy var opponentFlagImage: UIImageView = {
        let image = UIImage(named: "Bolívia")
        let imageview = UIImageView(image: image)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "1 x 0"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameCountry: UILabel = {
        let label = UILabel()
        label.text = "Brasil"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameOponnentCountry: UILabel = {
        let label = UILabel()
        label.text = "Bolivia"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var descriptionWorld: UILabel = {
        let label = UILabel()
        label.text = "Trajetoria do campeão"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.addSubview(descriptionWorld)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            flagImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            flagImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            flagImage.heightAnchor.constraint(equalToConstant: 58),
            flagImage.widthAnchor.constraint(equalToConstant: 84),
            
            
            opponentFlagImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            opponentFlagImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            opponentFlagImage.heightAnchor.constraint(equalToConstant: 58),
            opponentFlagImage.widthAnchor.constraint(equalToConstant: 84),
            
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 46),
            resultLabel.leftAnchor.constraint(equalTo: flagImage.rightAnchor, constant: 60),
            resultLabel.rightAnchor.constraint(equalTo: opponentFlagImage.leftAnchor, constant: -60),
            
            nameCountry.topAnchor.constraint(equalTo: flagImage.bottomAnchor, constant: 10),
            nameCountry.centerXAnchor.constraint(equalTo: flagImage.centerXAnchor),
            
            nameOponnentCountry.topAnchor.constraint(equalTo: opponentFlagImage.bottomAnchor, constant: 10),
            nameOponnentCountry.centerXAnchor.constraint(equalTo: opponentFlagImage.centerXAnchor),
            
            descriptionWorld.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 60),
            descriptionWorld.centerXAnchor.constraint(equalTo: resultLabel.centerXAnchor)
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

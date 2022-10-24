//
//  WordCupViewController.swift
//  CampeoesDaCopa
//
//  Created by Leticia Speda on 26/09/22.
//

import UIKit

final class WorldCupViewController: UIViewController {
    
    var worldCup: WorldCup
    
    init(worldCup: WorldCup) {
        self.worldCup = worldCup
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
//        print("ano da copa selecionado \(worldCup.year)")
        
    }
    private func commonInit() {
        configureStyle()
    }
    private func configureStyle() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "WorldCup \(worldCup.year)"
        navigationItem.leftBarButtonItem = .init(
            title: "Voltar", image: .init(systemName: "chevron.backward"),
            target: self, action: #selector(backButtonAction)
        )
    }
    
    @objc private func backButtonAction() {
        dismiss(animated: true)
    }
    
}

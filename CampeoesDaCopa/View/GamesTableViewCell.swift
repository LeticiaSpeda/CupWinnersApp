//
//  WorldTableViewCell.swift
//  CampeoesDaCopa
//
//  Created by Leticia Speda on 27/10/22.
//

import UIKit

final class GamesTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: GamesTableViewCell.self)
    
    private lazy var flagImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.enableView()
        return view
    }()
    
    private lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(
            ofSize: 16, weight: .light
        )
        label.enableView()
        return label
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(
            ofSize: 16, weight: .bold
        )
        label.enableView()
        return label
    }()
    
    private lazy var countryOpponentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textColor = .gray.withAlphaComponent(1.0)
        label.font = UIFont.systemFont(
            ofSize: 16, weight: .light
        )
        label.enableView()
        return label
    }()
    
    private lazy var flagOpponentImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.enableView()
        return view
    }()
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(with game: Game) {
        flagImage.image = UIImage(named: "\(game.home)")
        flagOpponentImage.image = UIImage(named: "\(game.away)")
        countryLabel.text = game.home
        scoreLabel.text = game.score
        countryOpponentLabel.text = game.away
    }
    
    private func commonInit() {
        configureHierarchy()
        configureContraints()
        configureStyle()
    }
    
    private func configureHierarchy() {
        addSubview(flagImage)
        addSubview(countryLabel)
        addSubview(scoreLabel)
        addSubview(countryOpponentLabel)
        addSubview(flagOpponentImage)
    }
    
    private func configureContraints() {
        NSLayoutConstraint.activate([
            
            flagImage.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 6
            ),
            flagImage.leftAnchor.constraint(
                equalTo: leftAnchor,
                constant: 16
            ),
            flagImage.heightAnchor.constraint(equalToConstant: 32),
            flagImage.widthAnchor.constraint(equalToConstant: 46),
            flagImage.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -10),
            
            countryLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 12
            ),
            countryLabel.leftAnchor.constraint(
                equalTo: flagImage.rightAnchor,
                constant: 10
            ),
            countryLabel.rightAnchor.constraint(
                equalTo: scoreLabel.leftAnchor,
                constant: -5
            ),
            
            scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            countryOpponentLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 12
            ),
            
            countryOpponentLabel.leftAnchor.constraint(
                equalTo: scoreLabel.rightAnchor,
                constant: 16
            ),
            
            countryOpponentLabel.rightAnchor.constraint(
                equalTo: flagOpponentImage.leftAnchor,
                constant: -16
            ),
            countryOpponentLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -10
            ),
            
            flagOpponentImage.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 12
            ),
            flagOpponentImage.rightAnchor.constraint(
                equalTo: rightAnchor,
                constant: -16
            ),
            flagOpponentImage.heightAnchor.constraint(equalToConstant: 32),
            flagOpponentImage.widthAnchor.constraint(equalToConstant: 46),
            flagOpponentImage.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -10
            ),
        ])
    }
    
    private func configureStyle() {
        selectionStyle = .none
        backgroundColor = .white
    }
}

extension UIView {
    func enableView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

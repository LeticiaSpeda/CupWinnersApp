//
//  HomeTableViewCell.swift
//  CampeoesDaCopa
//
//  Created by Leticia Speda on 29/09/22.
//

import UIKit

final class WorldCupTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: WorldCupTableViewCell.self)
    
    //MARK: Components
    private lazy var imageCalendar: UIImageView = {
        let image = UIImage(named: "calendar")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill
        view.enableViewCode()
        return view
    }()
    
    private lazy var yearsLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.enableViewCode()
        return label
    }()
    
    private lazy var imageGlobal: UIImageView = {
        let image  = UIImage(named: "globe")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill
        view.enableViewCode()
        return view
    }()
    
    private lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.text = "Brasil"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.enableViewCode()
        return label
    }()
    
    private lazy var imageflag: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.enableViewCode()
        return view
    }()
    
    private lazy var countryFlagLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.7911188006, green: 0.4011479616, blue: 0.1588954628, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.enableViewCode()
        return label
    }()
    
    private lazy var scoreboardLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.enableViewCode()
        return label
    }()
    
    private lazy var imageOpponentFlag: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.enableViewCode()
        return view
    }()
    
    private lazy var countryOpponentFlagLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).withAlphaComponent(0.5)
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.enableViewCode()
        return label
    }()
    
    private lazy var scoreboardOpponentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.enableViewCode()
        return label
    }()
    //MARK: Construtor
    
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
    
    func update(word: WorldCup) {
        yearsLabel.text = "\(word.year)"
        countryLabel.text = word.country
        countryFlagLabel.text = word.winner
        countryOpponentFlagLabel.text = word.vice
        imageflag.image = UIImage(named: "\(word.winner).png")
        imageOpponentFlag.image = UIImage(named: "\(word.vice).png")
        scoreboardLabel.text = word.winnerScore
        scoreboardOpponentLabel.text = word.viceScore
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstrainsts()
        configureStyle()
    }
    
    private func configureHierarchy() {
        addSubview(imageCalendar)
        addSubview(yearsLabel)
        addSubview(imageGlobal)
        addSubview(countryLabel)
        addSubview(imageflag)
        addSubview(countryFlagLabel)
        addSubview(scoreboardLabel)
        addSubview(imageOpponentFlag)
        addSubview(countryOpponentFlagLabel)
        addSubview(scoreboardOpponentLabel)
    }
    
    private func configureConstrainsts() {
        NSLayoutConstraint.activate([
            imageCalendar.topAnchor.constraint(
                equalTo: topAnchor, constant: 20
            ),
            imageCalendar.leadingAnchor.constraint(
                equalTo: leadingAnchor,constant:  30
            ),
            imageCalendar.heightAnchor.constraint(
                equalToConstant: 22
            ),
            imageCalendar.widthAnchor.constraint(
                equalToConstant: 22
            ),
            
            yearsLabel.topAnchor.constraint(
                equalTo: topAnchor, constant: 20
            ),
            
            yearsLabel.leadingAnchor.constraint(
                equalTo: imageCalendar.trailingAnchor, constant: 10
            ),
            imageGlobal.topAnchor.constraint(
                equalTo: topAnchor, constant: 20
            ),
            imageGlobal.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -20
            ),
            imageGlobal.heightAnchor.constraint(
                equalToConstant: 22
            ),
            imageGlobal.widthAnchor.constraint(
                equalToConstant: 22
            ),
            countryLabel.topAnchor.constraint(
                equalTo: topAnchor, constant: 20
            ),
            countryLabel.trailingAnchor.constraint(
                equalTo: imageGlobal.leadingAnchor, constant: -10
            ),
            imageflag.topAnchor.constraint(
                equalTo: imageCalendar.bottomAnchor, constant: 10
            ),
            imageflag.leadingAnchor.constraint(
                equalTo: imageCalendar.leadingAnchor
            ),
            imageflag.heightAnchor.constraint(
                equalToConstant: 22
            ),
            imageflag.widthAnchor.constraint(
                equalToConstant: 30
            ),
            
            countryFlagLabel.topAnchor.constraint(
                equalTo: yearsLabel.bottomAnchor,constant: 10
            ),
            
            countryFlagLabel.leadingAnchor.constraint(
                equalTo: imageflag.leadingAnchor, constant: 40
            ),
            
            scoreboardLabel.topAnchor.constraint(
                equalTo: countryLabel.bottomAnchor, constant:  10
            ),
            scoreboardLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -30
            ),
            
            imageOpponentFlag.topAnchor.constraint(
                equalTo: imageflag.bottomAnchor, constant: 10
            ),
            imageOpponentFlag.leadingAnchor.constraint(
                equalTo: imageflag.leadingAnchor
            ),
            imageOpponentFlag.heightAnchor.constraint(
                equalToConstant: 22
            ),
            imageOpponentFlag.widthAnchor.constraint(
                equalToConstant: 30),
            
            countryOpponentFlagLabel.topAnchor.constraint(
                equalTo: countryFlagLabel.bottomAnchor, constant: 12
            ),
            countryOpponentFlagLabel.leadingAnchor.constraint(
                equalTo: imageOpponentFlag.trailingAnchor, constant: 10
            ),
            
            scoreboardOpponentLabel.topAnchor.constraint(
                equalTo: scoreboardLabel.bottomAnchor, constant: 20
            ),
            scoreboardOpponentLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -30
            ),
            
            bottomAnchor.constraint(
                equalTo: imageOpponentFlag.bottomAnchor, constant: 10
            )
        ])
    }
    
    private func configureStyle() {
        selectionStyle = .none
        backgroundColor = .white
    }
}

extension UIView {
    func enableViewCode() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}



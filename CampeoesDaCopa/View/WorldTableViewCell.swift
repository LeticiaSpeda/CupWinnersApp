//
//  WorldTableViewCell.swift
//  CampeoesDaCopa
//
//  Created by Leticia Speda on 27/10/22.
//

import UIKit

final class WorldTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: WorldTableViewCell.self)
    
    private lazy var flagImage: UIImageView = {
        let image = UIImage(named: "Brasil")
        let view = UIImageView(image: image)
        view.enableView()
        return view
    }()
    
    private lazy var labeel: UILabel = {
        let label = UILabel()
        label.text = "teste"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.enableView()
        return label
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
    
    private func commonInit() {
        configureHierarchy()
        configureContraints()
        configureStyle()
    }
    
    private func configureHierarchy() {
        addSubview(flagImage)
        addSubview(labeel)
    }
    
    private func configureContraints() {
        NSLayoutConstraint.activate([
            
            flagImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            flagImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            flagImage.heightAnchor.constraint(equalToConstant: 40),
            flagImage.widthAnchor.constraint(equalToConstant: 60),
            flagImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            labeel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            labeel.leftAnchor.constraint(equalTo: flagImage.rightAnchor, constant: 20)
        
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

//
//  HomeTableViewHeader.swift
//  CampeoesDaCopa
//
//  Created by Leticia Speda on 28/09/22.
//

import UIKit

final class WorldCupTableViewHeader: UITableViewHeaderFooterView {
    
    static let identifier = String(describing: WorldCupTableViewHeader.self)
    
    private lazy var imageHeader: UIImageView = {
        let image = UIImage(named: Constants.worldHeaderImage.imageHeader.rawValue)
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
    }
    
    private func configureHierarchy() {
        addSubview(imageHeader)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            imageHeader.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageHeader.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageHeader.heightAnchor.constraint(equalToConstant: 140),
            imageHeader.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor
            ),
            bottomAnchor.constraint(equalTo: imageHeader.bottomAnchor)
        ])
    }
}

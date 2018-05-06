//
//  DetailsTableViewCell.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    let cardView = UIView()
    let iconView = UIImageView()
    let stackView = UIStackView()
    let titleLabel = UILabel(style: .title2)
    let descriptionLabel = UILabel(style: .body)
    let learnMoreLabel = UILabel(style: .callout)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cardView.backgroundColor = .hltnOrange
        contentView.addSubview(cardView)
        
        iconView.contentMode = .center
        cardView.addSubview(iconView)
        
        stackView.axis = .vertical
        stackView.spacing = .small
        cardView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        
        descriptionLabel.numberOfLines = 0
        stackView.addArrangedSubview(descriptionLabel)
        
        learnMoreLabel.text = "Learn More"
        stackView.addArrangedSubview(learnMoreLabel)
        
        cardView.enableAutoLayout()
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .medium).activate()
        cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.medium).activate()
        cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.medium).activate()
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0).activate()
        
        iconView.enableAutoLayout()
        iconView.widthAnchor.constraint(equalToConstant: 50.0).activate()
        iconView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50.0).activate()
        iconView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: .small).activate()
        iconView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -.small).activate()
        iconView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: .small).activate()
        
        stackView.enableAutoLayout()
        stackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: .small).activate()
        stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -.small).activate()
        stackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -.small).activate()
        stackView.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: .small).activate()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

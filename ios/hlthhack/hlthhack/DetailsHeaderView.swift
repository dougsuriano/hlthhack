//
//  DetailsHeaderView.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

class DetailsHeaderView: UIView
{
    let backgroundView = UIView()
    let imageView = UIImageView()
    let titleLabel = UILabel(style: .largeTitle)
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        backgroundView.backgroundColor = .hltnYellow
        addSubview(backgroundView)
        
        imageView.contentMode = .center
        backgroundView.addSubview(imageView)
        
        titleLabel.textColor = .hltnDarkBlue
        backgroundView.addSubview(titleLabel)
        
        backgroundView.enableAutoLayout()
        backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: .medium).activate()
        backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.medium).activate()
        backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.medium).activate()
        backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .medium).activate()
        
        
        imageView.enableAutoLayout()
        imageView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: .medium).activate()
        imageView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -.medium).activate()
        imageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: .medium).activate()
        imageView.widthAnchor.constraint(equalToConstant: 75.0).activate()
        
        titleLabel.enableAutoLayout()
        titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: .medium).activate()
        titleLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -.medium).activate()
        titleLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -.medium).activate()
        titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: .medium).activate()
        
        backgroundView.layer.shadowColor = UIColor.hltnDarkBlue.cgColor
        backgroundView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        backgroundView.layer.shadowOpacity = 0.3 * 1.0
        backgroundView.layer.shadowRadius = 2
        backgroundView.layer.cornerRadius = 5.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

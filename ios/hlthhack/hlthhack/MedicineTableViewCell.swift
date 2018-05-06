//
//  MedicineTableViewCell.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import Foundation
import UIKit


class MedicineTableViewCell: UITableViewCell
{
    let capsuleView = UIView()
    let title = UILabel(style: .title1)
    let icon = UIImageView()
    let spacerView = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        capsuleView.backgroundColor = .hltnYellow
        capsuleView.layer.cornerRadius = 10.0
        contentView.addSubview(capsuleView)
        
        title.numberOfLines = 0
        title.text = "Metformin"
        capsuleView.addSubview(title)
        
        addSubview(spacerView)
        
        icon.contentMode = .center
        icon.clipsToBounds = true
        icon.image = #imageLiteral(resourceName: "roundedpills")
        capsuleView.addSubview(icon)
        
        capsuleView.enableAutoLayout()
        capsuleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .medium).activate()
        capsuleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.small).activate()
        capsuleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.medium).activate()
        capsuleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .small).activate()
        
        icon.enableAutoLayout()
        icon.widthAnchor.constraint(equalToConstant: 50.0).activate()
        icon.heightAnchor.constraint(greaterThanOrEqualToConstant: 50.0).activate()
        icon.topAnchor.constraint(equalTo: capsuleView.topAnchor, constant: .small).activate()
        icon.trailingAnchor.constraint(equalTo: spacerView.leadingAnchor, constant: 0.0).activate()
        icon.bottomAnchor.constraint(equalTo: capsuleView.bottomAnchor, constant: -.small).activate()
        icon.leadingAnchor.constraint(equalTo: capsuleView.leadingAnchor, constant: .small).activate()
        
        spacerView.enableAutoLayout()
        spacerView.widthAnchor.constraint(equalToConstant: .medium).activate()
        spacerView.topAnchor.constraint(equalTo: capsuleView.topAnchor).activate()
        spacerView.bottomAnchor.constraint(equalTo: capsuleView.bottomAnchor).activate()
        
        
        title.enableAutoLayout()
        title.topAnchor.constraint(equalTo: capsuleView.topAnchor, constant: .small).activate()
        title.trailingAnchor.constraint(equalTo: capsuleView.trailingAnchor, constant: -.small).activate()
        title.bottomAnchor.constraint(equalTo: capsuleView.bottomAnchor, constant: -.small).activate()
        title.leadingAnchor.constraint(equalTo: spacerView.trailingAnchor).activate()
        
        capsuleView.layer.shadowColor = UIColor.hltnDarkBlue.cgColor
        capsuleView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        capsuleView.layer.shadowOpacity = 0.3 * 1.0
        capsuleView.layer.shadowRadius = 2
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

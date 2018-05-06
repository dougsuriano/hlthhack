//
//  UIView+Autolayout.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    func enableAutoLayout()
    {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func fixToEdges(of view: UIView)
    {
        enableAutoLayout()
        topAnchor.constraint(equalTo: view.topAnchor).activate()
        trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        bottomAnchor.constraint(equalTo: view.bottomAnchor).activate()
        leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
    }

}


extension NSLayoutConstraint
{
    @discardableResult
    func activate() -> NSLayoutConstraint
    {
        isActive = true
        return self
    }
}

typealias Inset = CGFloat

extension Inset
{
    static var small: Inset
    {
        return 8.0
    }
    
    static var medium: Inset
    {
        return 12.0
    }
}

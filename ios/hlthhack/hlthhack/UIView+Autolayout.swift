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
}

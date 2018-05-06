//
//  UIButton+Util.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import Foundation
import UIKit

extension UIButton
{
    class func hltnButton() -> UIButton
    {
        let button = UIButton(type: .custom)
        button.backgroundColor = .hltnDarkBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 32.0)
        return button
    }
}

//
//  UILabel+Util.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import Foundation
import UIKit

extension UILabel
{
    convenience init(style: UIFontTextStyle)
    {
        self.init(frame: .zero)
        
        if style != .largeTitle
        {
            self.font = UIFont.preferredFont(forTextStyle: style)
        }
        else
        {
            self.font = UIFont.boldSystemFont(ofSize: 32.0)
        }
    }
}

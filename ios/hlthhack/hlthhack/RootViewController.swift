//
//  RootViewController.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

@objc class RootViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "wiestyfbaby!"
        view.addSubview(label)
        label.frame = CGRect(x: 100, y: 100, width: 300, height: 200)
    }

}

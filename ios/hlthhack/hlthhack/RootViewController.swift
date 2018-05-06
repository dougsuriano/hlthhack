//
//  RootViewController.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

@objc class RootViewController: UITabBarController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let medicationsVC = MyMedicationViewController()
        let medicationsNavController = UINavigationController(rootViewController: medicationsVC)
        
        let historyVC = MedicationHistoryViewController()
        let historyNavController = UINavigationController(rootViewController: historyVC)
        
        setViewControllers([medicationsNavController, historyNavController], animated: true)
    }

}

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
        let myMedicationTabBarItem = UITabBarItem(title: "My Medication", image: #imageLiteral(resourceName: "bottle"), selectedImage: #imageLiteral(resourceName: "bottle"))
        medicationsNavController.tabBarItem = myMedicationTabBarItem
        
        let historyVC = MedicationHistoryViewController()
        let historyNavController = UINavigationController(rootViewController: historyVC)
        let historyTabBarItem = UITabBarItem(title: "History", image: #imageLiteral(resourceName: "clock"), tag: 0)
        historyNavController.tabBarItem = historyTabBarItem
        
        let meViewController = MeViewController()
        let meNavigationController = UINavigationController(rootViewController: meViewController)
        
        let meTabBarItem = UITabBarItem(title: "Me", image: #imageLiteral(resourceName: "me"), tag: 2)
        meNavigationController.tabBarItem = meTabBarItem
        
        setViewControllers([medicationsNavController, historyNavController, meNavigationController], animated: true)
    }

}

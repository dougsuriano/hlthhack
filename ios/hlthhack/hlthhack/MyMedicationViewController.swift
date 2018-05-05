//
//  MyMedicationViewController.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

class MyMedicationViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.title = "My Medications"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonTapped(_:)))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func addButtonTapped(_ sender: AnyObject)
    {
        let addController = AddMedicationViewController()
        let navController = UINavigationController(rootViewController: addController)
        present(navController, animated: true, completion: nil)
    }

}

//
//  AddMedicationViewController.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

class AddMedicationViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Add Mediciation"

        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelButtonTapped(_:)))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func cancelButtonTapped(_ sender: AnyObject)
    {
        dismiss(animated: true, completion: nil)
    }

}

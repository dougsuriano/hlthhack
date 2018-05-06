//
//  HowOftenViewController.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/6/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

class HowOftenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let titleLabel = UILabel(style: .largeTitle)
    let tableView = UITableView()
    
    let frequency = ["Once Daily", "Twice Daily", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "How Often?"
        view.addSubview(titleLabel)
        
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        titleLabel.enableAutoLayout()
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .medium).activate()
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.medium).activate()
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .medium).activate()
        
        tableView.enableAutoLayout()
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .medium).activate()
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.medium).activate()
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).activate()
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .medium).activate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frequency.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = frequency[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let howOften = frequency[indexPath.row]
        let med = Medicine(name: "Metformin", howOften: howOften)
        let addController = navigationController?.viewControllers.first as! AddMedicationViewController
        addController.delegate?.medicationController(addController, didAddMedicine: med)
    }


}

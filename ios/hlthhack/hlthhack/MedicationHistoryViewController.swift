//
//  MedicationHistoryViewController.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

class MedicationHistoryViewController: UIViewController, UITableViewDataSource
{
    let tableView = UITableView()
    
    let drugs = ["Synthroid", "Crestor", "Ventolin"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        title = "History"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(MedicineTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        view.addSubview(tableView)
        
        tableView.enableAutoLayout()
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).activate()
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).activate()
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drugs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MedicineTableViewCell else
        {
            return UITableViewCell()
        }
        
        let med = drugs[indexPath.row]
        
        cell.title.text = med
        cell.capsuleView.backgroundColor = .gray
        NSLayoutConstraint.deactivate(cell.feedbackVisibleConstraints)
        NSLayoutConstraint.activate(cell.feedbackHiddenConstraints)
        
        
        return cell
    }

}

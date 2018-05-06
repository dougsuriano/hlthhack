//
//  MyMedicationViewController.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

class MyMedicationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MedicineTableViewCellDelegate
{
    let tableView = UITableView(frame: .zero, style: .grouped)
    let reuseIdentifier = "medicineCell"
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        view.backgroundColor = .hltnLightBlue

        self.title = "My Medications"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonTapped(_:)))
        navigationItem.rightBarButtonItem = addButton
        
        setupTableView()
        tableView.reloadData()
    }
    
    private func setupTableView()
    {
        tableView.register(MedicineTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        tableView.enableAutoLayout()
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).activate()
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).activate()
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
    }

    @objc func addButtonTapped(_ sender: AnyObject)
    {
        let addController = AddMedicationViewController()
        let navController = UINavigationController(rootViewController: addController)
        present(navController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? MedicineTableViewCell else
        {
            return UITableViewCell()
        }
        
        cell.delegate = self
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let medicine = Medicine(name: "Metformin")
        let detailsVC = MedicineDetailsViewController(medicine: medicine)
        detailsVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailsVC, animated: true)
        
    }
    
    func goodButtonTapped(_ cell: MedicineTableViewCell)
    {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func badButtonTapped(_ cell: MedicineTableViewCell)
    {
        tableView.beginUpdates()
        tableView.endUpdates()
    }

}

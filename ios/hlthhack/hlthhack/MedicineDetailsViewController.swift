//
//  MedicineDetailsViewController.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

class MedicineDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    let medicine: Medicine
    
    let tableView = UITableView()
    
    required init(medicine: Medicine)
    {
        self.medicine = medicine
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = false
        title = medicine.name
        
        tableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
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
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailsTableViewCell else
        {
            return UITableViewCell()
        }
       
        cell.iconView.image = #imageLiteral(resourceName: "badge_warn")
        cell.titleLabel.text = "Heads up!"
        cell.descriptionLabel.text = "This drug really fucking sucks. It's no good. Not fun. Do not use"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let view = DetailsHeaderView()
        view.titleLabel.text = "Scheduling"
        view.imageView.image = #imageLiteral(resourceName: "schedule_badge")
        return view
        
    }
    
}

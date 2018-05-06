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
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
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
        if section == 0 || section == 1 || section == 2
        {
            return 1
        }
        else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailsTableViewCell else
        {
            return UITableViewCell()
        }
       
        if indexPath.section == 0
        {
            cell.iconView.image = #imageLiteral(resourceName: "green_check_badge")
            cell.titleLabel.text = "You're up to date"
            cell.descriptionLabel.text = medicine.howOften
            cell.cardView.backgroundColor = UIColor.hltnGreen
        }
        else if indexPath.section == 1
        {
            if medicine.conflict
            {
                cell.iconView.image = #imageLiteral(resourceName: "badge_warn")
                cell.titleLabel.text = "Look Alive!"
                cell.descriptionLabel.text = "BRCA1 may give you some trouble..."
                cell.cardView.backgroundColor = UIColor.hltnOrange
            }
            else
            {
                cell.iconView.image = #imageLiteral(resourceName: "green_check_badge")
                cell.titleLabel.text = "Great Stuff"
                cell.descriptionLabel.text = "Your genes are happy campers!"
                cell.cardView.backgroundColor = UIColor.hltnGreen
            }
        }
        else if indexPath.section == 2
        {
            if medicine.interactions
            {
                cell.iconView.image = #imageLiteral(resourceName: "badge_warn")
                cell.titleLabel.text = "Heads up!"
                cell.descriptionLabel.text = "Metformin may give you some problems with Levonorgestrel."
                cell.cardView.backgroundColor = UIColor.hltnOrange
            }
            else
            {
                cell.iconView.image = #imageLiteral(resourceName: "green_check_badge")
                cell.titleLabel.text = "All good!"
                cell.descriptionLabel.text = String(format: "Your genes love %@", medicine.name)
                cell.cardView.backgroundColor = UIColor.hltnGreen
            }
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        if section == 0
        {
            let view = DetailsHeaderView()
            view.titleLabel.text = "Scheduling"
            view.imageView.image = #imageLiteral(resourceName: "schedule_badge")
            return view
        }
        else if section == 1
        {
            let view = DetailsHeaderView()
            view.titleLabel.text = "My Genes"
            view.imageView.image = #imageLiteral(resourceName: "badge_dna")
            return view
        }
        else if section == 2
        {
            let view = DetailsHeaderView()
            view.titleLabel.text = "Interactions"
            view.imageView.image = #imageLiteral(resourceName: "interactions_badge")
            return view
        }
        
        return nil
    }
    
}

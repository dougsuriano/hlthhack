//
//  MeViewController.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

struct MeSection
{
    let sectionTitle: String
    let items: [MeSectionItem]
}

struct MeSectionItem
{
    let key: String
    let value: String
    let accessoryView: UITableViewCellAccessoryType
}

class MeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    let sections: [MeSection] = [
        MeSection(sectionTitle: "Personal Info", items: [
                MeSectionItem(key: "First", value: "Michael", accessoryView: .none),
                MeSectionItem(key: "Last", value: "Wiest", accessoryView: .none),
                MeSectionItem(key: "DOB", value: "4/20/2004", accessoryView: .none),
                MeSectionItem(key: "Update my personal info", value: "", accessoryView: .disclosureIndicator)
            ]),
        MeSection(sectionTitle: "Share and Export", items: [
            MeSectionItem(key: "Send Medication History to your Doctor", value: "", accessoryView: .disclosureIndicator)
            ]),
        MeSection(sectionTitle: "About", items: [
            MeSectionItem(key: "About", value: "", accessoryView: .disclosureIndicator),
            MeSectionItem(key: "Terms of Use", value: "", accessoryView: .disclosureIndicator),
            MeSectionItem(key: "Privacy Policy", value: "", accessoryView: .disclosureIndicator)
            ])
    ]
    
    let reuseIdentifier = "dudes"
    let tableView = UITableView(frame: .zero, style: .grouped)

    override func viewDidLoad()
    {
        super.viewDidLoad()

        title = "Me"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MeTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        tableView.enableAutoLayout()
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).activate()
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).activate()
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? MeTableViewCell else
        {
            return UITableViewCell()
        }
        
        let item = sections[indexPath.section].items[indexPath.row]
        
        cell.textLabel?.text = item.key
        cell.detailTextLabel?.text = item.value
        cell.accessoryType = item.accessoryView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return sections[section].sectionTitle
    }
}


class MeTableViewCell: UITableViewCell
{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

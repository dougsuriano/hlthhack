//
//  AddMedicationViewController.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

class AddMedicationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    let searchBar = UITextField()
    let emptyView = SearchAboveToGetStartedView()
    let resultsTableView = UITableView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Add Mediciation"

        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelButtonTapped(_:)))
        navigationItem.leftBarButtonItem = cancelButton
        
        setupViews()
        setupContraints()
        
        searchBar.becomeFirstResponder()
    }
    
    private func setupViews()
    {
        searchBar.layer.borderWidth = 2.0
        searchBar.layer.borderColor = UIColor.black.cgColor
        searchBar.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        view.addSubview(searchBar)
        
        view.addSubview(emptyView)
        
        resultsTableView.dataSource = self
        resultsTableView.delegate = self
        resultsTableView.isHidden = true
        view.addSubview(resultsTableView)
        
    }
    
    private func setupContraints()
    {
        searchBar.enableAutoLayout()
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .small).activate()
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.small).activate()
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .small).activate()
        searchBar.heightAnchor.constraint(greaterThanOrEqualToConstant: 40.0).activate()
        
        emptyView.enableAutoLayout()
        emptyView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: .small).activate()
        emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.small).activate()
        emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .small).activate()
        
        resultsTableView.enableAutoLayout()
        resultsTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: .small).activate()
        resultsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        resultsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).activate()
        resultsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
    }
    
    @objc func cancelButtonTapped(_ sender: AnyObject)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func textFieldDidChange(_ sender: AnyObject)
    {
        if searchBar.text?.count == 0
        {
            emptyView.isHidden = false
            resultsTableView.isHidden = true
        }
        else
        {
            emptyView.isHidden = true
            resultsTableView.isHidden = false
        }
    }

    // MARK: Table View Autocomplete
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        cell.textLabel?.text = "YOLO"
        return cell
    }
}


class SearchAboveToGetStartedView: UIView
{
    let icon = UIImageView()
    let label = UILabel(style: .body)
    let scanButton = UIButton.hltnButton()
    
    let stackView = UIStackView()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        stackView.axis = .vertical
        stackView.spacing = .small
        addSubview(stackView)
        
        icon.enableAutoLayout()
        icon.contentMode = .center
        stackView.addArrangedSubview(icon)
        
        label.text = "Use the field above to search for the name of the medication. Of if you perfer, tap the button below to scan your label."
        label.numberOfLines = 0
        label.textAlignment = .center
        stackView.addArrangedSubview(label)
        
        scanButton.setTitle("Scan Label", for: .normal)
        scanButton.enableAutoLayout()
        scanButton.heightAnchor.constraint(equalToConstant: 60.0).activate()
        stackView.addArrangedSubview(scanButton)
        
        stackView.enableAutoLayout()
        stackView.topAnchor.constraint(equalTo: topAnchor).activate()
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).activate()
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).activate()
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).activate()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

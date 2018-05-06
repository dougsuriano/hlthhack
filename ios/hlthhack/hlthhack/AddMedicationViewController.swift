//
//  AddMedicationViewController.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

protocol AddMedicationViewControllerDelegate: class
{
    func medicationController(_ controller: AddMedicationViewController, didAddMedicine: Medicine)
}

class AddMedicationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    weak var delegate: AddMedicationViewControllerDelegate?
    let titleLabel = UILabel(style: .largeTitle)
    let searchBar = UITextField()
    let emptyView = SearchAboveToGetStartedView()
    let resultsTableView = UITableView()
    
    let activityIndicator = UIActivityIndicatorView()
    
    var autocompletes = [String]()
    
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
        
        titleLabel.text = "What's new, boss?"
        view.addSubview(titleLabel)
        
        searchBar.layer.borderWidth = 2.0
        searchBar.placeholder = "   Start typing name of prescription"
        searchBar.layer.borderColor = UIColor.black.cgColor
        searchBar.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        view.addSubview(searchBar)
        
        view.addSubview(activityIndicator)

        
        resultsTableView.dataSource = self
        resultsTableView.delegate = self
        resultsTableView.isHidden = true
        view.addSubview(resultsTableView)
        
    }
    
    private func setupContraints()
    {
        titleLabel.enableAutoLayout()
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .small).activate()
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.small).activate()
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .small).activate()
        
        activityIndicator.enableAutoLayout()
        activityIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.small).activate()
        activityIndicator.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).activate()
        
        searchBar.enableAutoLayout()
        searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .small).activate()
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.small).activate()
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .small).activate()
        searchBar.heightAnchor.constraint(greaterThanOrEqualToConstant: 40.0).activate()
        
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
            activityIndicator.startAnimating()
            emptyView.isHidden = true
            resultsTableView.isHidden = false
            
            if let text = searchBar.text?.lowercased(), text.starts(with: "me")
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    self.activityIndicator.stopAnimating()
                    self.autocompletes = ["Metformin", "Metaxall", "Meted", "Methadone", "Methaver", "Methazel", "Methedex"]
                    self.resultsTableView.reloadData()
                }
                
            }
        }
    }

    // MARK: Table View Autocomplete
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return autocompletes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        cell.textLabel?.text = autocompletes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let howOftenVC = HowOftenViewController()
        navigationController?.pushViewController(howOftenVC, animated: true)
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

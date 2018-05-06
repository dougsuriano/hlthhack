//
//  ProcessingViewController.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

class ProcessingViewController: UIViewController
{
    let activityIndicator = UIActivityIndicatorView()
    let waitingLabel = UILabel(style: .headline)
    
    var timer: Timer?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        title = "Processing"
        navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        
        activityIndicator.activityIndicatorViewStyle = .gray
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        waitingLabel.numberOfLines = 0
        waitingLabel.textAlignment = .center
        waitingLabel.text = "Hand tight friend! We're running around in the back getting your report togeteher. Just a sec..."
        view.addSubview(waitingLabel)
        
        activityIndicator.enableAutoLayout()

        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate()
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).activate()
        
        waitingLabel.enableAutoLayout()
        waitingLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: .medium).activate()
        waitingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.medium).activate()
        waitingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .medium).activate()
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(processingDone), userInfo: nil, repeats: false)
    }
    
    @objc func processingDone()
    {
        let exportVC = ExportViewController()
        navigationController?.pushViewController(exportVC, animated: true)
    }

}

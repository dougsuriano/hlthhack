//
//  ExportViewController.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

class ExportViewController: UIViewController
{
    var hasRemovedProcessingController = false
    
    let webview = UIWebView()
    let exportButton = UIButton.hltnButton()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false

        view.backgroundColor = .white
        title = "Export"
        
        view.addSubview(webview)
        
        let path = Bundle.main.path(forResource: "history2", ofType: "pdf")
        let targetURL = URL(fileURLWithPath: path!)
        let request = URLRequest(url: targetURL)
        webview.loadRequest(request)

        exportButton.setTitle("Export Report", for: .normal)
        view.addSubview(exportButton)
        
        exportButton.addTarget(self, action: #selector(showShareSheet(_:)), for: .touchUpInside)
        
        webview.enableAutoLayout()
        webview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).activate()
        webview.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        webview.bottomAnchor.constraint(equalTo: exportButton.topAnchor, constant: -.medium).activate()
        webview.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
        
        exportButton.enableAutoLayout()
        exportButton.heightAnchor.constraint(equalToConstant: 60.0).activate()
        exportButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.medium).activate()
        exportButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -.medium).activate()
        exportButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .medium).activate()
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(true)
        
        if !hasRemovedProcessingController
        {
            
            if let index = navigationController?.viewControllers.index(where: { (vc) -> Bool in
                return vc.isKind(of: ProcessingViewController.self)
            })
            {
                var controllers = navigationController?.viewControllers
                controllers?.remove(at: index)
                navigationController?.setViewControllers(controllers!, animated: false)
                hasRemovedProcessingController = true
            }
            
        }
    }
    
    @objc func showShareSheet(_ sender: AnyObject)
    {
//        NSArray *activityItems = [NSArray arrayWithObjects:shareString, shareImage, shareUrl, nil];
//        UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
//        activityViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//
//        [self presentViewController:activityViewController animated:YES completion:nil];
        
        let items = ["url"]
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityViewController.modalTransitionStyle = .coverVertical
        
        present(activityViewController, animated: true, completion: nil)
    }



}

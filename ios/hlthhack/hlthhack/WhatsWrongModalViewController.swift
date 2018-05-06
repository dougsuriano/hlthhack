//
//  WhatsWrongModalViewController.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import UIKit

protocol WhatsWrongModalViewControllerDelegate: class
{
    func whatsWrongShouldDismiss(_ sender: WhatsWrongModalViewController)
}

class WhatsWrongModalViewController: UIViewController, TwoOptionsViewDelegate, TextOnlyViewDelegate, SymptonViewDelegate
{
    let backgroundView = UIControl()
    let topSpacerView = UIView()
    let bottomSpacerView = UIView()
    let containerView = UIView()
    
    let firstStepView = TwoOptionsView()
    let hmmItTakesAWhileView = TextOnlyView()
    let yikesView = TwoOptionsView()
    let symptomView = SymptonView()
    
    weak var delegate: WhatsWrongModalViewControllerDelegate?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0.7
        view.addSubview(backgroundView)
        
        containerView.backgroundColor = .hltnYellow
        view.addSubview(containerView)
        
        view.addSubview(topSpacerView)
        view.addSubview(bottomSpacerView)
        
//        okButton.setTitle("Okay", for: .normal)
//        containerView.addSubview(okButton)
        
        backgroundView.enableAutoLayout()
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).activate()
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).activate()
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
        
        topSpacerView.enableAutoLayout()
        topSpacerView.topAnchor.constraint(equalTo: view.topAnchor).activate()
        topSpacerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        topSpacerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
        topSpacerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150.0).activate()
        
        containerView.enableAutoLayout()
        containerView.topAnchor.constraint(equalTo: topSpacerView.bottomAnchor).activate()
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).activate()
        containerView.bottomAnchor.constraint(equalTo: bottomSpacerView.topAnchor).activate()
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0).activate()
        
        bottomSpacerView.enableAutoLayout()
        bottomSpacerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        bottomSpacerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).activate()
        bottomSpacerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
        bottomSpacerView.heightAnchor.constraint(equalTo: topSpacerView.heightAnchor).activate()
        
        firstStepView.delegate = self
        firstStepView.title.text = "What's wrong, friend?"
        firstStepView.option1Button.image.image = #imageLiteral(resourceName: "not_working_image")
        firstStepView.option1Button.label.text = "Is It Working?"
        firstStepView.option2Button.image.image = #imageLiteral(resourceName: "i_feel_worse_image")
        firstStepView.option2Button.label.text = "I feel worse..."
        containerView.addSubview(firstStepView)
        
        firstStepView.fixToEdges(of: containerView)
        
    }
    
    func optionSelected(option: Int, view: TwoOptionsView)
    {
        if view == firstStepView
        {
            view.layoutIfNeeded()
            firstStepView.removeFromSuperview()
            if option == 0
            {
                
                hmmItTakesAWhileView.label.text = "Hmmm...this drug can take one week to work."
                containerView.addSubview(hmmItTakesAWhileView)
                hmmItTakesAWhileView.fixToEdges(of: containerView)
                hmmItTakesAWhileView.delegate = self
                UIView.animate(withDuration: 0.2) {
                    self.view.layoutIfNeeded()
                }
            }
            else
            {
                yikesView.delegate = self
                yikesView.title.text = "Uh oh, tell me more"
                yikesView.option1Button.image.image = #imageLiteral(resourceName: "same_symptoms")
                yikesView.option1Button.label.text = "Same symptoms"
                yikesView.option2Button.image.image = #imageLiteral(resourceName: "side_effects")
                yikesView.option2Button.label.text = "Side effects"
                
                containerView.addSubview(yikesView)
                yikesView.fixToEdges(of: containerView)
                UIView.animate(withDuration: 0.2) {
                    self.view.layoutIfNeeded()
                }
                
            }
        }
        else if view == yikesView
        {
            view.layoutIfNeeded()
            yikesView.removeFromSuperview()
            
            containerView.addSubview(symptomView)
            symptomView.fixToEdges(of: containerView)
            symptomView.delegate = self
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func buttonTapped(_ sender: TextOnlyView)
    {
        if sender == hmmItTakesAWhileView
        {
            delegate?.whatsWrongShouldDismiss(self)
        }
    }
    
    func symptonViewSubmit(_ sender: SymptonView) {
        delegate?.whatsWrongShouldDismiss(self)
    }

}

protocol TwoOptionsViewDelegate: class
{
    func optionSelected(option: Int, view: TwoOptionsView)
}

class TwoOptionsView: UIView
{
    let title = UILabel(style: .largeTitle)
    let option1Button = OptionButton()
    let option2Button = OptionButton()
    
    let stackView = UIStackView()
    
    weak var delegate: TwoOptionsViewDelegate?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        title.textAlignment = .center
        addSubview(title)
        
        stackView.spacing = .small
        stackView.distribution = .fillEqually
        addSubview(stackView)
        
        stackView.addArrangedSubview(option1Button)
        option1Button.addTarget(self, action: #selector(option0Tapped), for: .touchUpInside)
        
        stackView.addArrangedSubview(option2Button)
        option2Button.addTarget(self, action: #selector(option1Tapped), for: .touchUpInside)

        title.enableAutoLayout()
        title.topAnchor.constraint(equalTo: topAnchor, constant: .small).activate()
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.small).activate()
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .small).activate()
        
        stackView.enableAutoLayout()
        stackView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: .small).activate()
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.small).activate()
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.small).activate()
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .small).activate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func option0Tapped()
    {
        delegate?.optionSelected(option: 0, view: self)
    }
    
    @objc func option1Tapped()
    {
        delegate?.optionSelected(option: 1, view: self)
    }
}


class OptionButton: UIControl
{
    let stackView = UIStackView()
    let image = UIImageView()
    let label = UILabel(style: .headline)
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        stackView.axis = .vertical
        stackView.spacing = .small
        stackView.isUserInteractionEnabled = false
        addSubview(stackView)
        
        image.contentMode = .center
        image.enableAutoLayout()
        image.heightAnchor.constraint(equalToConstant: 150.0).activate()
        stackView.addArrangedSubview(image)
        
        label.textAlignment = .center
        stackView.addArrangedSubview(label)
        
        stackView.fixToEdges(of: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol TextOnlyViewDelegate: class
{
    func buttonTapped(_ sender: TextOnlyView)
}

class TextOnlyView: UIView
{
    let label = UILabel(style: .largeTitle)
    let okayButton = UIButton.hltnButton()
    
    weak var delegate: TextOnlyViewDelegate?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        label.numberOfLines = 0
        addSubview(label)
        
        okayButton.setTitle("Okay", for: .normal)
        addSubview(okayButton)
        okayButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        label.enableAutoLayout()
        label.topAnchor.constraint(equalTo: topAnchor, constant: .medium).activate()
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.medium).activate()
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .medium).activate()
        
        okayButton.enableAutoLayout()
        okayButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: .medium).activate()
        okayButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.medium).activate()
        okayButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.medium).activate()
        okayButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .medium).activate()
        okayButton.heightAnchor.constraint(equalToConstant: 60.0).activate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped()
    {
        delegate?.buttonTapped(self)
    }
}

class SideEffectButton: UIControl
{
    let imageView = UIImageView()
    let title = UILabel(style: .headline)
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        imageView.contentMode = .center
        imageView.isUserInteractionEnabled = false
        addSubview(imageView)
        
        title.isUserInteractionEnabled = false
        addSubview(title)
        
        imageView.enableAutoLayout()
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: .small).activate()
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.small).activate()
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .small).activate()
        imageView.widthAnchor.constraint(equalToConstant: 35.0).activate()
        imageView.heightAnchor.constraint(equalToConstant: 35.0).activate()
        
        title.enableAutoLayout()
        title.topAnchor.constraint(equalTo: topAnchor, constant: .small).activate()
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.small).activate()
        title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.small).activate()
        title.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: .small).activate()
        
        addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapped()
    {
        if backgroundColor == .hltnOrange
        {
            backgroundColor = .clear
            title.textColor = .black
        }
        else
        {
            backgroundColor = .hltnOrange
            title.textColor = .white
        }
        
    }
}

protocol SymptonViewDelegate: class
{
    func symptonViewSubmit(_ sender: SymptonView)
}

class SymptonView: UIView
{
    weak var delegate:  SymptonViewDelegate?
    
    let label = UILabel(style: .largeTitle)
    
    let outerStackView = UIStackView()
    let leftStackView = UIStackView()
    let rightStackView = UIStackView()
    
    let button = UIButton.hltnButton()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        label.numberOfLines = 0
        addSubview(label)
        
        outerStackView.axis = .horizontal
        outerStackView.distribution = .fillEqually
        addSubview(outerStackView)
        
        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        addSubview(button)
        
        leftStackView.axis = .vertical
        leftStackView.distribution = .fillEqually
        outerStackView.addArrangedSubview(leftStackView)
        
        rightStackView.axis = .vertical
        rightStackView.distribution = .fillEqually
        outerStackView.addArrangedSubview(rightStackView)
        
        label.enableAutoLayout()
        label.topAnchor.constraint(equalTo: topAnchor, constant: .medium).activate()
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.medium).activate()
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .medium).activate()
        
        outerStackView.enableAutoLayout()
        outerStackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: .small).activate()
        outerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.medium).activate()
        outerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .medium).activate()
        
        button.enableAutoLayout()
        button.topAnchor.constraint(equalTo: outerStackView.bottomAnchor, constant: .small).activate()
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.medium).activate()
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.medium).activate()
        button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .medium).activate()
        
        let fever = SideEffectButton()
        fever.title.text = "Fever"
        fever.imageView.image = #imageLiteral(resourceName: "fever_badge")
        leftStackView.addArrangedSubview(fever)
        
        let nausea = SideEffectButton()
        nausea.title.text = "Nausea"
        nausea.imageView.image = #imageLiteral(resourceName: "nausea_badge")
        leftStackView.addArrangedSubview(nausea)
        
        let depression = SideEffectButton()
        depression.title.text = "Fever"
        depression.imageView.image = #imageLiteral(resourceName: "depression_badge")
        leftStackView.addArrangedSubview(depression)
        
        let insomnia = SideEffectButton()
        insomnia.title.text = "Insomnia"
        insomnia.imageView.image = #imageLiteral(resourceName: "insominia_badge")
        rightStackView.addArrangedSubview(insomnia)
        
        let diarrhea = SideEffectButton()
        diarrhea.title.text = "Diarrhea"
        diarrhea.imageView.image = #imageLiteral(resourceName: "diaharrea_badge")
        rightStackView.addArrangedSubview(diarrhea)
        
        let headache = SideEffectButton()
        headache.title.text = "Headache"
        headache.imageView.image = #imageLiteral(resourceName: "headache_badge")
        rightStackView.addArrangedSubview(headache)
    }
    
    @objc func submitTapped()
    {
        delegate?.symptonViewSubmit(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  MedicineTableViewCell.swift
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

import Foundation
import UIKit

protocol MedicineTableViewCellDelegate: class
{
    func goodButtonTapped(_ cell: MedicineTableViewCell)
    func badButtonTapped(_ cell: MedicineTableViewCell)
}


class MedicineTableViewCell: UITableViewCell, FeedbackViewDelegate
{
    let capsuleView = UIView()
    let title = UILabel(style: .largeTitle)
    let frequency = UILabel(style: .caption1)
    let icon = UIImageView()
    let stackView = UIStackView()
    
    let feedbackView = FeedbackView()
    
    var feedbackVisibleConstraints = [NSLayoutConstraint]()
    var feedbackHiddenConstraints = [NSLayoutConstraint]()
    
    weak var delegate: MedicineTableViewCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        capsuleView.backgroundColor = .hltnYellow
        capsuleView.layer.cornerRadius = 10.0
        contentView.addSubview(capsuleView)
        
        feedbackView.delegate = self
        contentView.addSubview(feedbackView)
        
        stackView.axis = .vertical
        stackView.spacing = .small
        capsuleView.addSubview(stackView)
        
        title.numberOfLines = 0
        stackView.addArrangedSubview(title)
        
        frequency.numberOfLines = 0
        stackView.addArrangedSubview(frequency)
        
        icon.contentMode = .center
        icon.clipsToBounds = true
        icon.image = #imageLiteral(resourceName: "pill_badge")
        capsuleView.addSubview(icon)
        
        capsuleView.enableAutoLayout()
        capsuleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .medium).activate()
        capsuleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.small).activate()
        
        capsuleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .small).activate()
        
        feedbackView.enableAutoLayout()
        
        feedbackVisibleConstraints = [
            feedbackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.small),
            feedbackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.medium),
            feedbackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .small),
            capsuleView.bottomAnchor.constraint(equalTo: feedbackView.topAnchor, constant: 0.0)
        ]
        
        feedbackHiddenConstraints = [
            capsuleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        
        icon.enableAutoLayout()
        icon.topAnchor.constraint(equalTo: capsuleView.topAnchor, constant: .medium).activate()
        icon.bottomAnchor.constraint(equalTo: capsuleView.bottomAnchor, constant: -.medium).activate()
        icon.leadingAnchor.constraint(equalTo: capsuleView.leadingAnchor, constant: .medium).activate()
        icon.widthAnchor.constraint(equalToConstant: 75.0).activate()
        
        stackView.enableAutoLayout()
        stackView.topAnchor.constraint(equalTo: capsuleView.topAnchor, constant: .medium).activate()
        stackView.trailingAnchor.constraint(equalTo: capsuleView.trailingAnchor, constant: -.medium).activate()
        stackView.bottomAnchor.constraint(equalTo: capsuleView.bottomAnchor, constant: -.medium).activate()
        stackView.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: .medium).activate()
        
        capsuleView.layer.shadowColor = UIColor.hltnDarkBlue.cgColor
        capsuleView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        capsuleView.layer.shadowOpacity = 0.3 * 1.0
        capsuleView.layer.shadowRadius = 2
        
        NSLayoutConstraint.deactivate(feedbackHiddenConstraints)
        NSLayoutConstraint.activate(feedbackVisibleConstraints)
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animationDidEnd(good: Bool)
    {
        NSLayoutConstraint.deactivate(feedbackVisibleConstraints)
        NSLayoutConstraint.activate(feedbackHiddenConstraints)
        
        if good
        {
            delegate?.goodButtonTapped(self)
        }
        else
        {
            delegate?.badButtonTapped(self)
        }
    }
}

protocol FeedbackViewDelegate: class
{
    func animationDidEnd(good: Bool)
}

class FeedbackView: UIView
{
    let label = UILabel(style: .headline)
    let goodButton = UIButton(type: .custom)
    let badButton = UIButton(type: .custom)
    
    let sizingView = UIView()
    
    var awaitingFeedbackContraints = [NSLayoutConstraint]()
    var goodFeedbackAnimationEndState = [NSLayoutConstraint]()
    var badFeedbackAnimationEndState = [NSLayoutConstraint]()
    
    weak var delegate: FeedbackViewDelegate?
    
    let possibleStrings = ["How are we feeling?", "Looking good! Feeling good?", "How YOU doing?"]
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        clipsToBounds = true
        
        backgroundColor = .hltnOrange
        addSubview(sizingView)
        
        label.text = possibleStrings[Int(arc4random_uniform(UInt32(possibleStrings.count)))]
        label.textAlignment = .center
        addSubview(label)
        
        goodButton.setImage(#imageLiteral(resourceName: "good_button"), for: .normal)
        addSubview(goodButton)
        goodButton.addTarget(self, action: #selector(goodButtonTapped(_:)), for: .touchUpInside)
        
        badButton.setImage(#imageLiteral(resourceName: "bad_button"), for: .normal)
        addSubview(badButton)
        badButton.addTarget(self, action: #selector(badButtonTapped(_:)), for: .touchUpInside)
        
        label.enableAutoLayout()
        badButton.enableAutoLayout()
        goodButton.enableAutoLayout()
        
        sizingView.enableAutoLayout()
        sizingView.heightAnchor.constraint(equalToConstant: 70.0).activate()
        sizingView.topAnchor.constraint(equalTo: topAnchor).activate()
        sizingView.trailingAnchor.constraint(equalTo: trailingAnchor).activate()
        sizingView.bottomAnchor.constraint(equalTo: bottomAnchor).activate()
        sizingView.leadingAnchor.constraint(equalTo: leadingAnchor).activate()
        
        badButton.widthAnchor.constraint(equalToConstant: 45.0).activate()
        badButton.heightAnchor.constraint(equalToConstant: 50.0).activate()
        
        goodButton.widthAnchor.constraint(equalToConstant: 45.0).activate()
        goodButton.heightAnchor.constraint(equalToConstant: 45.0).activate()
        
        awaitingFeedbackContraints = [
            label.topAnchor.constraint(equalTo: topAnchor, constant: .small),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.small),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            badButton.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -.small),
            badButton.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            goodButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: .small),
            goodButton.centerYAnchor.constraint(equalTo: label.centerYAnchor)
        ]
        
        goodFeedbackAnimationEndState = [
            goodButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            goodButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            badButton.bottomAnchor.constraint(equalTo: topAnchor),
            label.topAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        badFeedbackAnimationEndState = [
            badButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            badButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            goodButton.bottomAnchor.constraint(equalTo: topAnchor),
            label.topAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.deactivate(goodFeedbackAnimationEndState)
        NSLayoutConstraint.deactivate(badFeedbackAnimationEndState)
        NSLayoutConstraint.activate(awaitingFeedbackContraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func goodButtonTapped(_ sender: AnyObject)
    {
        layoutIfNeeded()
        
        UIView.animate(withDuration: 0.22, animations: {
            NSLayoutConstraint.deactivate(self.badFeedbackAnimationEndState)
            NSLayoutConstraint.deactivate(self.awaitingFeedbackContraints)
            NSLayoutConstraint.activate(self.goodFeedbackAnimationEndState)
            self.badButton.alpha = 0.0
            self.label.alpha = 0.0
            self.layoutIfNeeded()
        }) { (_) in
            
            self.delegate?.animationDidEnd(good: true)
        }
    }
    
    @objc func badButtonTapped(_ sender: AnyObject)
    {
        layoutIfNeeded()
        
        UIView.animate(withDuration: 0.22, animations: {
            NSLayoutConstraint.deactivate(self.goodFeedbackAnimationEndState)
            NSLayoutConstraint.deactivate(self.awaitingFeedbackContraints)
            NSLayoutConstraint.activate(self.badFeedbackAnimationEndState)
            self.badButton.alpha = 0.0
            self.label.alpha = 0.0
            self.layoutIfNeeded()
        }) { (_) in
            
            self.delegate?.animationDidEnd(good: false)
        }
    }
}

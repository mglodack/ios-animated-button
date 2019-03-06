//
//  ViewController.swift
//  AnimatedButton
//
//  Created by Mathew Glodack on 3/5/19.
//  Copyright © 2019 glodack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var button: UIButton!
    var heightConstraint: NSLayoutConstraint!
    var widthConstraint: NSLayoutConstraint!
    
    var isTapped: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button = UIButton()
        button.backgroundColor = UIColor.blue
        button.setTitle("Tap", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        self.view.addConstraints([
            self.view.centerXAnchor.constraint(equalTo: self.button.centerXAnchor),
            self.view.centerYAnchor.constraint(equalTo: self.button.centerYAnchor),
            ])
        
        heightConstraint = self.button.heightAnchor.constraint(equalToConstant: 200)
        widthConstraint = self.button.widthAnchor.constraint(equalToConstant: 200)
        
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        
        self.button.layer.cornerRadius = 100
        
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    @objc private func buttonTap() {
        
        self.isTapped = !self.isTapped

        let tapped = isTapped;
        
        print("called")
        
        if tapped {
            self.heightConstraint.constant = 100
            self.widthConstraint.constant = 100
            self.button.setTitle(nil, for: .normal)
            
            UIView.animate(withDuration: 0.3) { [unowned self] in
                self.view.layoutIfNeeded()
                
                self.button.layer.cornerRadius = 20
            }
        } else {
            self.heightConstraint.constant = 200
            self.widthConstraint.constant = 200
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
                
                self.button.layer.cornerRadius = 100
            }) { _ in
                self.button.setTitle("Tap", for: .normal)
            }
        }
        
    }
}


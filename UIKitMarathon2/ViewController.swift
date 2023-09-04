//
//  ViewController.swift
//  UIKitMarathon2
//
//  Created by alexeituszowski on 04.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var button1 = Button()
    
    lazy var button2 = Button()
    
    lazy var button3 = Button()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 10),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 10),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
        ])
        
        var configuration = UIButton.Configuration.filled()
        configuration.imagePlacement = .trailing
        configuration.image = UIImage(systemName: "folder.circle.fill")
        configuration.titlePadding = 0
        configuration.imagePadding = 8
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        configuration.title = "Swift"
        button1.configuration = configuration
        configuration.title = "Objective-C Objective-C Objective-C Objective-C Objective-C Objective-C"
        button2.configuration = configuration
        configuration.title = "Present Modal"
        button3.configuration = configuration
        button3.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    @objc func tap() {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        present(vc, animated: true)
    }
}


class Button: UIButton {
    var myConfiguration = UIButton.Configuration.filled()
    
    override var isHighlighted: Bool {
        didSet {
            animator.addAnimations {
                let scale = self.isHighlighted ? 0.9 : 1
                self.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
            animator.startAnimation()
        }
    }

    
    var animator = UIViewPropertyAnimator(duration: 0.1, curve: .linear)
    
    override func tintColorDidChange() {
        var myConfiguration = configuration
        if tintAdjustmentMode == .dimmed {
            myConfiguration?.background.backgroundColor = .systemGray2
            myConfiguration?.baseBackgroundColor = .systemGray3
            configuration = myConfiguration
        } else {
            myConfiguration?.background.backgroundColor = .systemBlue
            myConfiguration?.baseBackgroundColor = .white
            configuration = myConfiguration
        }
    }
}

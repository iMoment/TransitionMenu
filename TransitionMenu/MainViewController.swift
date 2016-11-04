//
//  MainViewController.swift
//  TransitionMenu
//
//  Created by Stanley Pan on 03/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Plains")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Transition Menu"
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = NSTextAlignment.right
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Menu", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleTransition), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    func handleTransition() {
        let menuViewController = MenuViewController()
        menuViewController.modalPresentationStyle = .overFullScreen
        present(menuViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainImageView)
        view.addSubview(titleLabel)
        view.addSubview(menuButton)
        
        setupMainImageView()
        setupTitleLabel()
        setupMenuButton()
    }
    
    // iOS constraints x, y, width, height
    func setupMainImageView() {
        mainImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func setupTitleLabel() {
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupMenuButton() {
        menuButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        menuButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}





















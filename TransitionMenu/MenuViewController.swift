//
//  MenuViewController.swift
//  TransitionMenu
//
//  Created by Stanley Pan on 03/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    let transitionManager = MenuTransitionManager()

    let measurementView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let textImageView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "Text")
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let photoImageView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "Photo")
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let photoLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let quoteImageView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "Quote")
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let quoteLabel: UILabel = {
        let label = UILabel()
        label.text = "Quote"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let linkImageView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "Link")
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let linkLabel: UILabel = {
        let label = UILabel()
        label.text = "Link"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let chatImageView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "Chat")
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let chatLabel: UILabel = {
        let label = UILabel()
        label.text = "Chat"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let audioImageView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "Audio")
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let audioLabel: UILabel = {
        let label = UILabel()
        label.text = "Audio"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(handleDismissMenu), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    func handleDismissMenu() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = self.transitionManager
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.isOpaque = false
        
        view.addSubview(measurementView)
        
        view.addSubview(textImageView)
        view.addSubview(textLabel)
        
        view.addSubview(photoImageView)
        view.addSubview(photoLabel)
        
        view.addSubview(quoteImageView)
        view.addSubview(quoteLabel)
        
        view.addSubview(linkImageView)
        view.addSubview(linkLabel)
        
        view.addSubview(chatImageView)
        view.addSubview(chatLabel)
        
        view.addSubview(audioImageView)
        view.addSubview(audioLabel)
        
        view.addSubview(cancelButton)
        
        setupMeasurementView()
        
        setupTextImageView()
        setupTextLabel()
        setupPhotoImageView()
        setupPhotoLabel()
        setupQuoteImageView()
        setupQuoteLabel()
        setupLinkImageView()
        setupLinkLabel()
        setupChatImageView()
        setupChatLabel()
        setupAudioImageView()
        setupAudioLabel()
        setupCancelButton()
    }
    
    // iOS constraints x, y, width, height
    func setupMeasurementView() {
        measurementView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        measurementView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        measurementView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        measurementView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    func setupTextImageView() {
        textImageView.bottomAnchor.constraint(equalTo: textLabel.topAnchor).isActive = true
        textImageView.centerXAnchor.constraint(equalTo: quoteImageView.centerXAnchor).isActive = true
        textImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        textImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupTextLabel() {
        textLabel.bottomAnchor.constraint(equalTo: quoteImageView.topAnchor, constant: -20).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: quoteImageView.centerXAnchor).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupPhotoImageView() {
        photoImageView.bottomAnchor.constraint(equalTo: photoLabel.topAnchor).isActive = true
        photoImageView.centerXAnchor.constraint(equalTo: linkImageView.centerXAnchor).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupPhotoLabel() {
        photoLabel.bottomAnchor.constraint(equalTo: linkImageView.topAnchor, constant: -20).isActive = true
        photoLabel.centerXAnchor.constraint(equalTo: linkImageView.centerXAnchor).isActive = true
        photoLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        photoLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupQuoteImageView() {
        quoteImageView.bottomAnchor.constraint(equalTo: measurementView.topAnchor).isActive = true
        quoteImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 75).isActive = true
        quoteImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        quoteImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupQuoteLabel() {
        quoteLabel.topAnchor.constraint(equalTo: measurementView.bottomAnchor).isActive = true
        quoteLabel.centerXAnchor.constraint(equalTo: quoteImageView.centerXAnchor).isActive = true
        quoteLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        quoteLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupLinkImageView() {
        linkImageView.bottomAnchor.constraint(equalTo: measurementView.topAnchor).isActive = true
        linkImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -75).isActive = true
        linkImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        linkImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupLinkLabel() {
        linkLabel.topAnchor.constraint(equalTo: measurementView.bottomAnchor).isActive = true
        linkLabel.centerXAnchor.constraint(equalTo: linkImageView.centerXAnchor).isActive = true
        linkLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        linkLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupChatImageView() {
        chatImageView.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 20).isActive = true
        chatImageView.centerXAnchor.constraint(equalTo: quoteImageView.centerXAnchor).isActive = true
        chatImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        chatImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupChatLabel() {
        chatLabel.topAnchor.constraint(equalTo: chatImageView.bottomAnchor).isActive = true
        chatLabel.centerXAnchor.constraint(equalTo: quoteImageView.centerXAnchor).isActive = true
        chatLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        chatLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupAudioImageView() {
        audioImageView.topAnchor.constraint(equalTo: linkLabel.bottomAnchor, constant: 20).isActive = true
        audioImageView.centerXAnchor.constraint(equalTo: linkImageView.centerXAnchor).isActive = true
        audioImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        audioImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupAudioLabel() {
        audioLabel.topAnchor.constraint(equalTo: audioImageView.bottomAnchor).isActive = true
        audioLabel.centerXAnchor.constraint(equalTo: linkImageView.centerXAnchor).isActive = true
        audioLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        audioLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupCancelButton() {
        cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

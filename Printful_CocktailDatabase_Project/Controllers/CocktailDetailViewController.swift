//
//  CocktailDetailViewController.swift
//  Printful_CocktailDatabase_Project
//
//  Created by Bogdan on 2/3/21.
//

import UIKit

class CocktailDetailViewController: UIViewController {
    
    var cocktailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    
    
    
    var cocktailPreparationTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.contentInset = UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
        textView.font = UIFont.init(name: "AvenirNext-Medium", size: 16)
        
        return textView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    private func setupUI() {
        view.addSubview(cocktailImageView)
        cocktailImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cocktailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cocktailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cocktailImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
        
    
        
        view.addSubview(cocktailPreparationTextView)
        cocktailPreparationTextView.topAnchor.constraint(equalTo: cocktailImageView.bottomAnchor).isActive = true
        cocktailPreparationTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cocktailPreparationTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cocktailPreparationTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        

    }
    


}


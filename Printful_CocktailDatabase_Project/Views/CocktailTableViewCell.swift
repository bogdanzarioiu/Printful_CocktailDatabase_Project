//
//  CocktailTableViewCell.swift
//  Printful_CocktailDatabase_Project
//
//  Created by Bogdan on 2/3/21.
//

import UIKit

class CocktailTableViewCell: UITableViewCell {
    
    static let cellID = "cellIdentifier"
    
    let cocktailImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        image.layer.cornerCurve = .continuous
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowRadius = 10.0
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    let cocktailTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.init(name: "AvenirNext-Medium", size: 16)
        
        return title
        
    }()
    
    let backgroundViewForCocktailType: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemRed.withAlphaComponent(0.6)
        view.layer.cornerRadius = 12
        view.layer.cornerCurve = .continuous
        view.translatesAutoresizingMaskIntoConstraints = false
        
        
        return view
    }()
    
    let cocktailType: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.font = UIFont.init(name: "AvenirNext-Medium", size: 10)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
        
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCellElements()
    }
    
    
    private func setupCellElements() {
        contentView.addSubview(cocktailImage)
        cocktailImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        cocktailImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        cocktailImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        cocktailImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        
        contentView.addSubview(cocktailTitle)
        cocktailTitle.topAnchor.constraint(equalTo: cocktailImage.topAnchor, constant: 0).isActive = true
        cocktailTitle.leadingAnchor.constraint(equalTo: cocktailImage.trailingAnchor, constant: 16).isActive = true
        
        
        contentView.addSubview(backgroundViewForCocktailType)
        backgroundViewForCocktailType.topAnchor.constraint(equalTo: cocktailTitle.bottomAnchor, constant: 5).isActive = true
        backgroundViewForCocktailType.leadingAnchor.constraint(equalTo: cocktailImage.trailingAnchor, constant: 16).isActive = true
        backgroundViewForCocktailType.widthAnchor.constraint(equalToConstant: 90).isActive = true
        backgroundViewForCocktailType.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        backgroundViewForCocktailType.addSubview(cocktailType)
        cocktailType.centerXAnchor.constraint(equalTo: backgroundViewForCocktailType.centerXAnchor).isActive = true
        cocktailType.centerYAnchor.constraint(equalTo: backgroundViewForCocktailType.centerYAnchor).isActive = true
        
        

    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

}


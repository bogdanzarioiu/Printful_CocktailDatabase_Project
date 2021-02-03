//
//  ViewController.swift
//  Printful_CocktailDatabase_Project
//
//  Created by Bogdan on 2/3/21.
//

import UIKit

class CocktailsListViewController: UIViewController {
        
    var cocktails: [Cocktail] = [] {
        didSet {
            cocktailTableView.reloadData()
            activityIndicator.stopAnimating()
        }
    }
    
    var photos: [UIImage] = [] {
        didSet {
            cocktailTableView.reloadData()
            activityIndicator.stopAnimating()
        }
    }
    
    private lazy var cocktailTableView: UITableView = {
        let table = UITableView()
        table.register(CocktailTableViewCell.self, forCellReuseIdentifier: CocktailTableViewCell.cellID)
        
        
        table.delegate = self
        table.dataSource = self
        
     
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        cocktailTableView.addSubview(refreshControl)
        
        return refreshControl
    }()
    
    private var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        
        return indicator
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCocktailTableView()
        addIndicatorView()
        APIManager.shared.fetchCocktails { [weak self](result) in
            switch result {
            case .success((let cocktails, let images)):
                DispatchQueue.main.async {
                    self?.cocktails = cocktails.drinks
                    self?.photos = images
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
       

    }
    
    @objc private func refresh(_ sender: UIRefreshControl) {
        self.cocktailTableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    private func addIndicatorView() {
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    private func setupCocktailTableView() {
        view.addSubview(cocktailTableView)
        
        cocktailTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cocktailTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cocktailTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cocktailTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    


}


extension CocktailsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cocktailCell = tableView.dequeueReusableCell(withIdentifier: CocktailTableViewCell.cellID, for: indexPath) as! CocktailTableViewCell
        //cocktailCell.backgroundColor = .systemTeal
        let cocktail = cocktails[indexPath.row]
        let cocktailPicture = photos[indexPath.row]
        cocktailCell.cocktailImage.image = cocktailPicture
        cocktailCell.cocktailTitle.text = cocktail.name
        cocktailCell.cocktailType.text = cocktail.type
        
        
        return cocktailCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let ingredients = "\(cocktails[indexPath.row].ingredient1 ?? ""), \(cocktails[indexPath.row].ingredient2 ?? ""), \(cocktails[indexPath.row].ingredient3 ?? ""), \(cocktails[indexPath.row].ingredient4 ?? ""), \(cocktails[indexPath.row].ingredient5 ?? "")"
        
        let cocktailDetailsVC = CocktailDetailViewController()
        cocktailDetailsVC.cocktailImageView.image = photos[indexPath.row]
        cocktailDetailsVC.cocktailPreparationTextView.text = cocktails[indexPath.row].instructions + "\n\nIngredients:\n\(ingredients)"
        navigationController?.pushViewController(cocktailDetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}



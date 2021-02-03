//
//  APIManager.swift
//  Printful_CocktailDatabase_Project
//
//  Created by Bogdan on 2/3/21.
//

import Foundation
import UIKit



class APIManager {
    
    static let shared = APIManager()
   
    
    private init() {}
    
    func fetchCocktails(completion: @escaping (Result<(Cocktails, [UIImage]), Error>) -> Void) {
        var photos: [UIImage] = []
        
        let urlString = "https://the-cocktail-db.p.rapidapi.com/popular.php"
        guard let coctailsURL = URL(string: urlString) else { return }
        
        //creating the URLRequest headers
        let headers = [
            "x-rapidapi-key": "135816c2bamsh04dd05adc88ab96p18534ajsna5205da51315",
            "x-rapidapi-host": "the-cocktail-db.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: coctailsURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        //perform the data task to get the JSON data
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            
            //decode the data
            do {
                let responses = try JSONDecoder().decode(Cocktails.self, from: data)
                for response in responses.drinks {
                    guard let photoUrl = URL(string: response.cocktailImageURL) else { return }
                    guard let photoData = try? Data(contentsOf: photoUrl) else { return }
                    guard let photoImage = UIImage(data: photoData) else { return }
                    photos.append(photoImage)
                    
                }
              
                completion(.success((responses, photos)))
                    
               
            } catch(let error) {
                completion(.failure(error))
            }
            
        }.resume()
        
        
    }
    
 
}


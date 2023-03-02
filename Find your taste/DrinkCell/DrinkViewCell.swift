//
//  DrinkViewCell.swift
//  Find your taste
//
//  Created by Filip Kazmierczak on 28/02/2023.
//

import Foundation
import UIKit
import Alamofire

class DrinkViewCell: UITableViewCell {
    
    var imgRequest: DataRequest?
    
    @IBOutlet weak var imageDrink: UIImageView!
    @IBOutlet weak var nameDrink: UILabel!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imgRequest?.cancel()
        loading.startAnimating()
        self.loading.visibility = .visible
        self.imageDrink.visibility = .gone
    }
    
    
    func setImg(imgUrl: String) {
        loading.startAnimating()

        self.imgRequest = RestApi.getDrinkImageBy(
            urlImage: imgUrl,
            success: { drinkImage in
                if (drinkImage == nil) {
                    print("Drink image is null \(imgUrl)")
                } else {
                    self.loading.visibility = .gone
                    self.loading.stopAnimating()
                    self.imageDrink.visibility = .visible
                    self.imageDrink.image = UIImage(data: drinkImage!)
                }
            },
            failure: { error in
                print(error)
            })
    }
    
    func setData(drink: Drink) {
        nameDrink.text = drink.name
    }
    
}

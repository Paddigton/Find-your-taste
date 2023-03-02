//
//  DrinkDetailsViewController.swift
//  Find your taste
//
//  Created by Filip Kazmierczak on 01/03/2023.
//

import Foundation
import UIKit

class DrinkDetailsViewController: UIViewController {
    
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkCategory: UILabel!
    @IBOutlet weak var glass: UILabel!
    @IBOutlet weak var instructionValue: UILabel!
    @IBOutlet weak var ingredients1: UILabel!
    @IBOutlet weak var ingredients2: UILabel!
    @IBOutlet weak var ingredients3: UILabel!
    @IBOutlet weak var ingredients4: UILabel!
    @IBOutlet weak var ingredients5: UILabel!
    @IBOutlet weak var ingredients6: UILabel!
    @IBOutlet weak var ingredients7: UILabel!
    @IBOutlet weak var ingredients8: UILabel!
    @IBOutlet weak var ingredients9: UILabel!
    @IBOutlet weak var ingredients10: UILabel!
    @IBOutlet weak var ingredients11: UILabel!
    @IBOutlet weak var ingredients12: UILabel!
    @IBOutlet weak var ingredients13: UILabel!
    @IBOutlet weak var ingredients14: UILabel!
    @IBOutlet weak var ingredients15: UILabel!
    @IBOutlet weak var mesure1: UILabel!
    @IBOutlet weak var mesure2: UILabel!
    @IBOutlet weak var mesure3: UILabel!
    @IBOutlet weak var mesure4: UILabel!
    @IBOutlet weak var mesure5: UILabel!
    @IBOutlet weak var mesure6: UILabel!
    @IBOutlet weak var mesure7: UILabel!
    @IBOutlet weak var mesure8: UILabel!
    @IBOutlet weak var mesure9: UILabel!
    @IBOutlet weak var mesure10: UILabel!
    @IBOutlet weak var mesure11: UILabel!
    @IBOutlet weak var mesure12: UILabel!
    @IBOutlet weak var mesure13: UILabel!
    @IBOutlet weak var mesure14: UILabel!
    @IBOutlet weak var mesure15: UILabel!
    @IBOutlet weak var IM1: UIView!
    @IBOutlet weak var IM2: UIView!
    @IBOutlet weak var IM3: UIView!
    @IBOutlet weak var IM4: UIView!
    @IBOutlet weak var IM5: UIView!
    @IBOutlet weak var IM6: UIView!
    @IBOutlet weak var IM7: UIView!
    @IBOutlet weak var IM8: UIView!
    @IBOutlet weak var IM9: UIView!
    @IBOutlet weak var IM10: UIView!
    @IBOutlet weak var IM11: UIView!
    @IBOutlet weak var IM12: UIView!
    @IBOutlet weak var IM13: UIView!
    @IBOutlet weak var IM14: UIView!
    @IBOutlet weak var IM15: UIView!

    
    
    var drinkId: String?
    var drinkImageUrl: String?
    
    override func viewWillAppear(_ animated: Bool) {
        initData(drinkId: self.drinkId)
        
    }
    
    private func initData(drinkId: String?) {
        RestApi.getDrinkDetailsBy(
            drinkId: drinkId ?? "0",
            success: { drinkDetails in
                let drink = drinkDetails.drinks[0]
                self.drinkImage.downloaded(from: drink.imageUrl!)
                self.drinkName.text = drink.name
                self.drinkCategory.text = drink.category
                self.glass.text = drink.glass
                self.instructionValue.text = drink.instruction
                self.ingredientAndMesure1(ingredient: drink.ingredient1, mesure: drink.measure1)
                self.ingredientAndMesure2(ingredient: drink.ingredient2, mesure: drink.measure2)
                self.ingredientAndMesure3(ingredient: drink.ingredient3, mesure: drink.measure3)
                self.ingredientAndMesure4(ingredient: drink.ingredient4, mesure: drink.measure4)
                self.ingredientAndMesure5(ingredient: drink.ingredient5, mesure: drink.measure5)
                self.ingredientAndMesure6(ingredient: drink.ingredient6, mesure: drink.measure6)
                self.ingredientAndMesure7(ingredient: drink.ingredient7, mesure: drink.measure7)
                self.ingredientAndMesure8(ingredient: drink.ingredient8, mesure: drink.measure8)
                self.ingredientAndMesure9(ingredient: drink.ingredient9, mesure: drink.measure9)
                self.ingredientAndMesure10(ingredient: drink.ingredient10, mesure: drink.measure10)
                self.ingredientAndMesure11(ingredient: drink.ingredient11, mesure: drink.measure11)
                self.ingredientAndMesure12(ingredient: drink.ingredient12, mesure: drink.measure12)
                self.ingredientAndMesure13(ingredient: drink.ingredient13, mesure: drink.measure13)
                self.ingredientAndMesure14(ingredient: drink.ingredient14, mesure: drink.measure14)
                self.ingredientAndMesure15(ingredient: drink.ingredient15, mesure: drink.measure15)

            },
            failure: { error in
                print(error)
            })
    }
    
    
    private func ingredientAndMesure1(ingredient: String?, mesure: String?) {
        if ingredient == nil || mesure == nil {
            self.IM1.visibility = .gone
        } else {
            self.IM1.visibility = .visible
            self.ingredients1.text = ingredient
            self.mesure1.text = mesure
        }
    }
    
    private func ingredientAndMesure2(ingredient: String?, mesure: String?) {
        if ingredient == nil {
            self.IM2.visibility = .gone
        } else {
            self.IM2.visibility = .visible
            self.ingredients2.text = ingredient
            self.mesure2.text = mesure
        }
    }
    
    private func ingredientAndMesure3(ingredient: String?, mesure: String?) {
        if ingredient == nil {
            self.IM3.visibility = .gone
        } else {
            self.IM3.visibility = .visible
            self.ingredients3.text = ingredient
            self.mesure3.text = mesure
        }
    }
    private func ingredientAndMesure4(ingredient: String?, mesure: String?) {
        if ingredient == nil {
            self.IM4.visibility = .gone
        } else {
            self.IM4.visibility = .visible
            self.ingredients4.text = ingredient
            self.mesure4.text = mesure
        }
    }
    private func ingredientAndMesure5(ingredient: String?, mesure: String?) {
        if ingredient == nil {
            self.IM5.visibility = .gone
        } else {
            self.IM5.visibility = .visible
            self.ingredients5.text = ingredient
            self.mesure5.text = mesure
        }
    }
    private func ingredientAndMesure6(ingredient: String?, mesure: String?) {
        if ingredient == nil {
            self.IM6.visibility = .gone
        } else {
            self.IM6.visibility = .visible
            self.ingredients6.text = ingredient
            self.mesure6.text = mesure
        }
    }
    private func ingredientAndMesure7(ingredient: String?, mesure: String?) {
        if ingredient == nil {
            self.IM7.visibility = .gone
        } else {
            self.IM7.visibility = .visible
            self.ingredients7.text = ingredient
            self.mesure7.text = mesure
        }
    }
    private func ingredientAndMesure8(ingredient: String?, mesure: String?) {
        if ingredient == nil {
            self.IM8.visibility = .gone
        } else {
            self.IM8.visibility = .visible
            self.ingredients8.text = ingredient
            self.mesure8.text = mesure
        }
    }
    private func ingredientAndMesure9(ingredient: String?, mesure: String?) {
        if ingredient == nil {
            self.IM9.visibility = .gone
        } else {
            self.IM9.visibility = .visible
            self.ingredients9.text = ingredient
            self.mesure9.text = mesure
        }
    }
    private func ingredientAndMesure10(ingredient: String?, mesure: String?) {
        if ingredient == nil {
            self.IM10.visibility = .gone
        } else {
            self.IM10.visibility = .visible
            self.ingredients10.text = ingredient
            self.mesure10.text = mesure
        }
    }
    private func ingredientAndMesure11(ingredient: String?, mesure: String?) {
        if ingredient == nil {
            self.IM11.visibility = .gone
        } else {
            self.IM11.visibility = .visible
            self.ingredients11.text = ingredient
            self.mesure11.text = mesure
        }
    }
    private func ingredientAndMesure12(ingredient: String?, mesure: String?) {
        if ingredient == nil {
            self.IM12.visibility = .gone
        } else {
            self.IM12.visibility = .visible
            self.ingredients12.text = ingredient
            self.mesure12.text = mesure
        }
    }
    private func ingredientAndMesure13(ingredient: String?, mesure: String?) {
        if ingredient == nil {
            self.IM13.visibility = .gone
        } else {
            self.IM13.visibility = .visible
            self.ingredients13.text = ingredient
            self.mesure13.text = mesure
        }
    }
    private func ingredientAndMesure14(ingredient: String?, mesure: String?) {
        if ingredient == nil {
            self.IM14.visibility = .gone
        } else {
            self.IM14.visibility = .visible
            self.ingredients14.text = ingredient
            self.mesure14.text = mesure
        }
    }
    private func ingredientAndMesure15(ingredient: String?, mesure: String?) {
        if ingredient == nil {
            self.IM15.visibility = .gone
        } else {
            self.IM15.visibility = .visible
            self.ingredients15.text = ingredient
            self.mesure15.text = mesure
        }
    }
    
}

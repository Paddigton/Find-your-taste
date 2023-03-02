//
//  RestApi.swift
//  Find your taste
//
//  Created by Filip Kazmierczak on 28/02/2023.
//

import Foundation
import Alamofire

class RestApi{
    
    
    static let url = "https://www.thecocktaildb.com/api/json/v1/1"
    
    
    
    static func searchDrinkBy(
        ingredient: String,
        success: @escaping (Drinks) -> (),
        failure: @escaping (NSError) -> ()
    ) {
        AF.request(
            "\(url)/filter.php?i=\(ingredient)",
            method: .get
        ).response { response in
            if response.response?.statusCode == 200 {
                do{
                    if response.data == nil {
                        return
                    } else {
                        let responseValue: Drinks = try JSONDecoder().decode(Drinks.self, from: response.data!)
                        success(responseValue)
                    }
                }catch{
                    failure(NSError(domain: "RestApi#searchDrinkBy", code: 1, userInfo: [
                        "code": response.response?.statusCode ?? "unknown",
                        "message": String(data: response.data ?? Data(), encoding: .utf8) ?? "unknown"
                    ]))
                }
            } else {
                failure(NSError(domain: "RestApi#searchDrinkBy", code: 2, userInfo: [
                    "code": response.response?.statusCode ?? "unknown",
                    "message": String(data: response.data ?? Data(), encoding: .utf8) ?? "unknown"
                ]))
            }
            
        }
    }
    
    
    static func getDrinkDetailsBy(
        drinkId: String,
        success: @escaping (DrinksDetails) -> (),
        failure: @escaping (NSError) -> ()) {
        AF.request(
            "\(url)/lookup.php?i=\(drinkId)",
            method: .get
        ).response { response in
            if response.response?.statusCode == 200 {
                do{
                    if response.data == nil {
                        return
                    } else {
                        let responseValue: DrinksDetails = try JSONDecoder().decode(DrinksDetails.self, from: response.data!)
                        success(responseValue)
                    }
                }catch{
                    failure(NSError(domain: "RestApi#getDrinkDetailsBy", code: 1, userInfo: [
                        "code": response.response?.statusCode ?? "unknown",
                        "message": String(data: response.data ?? Data(), encoding: .utf8) ?? "unknown"
                    ]))
                }
            } else {
                failure(NSError(domain: "RestApi#getDrinkDetailsBy", code: 2, userInfo: [
                    "code": response.response?.statusCode ?? "unknown",
                    "message": String(data: response.data ?? Data(), encoding: .utf8) ?? "unknown"
                ]))
            }
            
        }
    }
    
    static func getDrinkImageBy(
        urlImage: String,
        success: @escaping (Data?) -> (),
        failure: @escaping (NSError) -> ()
    ) -> DataRequest {
        return AF.request(
            "\(urlImage)",
            method: .get)
        .response { response in
            if response.response?.statusCode == 200 {
                success(response.data)
            } else {
                failure(NSError(domain: "RestApi#getDrinkImageBy", code: 1, userInfo: [
                    "code": response.response?.statusCode ?? "unknown",
                    "message": String(data: response.data ?? Data(), encoding: .utf8) ?? "unknown"]))
            }
        }
    }
    
}

//
//  ViewController.swift
//  Find your taste
//
//  Created by Filip Kazmierczak on 24/02/2023.
//

import UIKit

class ResultVC: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class MainViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var helloText: UILabel!
    @IBOutlet weak var table: UITableView!
    let searchController = UISearchController()
    var listDrinks: [Drink] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSearchController()
        table.register(UINib(nibName: "DrinkCellV2", bundle: nil), forCellReuseIdentifier: "DrinkCellV2")
        self.showView()
        table.reloadData()
    }
    
    
    func initSearchController(){
        title = "Search drink"
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "e.g. vodka/gin/whiskey"
        navigationItem.hidesSearchBarWhenScrolling = false

    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        RestApi.searchDrinkBy(
            ingredient: text,
            success: { listDrinks in
                print("Jestem tutaj")
                self.listDrinks = listDrinks.drinks
                self.showView()
                self.table.reloadData()
            },
            failure: { error in
                print(error)
            })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDrinks.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCellV2", for: indexPath) as! DrinkViewCell
        cell.setData(drink: listDrinks[indexPath.row])
        cell.setImg(imgUrl: listDrinks[indexPath.row].image)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "DrinkDetailsView", bundle: nil).instantiateViewController(withIdentifier: "DrinkDetailsView") as! DrinkDetailsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.drinkId = listDrinks[indexPath.row].id
        navigationController?.pushViewController(vc, animated: true)

    }
    
    private func showView() {
        if listDrinks.isEmpty {
            table.visibility = .gone
            helloText.visibility = .visible
        } else {
            table.visibility = .visible
            helloText.visibility = .gone

        }
    }


}


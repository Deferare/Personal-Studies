//
//  ViewController.swift
//  Weather
//
//  Created by Deforeturn on 1/22/22.
//

import UIKit

class CountriesViewController: UIViewController, UITableViewDataSource {

    
    var countries = [Countrie]()
    let countrieIdenti = "countrieCell"
    
    @IBOutlet weak var countriesTable:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let dataAsset = NSDataAsset(name: "countries") else {return}
        let jsonDecoder = JSONDecoder()
        
        do{
            self.countries = try jsonDecoder.decode([Countrie].self, from: dataAsset.data)
        }catch{
            print(error.localizedDescription)
        }
        countriesTable.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countriesTable.dequeueReusableCell(withIdentifier: countrieIdenti, for: indexPath) as? CountrieTableViewCell
        let countrie = countries[indexPath.row]
        let imageCell = UIImage(named: "flag_\(countrie.assetName)")
        cell?.imageViewCell.image = imageCell
        cell?.labelCell.text = countrie.name
        return cell!
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let citysViewController = segue.destination as? CitysViewController else{return}
        citysViewController.countrieName = "CityInfomations/kr"
    }
    
}


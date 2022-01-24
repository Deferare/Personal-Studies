//
//  CitysViewController.swift
//  Weather
//
//  Created by Deforeturn on 1/22/22.
//

import UIKit

class CitysViewController: UIViewController, UITableViewDataSource {
    var citys = [City]()
    let cityKey = "cityCell"
    var countrieName:String!
    
    @IBOutlet weak var citysTableView:UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        guard let dataAsset = NSDataAsset(name: countrieName) else {return}
        let jsonDecoder = JSONDecoder()
        do{
            self.citys = try jsonDecoder.decode([City].self, from:dataAsset.data)
        }catch{
            print(error.localizedDescription)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        citysTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.citys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = citysTableView.dequeueReusableCell(withIdentifier: cityKey, for: indexPath) as? CityTableViewCell
        let city = citys[indexPath.row]
        print("@@@@@@@@@@@@@@@: ", city)
        cell?.nameCell.text = city.name
        cell?.sCCell.text = "\(city.state) | \(city.celsius)"
        cell?.rainfallProbability.text = String(city.rainfallProbability)

        return cell!
    }

}

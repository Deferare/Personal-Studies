//
//  ViewController.swift
//  MyFriends
//
//  Created by Deforeturn on 1/22/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var myTableView:UITableView?
    let cellIdentifier = "myCell"
    var friends = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "friends") else {return}
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        }catch{
            print(error.localizedDescription)
        }
        self.myTableView?.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView?.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let friend = self.friends[indexPath.row]
        cell?.textLabel?.text = friend.nameAndage
        cell?.detailTextLabel?.text = friend.fullAddress
        return cell!
    }
}


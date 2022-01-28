//
//  ViewController.swift
//  NetwolkingExample
//
//  Created by Deforeturn on 1/28/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    
    
    @IBOutlet weak var myTableView:UITableView!
    let cellIdenti = "cell"
    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url = URL(string: "https://randomuser.me/api/?results=1&inc=name,email,picture") else {return}
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url){ (data:Data?, response:URLResponse?, error:Error?) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else {return}
            do{
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                self.friends = apiResponse.result
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
            }catch(let err){
                print(err.localizedDescription)
            }
        }
        dataTask.resume()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: self.cellIdenti, for: indexPath)
        let friend = self.friends[indexPath.row]
        cell.textLabel!.text = friend.name.full
        cell.detailTextLabel?.text = friend.email
        cell.imageView?.image = nil
        DispatchQueue.global().async {
            guard let imageURL = URL(string: friend.picture.thumbnail) else {return}
            guard let imageData = try? Data(contentsOf: imageURL) else {return}
            
            DispatchQueue.main.async {
                if let index = tableView.indexPath(for: cell){
                    if index.row == indexPath.row{
                        cell.imageView?.image = UIImage(data: imageData)
                    }
                }
            }
            
        }
        
        return cell
    }
    

}


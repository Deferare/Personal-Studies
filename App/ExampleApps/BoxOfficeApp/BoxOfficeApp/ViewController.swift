//
//  ViewController.swift
//  BoxOfficeApp
//
//  Created by Deforeturn on 1/31/22.
//
//97073689aeedda975d8aee2000a6dd48
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let key = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=97073689aeedda975d8aee2000a6dd48&targetDt=20210101"
    var movieDatas:Any?
    var movies:Any?
    
    @IBOutlet weak var movieTable:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData(){
        guard let url = URL(string: key) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, respone, err) in
            if err != nil {
                print(print("Error - err"))
                return
            } else{
                guard let data = data else {
                    print("data")
                    return }
                do {
                    self.movieDatas = try JSONSerialization.jsonObject(with: data, options: [])
                } catch{
                    print("Error - Json to Array")
                    return
                }
                self.movieDatas = self.movieDatas as! Dictionary<String, Any>
            }
        }
        task.resume()
        movieTable.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


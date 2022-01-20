//
//  ViewController.swift
//  MyTableView
//
//  Created by Deforeturn on 1/20/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView:UITableView!
    let korean = ["가", "나", "다", "라", "마", "바", "아"]
    let english = ["A", "B", "C", "D", "E", "F", "G"]
    var datas:[Date] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let dateFormatter:DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .medium
        return f
    }()
    let timeFormatter:DateFormatter = {
        let f = DateFormatter()
        f.timeStyle = .medium
        return f
    }()
    
    @IBAction func touchUpAddButton(_ sender:UIButton){
        datas.append(Date())
        myTableView.reloadSections(IndexSet(2...2), with: .automatic)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return datas.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section < 2{
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            let text = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            cell.textLabel?.text = text
            return cell
        }else{
            let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as! CustomTableViewCell
            cell.leftLabel.text = self.dateFormatter.string(from: self.datas[indexPath.row])
            cell.rightLabel.text = self.timeFormatter.string(from: self.datas[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section < 2{
            return section == 0 ? "Korean" : "English"
        }
        return nil
    }
}


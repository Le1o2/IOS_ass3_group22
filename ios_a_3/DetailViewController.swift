//
//  DetailsViewController.swift
//  ios_a_3
//
//  Created by 侯竣昇 on 19/5/21.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var secretStore: UITableView!
    @IBOutlet weak var userName: UILabel!
    var recordArray = [(key:String, value:String)]()
    var recordDict:Dictionary<String,String>?
    var user:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = user
        recordDict = UserDefaults.standard.dictionary(forKey: user) as? Dictionary<String,String>
        //print(recordDict)
        if recordDict != nil{
            for (app, secret) in recordDict!{
                recordArray.append((key:app, value:secret))
            }
        }
        secretStore.dataSource = self
        secretStore.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "info") as! InfoTableViewCell
        cell.keyName.text = recordArray[indexPath.row].key
        cell.secret.text = recordArray[indexPath.row].value
        return cell
    }
    
    //tap the cell to edit use this func
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(recordArray[indexPath.row])
    }
    
    
    
    @IBAction func insert(_ sender: Any) {
        performSegue(withIdentifier: "insert", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "insert" {
            let vc = segue.destination as! RecordViewController
            vc.user = user
        }
    }
    @IBAction func clear(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: user)
        viewLoad()
    }
    
    func viewLoad(){
        userName.text = user
        recordDict = UserDefaults.standard.dictionary(forKey: user) as? Dictionary<String,String>
        //print(recordDict)
        if recordDict != nil{
            for (app, secret) in recordDict!{
                recordArray.append((key:app, value:secret))
            }
        }
        print(recordArray)
        print(recordArray.count)
        secretStore.dataSource = self
        secretStore.delegate = self
    }

}

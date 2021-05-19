//
//  RecordViewController.swift
//  ios_a_3
//
//  Created by 侯竣昇 on 19/5/21.
//

import UIKit

class RecordViewController: UIViewController {

    @IBOutlet weak var appName: UITextField!
    @IBOutlet weak var secret: UITextField!
    var app:String = ""
    var pwd:String = ""
    //var record = [(key:String,value:String)]()
    var record:Dictionary<String,String> = [:]
    var user:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        record = UserDefaults.standard.dictionary(forKey: user) as? Dictionary<String, String> ?? [:]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveRecord(_ sender: Any) {
        app = appName.text ?? ""
        pwd = secret.text ?? ""
        record[app] = pwd
        print(record)
        UserDefaults.standard.set(record, forKey: user)
        performSegue(withIdentifier: "backToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToDetail" {
            let vc = segue.destination as! DetailViewController
            vc.user = user
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

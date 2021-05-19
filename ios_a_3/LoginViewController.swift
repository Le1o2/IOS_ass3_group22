//
//  ViewController.swift
//  ios_a_3
//
//  Created by 侯竣昇 on 19/5/21.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    var loginEmail:String = ""
    var loginPwd:String = ""
    var userName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 4
        registerButton.layer.cornerRadius = 4
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        loginEmail = email.text ?? ""
        loginPwd = password.text ?? ""
        let result = UserDefaults.standard.stringArray(forKey: loginEmail)
        userName = result?[0] ?? ""
        print(userName)
        print(loginEmail)
        print(loginPwd)
        if result == nil {
            //TODO POP WRONG PASSWORD ALERT
        }else{
            performSegue(withIdentifier: "showDetail", sender: loginButton)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as! DetailViewController
            vc.user = userName
        }
    }

}


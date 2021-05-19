//
//  RegisterViewController.swift
//  ios_a_3
//
//  Created by 侯竣昇 on 19/5/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var loginEmail:String = ""
    var loginUser:String = ""
    var pwd:String = ""
    var confirmPwd:String = ""
    

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAlertController()
    }
    
    func showAlertController()
    {
        let alertController = UIAlertController(title: "系统提示",
                                                        message: "你输入错误",
                                                        preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
       
    }
    
    @IBAction func register(_ sender: Any) {
        loginEmail = email.text ?? ""
        loginUser = userName.text ?? ""
        pwd = password.text ?? ""
        confirmPwd = confirmPassword.text ?? ""
        if loginUser == "" || loginEmail == "" || pwd == "" || confirmPwd == ""{
            //TODO POP A ALERT
            showAlertController()

        }
        if confirmPwd != pwd {
            //TODO POP A ALERT
        }
        let userInfo = [loginUser,pwd]
        UserDefaults.standard.setValue(userInfo, forKey: loginEmail)
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

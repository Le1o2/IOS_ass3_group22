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
    }
    
    @IBAction func login(_ sender: Any) {
        loginEmail = email.text ?? ""
        loginPwd = password.text ?? ""
        if loginEmail.isEmpty {
            ToastUtil.toast(msg: "Email is empty!", that: self)
            return
        }
        if loginPwd.isEmpty {
            ToastUtil.toast(msg: "password is empty!", that: self)
            return
        }
        
        
        
        let result = UserDefaults.standard.stringArray(forKey: loginEmail)
        userName = result?[0] ?? ""
        print(userName)
        print(loginEmail)
        print(loginPwd)
        if result == nil {
            
            ToastUtil.toast(msg: "UserName is empty!", that: self)
        }else{
          
            let storyboard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil);
            let detailVC:DetailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            self.present(detailVC, animated: true, completion: nil)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as! DetailViewController
            vc.user = userName
        }
    }

}


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
    }
    
    
        
    @IBAction func register(_ sender: Any) {
        loginEmail = email.text ?? ""
        loginUser = userName.text ?? ""
        pwd = password.text ?? ""
        confirmPwd = confirmPassword.text ?? ""
        if loginUser == "" || loginEmail == "" || pwd == "" || confirmPwd == ""{
            ToastUtil.toast(msg: "loginUser or loginEmail or pwd is empty!", that: self)
          return
        }
        
        if confirmPwd != pwd {
            ToastUtil.toast(msg: "confirmPwd is not equal pwd empty!", that: self)
            return
        }
        
        let userInfo = [loginUser,pwd]
        UserDefaults.standard.setValue(userInfo, forKey: loginEmail)
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

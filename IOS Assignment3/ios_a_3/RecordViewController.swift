import UIKit

class RecordViewController: UIViewController {

    @IBOutlet weak var appName: UITextField!
    @IBOutlet weak var secret: UITextField!
    var app:String = ""
    var pwd:String = ""
    var record:Dictionary<String,String> = [:]
    var user:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        record = UserDefaults.standard.dictionary(forKey: user) as? Dictionary<String, String> ?? [:]
        
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
    

}

import UIKit
class ToastUtil: NSObject {
    
    class func toast(msg:String,that:UIViewController){
        let alertVC:UIAlertController = UIAlertController.init(title: "tip", message: msg, preferredStyle: .alert);
        let okAction:UIAlertAction = UIAlertAction.init(title: "ok", style: .default) { (action) in
            alertVC.dismiss(animated: true, completion: nil);
        };
        alertVC.addAction(okAction);
        that.present(alertVC, animated: true, completion: nil);
    }

}
   

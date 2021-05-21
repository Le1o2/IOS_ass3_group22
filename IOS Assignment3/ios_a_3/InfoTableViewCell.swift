import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var keyName: UILabel!
    @IBOutlet weak var secret: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

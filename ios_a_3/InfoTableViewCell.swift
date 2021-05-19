//
//  InfoTableViewCell.swift
//  ios_a_3
//
//  Created by 侯竣昇 on 19/5/21.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var keyName: UILabel!
    @IBOutlet weak var secret: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

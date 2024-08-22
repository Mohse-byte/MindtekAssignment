//
//  TableViewCell2.swift
//  AssignmentMindTeckMohseen
//
//  Created by Mohseen Shaikh on 21/08/24.
//

import UIKit

class TableViewCell2: UITableViewCell {
    @IBOutlet weak var tblListImg: UIImageView!
    @IBOutlet weak var tblListLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

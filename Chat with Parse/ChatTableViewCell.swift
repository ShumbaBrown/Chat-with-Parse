//
//  ChatTableViewCell.swift
//  Chat with Parse
//
//  Created by Shumba Brown on 2/23/17.
//  Copyright © 2017 Shumba Brown. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(message: String) {
        messageLabel.text = message
    }

}

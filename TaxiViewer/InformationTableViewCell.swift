//
//  InformationTableViewCell.swift
//  TaxiViewer
//
//  Created by Hosniya Wali on 16.11.20.
//

import UIKit

class InformationTableViewCell: UITableViewCell {

    @IBOutlet weak var gesamt: UILabel!
    @IBOutlet weak var besetzt: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

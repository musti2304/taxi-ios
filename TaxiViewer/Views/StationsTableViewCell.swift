//
//  StationsTableViewCell.swift
//  TaxiViewer
//
//  Created by Mustafa Yousef on 19.11.20.
//

import UIKit
class StationsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hpName: UILabel!
    @IBOutlet weak var auftraege: UILabel!
    @IBOutlet weak var einstiege: UILabel!
    @IBOutlet weak var wartezeit: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

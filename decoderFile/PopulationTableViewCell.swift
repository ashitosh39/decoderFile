//
//  PopulationTableViewCell.swift
//  decoderFile
//
//  Created by Macintosh on 17/02/24.
//

import UIKit

class PopulationTableViewCell: UITableViewCell {

    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var populationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

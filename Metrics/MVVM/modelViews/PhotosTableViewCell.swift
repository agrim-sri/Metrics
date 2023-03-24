//
//  PhotosTableViewCell.swift
//  Metrics
//
//  Created by Agrim Srivastava on 23/03/23.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    @IBOutlet var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

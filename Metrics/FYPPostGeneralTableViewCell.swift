//
//  FYPPostGeneralTableViewCell.swift
//  Metrics
//
//  Created by Agrim Srivastava on 25/02/23.
//

import UIKit

class FYPPostGeneralTableViewCell: UITableViewCell {

    @IBOutlet weak var postModelImageView: UIImageView!
    
    var post: Post! {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateUI() {
        //postModelImageView.image = post.image
    }
    
}

//
//  DetailNewsTableViewCell.swift
//  DRC_Practical_Test
//
//  Created by Chetan Desai on 02/11/20.
//  Copyright © 2020 Chetan Desai. All rights reserved.
//

import UIKit

// MARK: Create protocol for row data
protocol LinkCellDelegate: AnyObject {
    func btnNewsLinkTapped(cell: DetailNewsTableViewCell)
}

class DetailNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lbldescription: UILabel!
    @IBOutlet weak var lblauthor: UILabel!
    @IBOutlet weak var lblpublishedAt: UILabel!
    @IBOutlet weak var newImage: UIImageView!
    
    weak var delegate : LinkCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: Action method
    @IBAction func btnNewsLinkOpen(sender: AnyObject) {
        delegate?.btnNewsLinkTapped(cell: self)
    }

}

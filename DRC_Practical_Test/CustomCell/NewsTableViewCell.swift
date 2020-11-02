//
//  NewsTableViewCell.swift
//  DRC_Practical_Test
//
//  Created by Chetan Desai on 02/11/20.
//  Copyright © 2020 Chetan Desai. All rights reserved.
//

import UIKit

// MARK: Create protocol for row data
protocol RowCellDelegate: AnyObject {
    func btnPlushTapped(cell: NewsTableViewCell)
}

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthorName: UILabel!
    @IBOutlet weak var lblDate: UILabel!

    weak var delegate : RowCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: Action method
    @IBAction func btnPlusTapped(sender: AnyObject) {
        //delegate?.btnPlushTapped(cell: self)
    }

}

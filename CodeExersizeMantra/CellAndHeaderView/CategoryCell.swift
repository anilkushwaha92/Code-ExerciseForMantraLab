//
//  CategoryCell.swift
//  CodeExersizeMantra
//
//  Created by Anil on 15/03/21.
//

import UIKit

class CategoryCell: UITableViewCell {
    @IBOutlet weak var subCategoryNameLbl: UILabel!
    @IBOutlet weak var categoryDescLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayContent(item : sub_category) {
        subCategoryNameLbl.text = "\(item.name ?? "")".capitalizingFirstLetter()
        categoryDescLbl.text = "\(item.display_name ?? "")".capitalizingFirstLetter()
    }
    
}

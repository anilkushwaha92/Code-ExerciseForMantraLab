//
//  ExpandableHeaderView.swift
//  ExpandableView
//
//  Created by Agus Cahyono on 13/01/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit


protocol CatListHeaderViewDelegate {
    func catListOpenAndCloseSection(header: CatListHeaderView, section: Int)
}

class CatListHeaderView: UITableViewHeaderFooterView {

    var delegate: CatListHeaderViewDelegate?
    var section: Int!
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catTitleLbl: UILabel!
    @IBOutlet weak var arrowIcon: UIImageView!
    
    func common() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        catImageView.methodForRoundTheCircle(radious: catImageView.frame.size.height/2)
    }

    @objc func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer) {
        let cell = gestureRecognizer.view as! CatListHeaderView
        delegate?.catListOpenAndCloseSection(header: self, section: cell.section)
    }
    
    
    
    func customInit(title: String, section: Int, delegate: CatListHeaderViewDelegate){
        self.catTitleLbl?.text = title + "\(section)"
        self.section = section
        self.delegate = delegate
    }
    
    func CatListOpenArrow() {
        self.arrowIcon.image = UIImage(named: "up")
    }
    
    func CatlistCloseArrow() {
        self.arrowIcon.image = UIImage(named: "down")
    }
}

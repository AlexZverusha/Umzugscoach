//
//  ListTableViewCell.swift
//  Umzugscoach
//
//  Created by Alex on 26.10.17.
//  Copyright © 2017 Oleksandr Vashchenko. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var choiceButton: UIButton!
    @IBOutlet weak var bgView: UIView!
    
    var isChecked = false
    
    static var reuseIdentifier: String {
        return "ListTableViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.backgroundColor = CommonAppearance.bgColorListYableViewCell
    }
    
    internal func configureWithModel(model: ListCellModel) {
        titleTextLabel.text = model.title
        choiceButton.addBorderWithColor(CommonAppearance.borderButtonColor)
    }
    
    @IBAction func choiseButtonClicked(_ sender: Any) {
        isChecked = !isChecked
        if isChecked {
            choiceButton.setBackgroundImage(UIImage(named: CommonAppearance.uncheckTickImageName), for: .normal)
            bgView.backgroundColor = CommonAppearance.bgColorListYableViewCell
            return
        }
        choiceButton.setBackgroundImage(UIImage(named: CommonAppearance.checkTickImageName), for: .normal)
        bgView.backgroundColor = CommonAppearance.bgColorListYableViewCellCecked
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleTextLabel.text = ""
        isChecked = false
        bgView.backgroundColor = CommonAppearance.bgColorListYableViewCell
    }
    
}

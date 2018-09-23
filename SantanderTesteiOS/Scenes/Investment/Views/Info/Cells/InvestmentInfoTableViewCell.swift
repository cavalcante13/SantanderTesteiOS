//
//  InvestmentInfoTableViewCell.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

class InvestmentInfoTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel : UILabel!
    @IBOutlet private weak var dataLabel : UILabel!

    private var info : FundInfo!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func set(info : FundInfo) {
        self.info = info
        self.setupInterface()
    }
    
    private func setupInterface() {
        self.nameLabel.text = self.info.name
        self.dataLabel.text = self.info.data
    }
}

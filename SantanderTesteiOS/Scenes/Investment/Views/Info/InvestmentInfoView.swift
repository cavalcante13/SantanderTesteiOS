//
//  InvestmentInfoView.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

class InvestmentInfoView: UIView {
    @IBOutlet private weak var tableView : UITableView!
    
    private var infos : [FundInfo] = []
    
    
    init() {
        super.init(frame: .zero)
        self.xib()
        self.prepareLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareLayout()
    }
    
    private func prepareLayout() {
        tableView.delegate        = self
        tableView.dataSource      = self
        tableView.isScrollEnabled = false
        tableView.rowHeight       = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle  = .none
        tableView.tableFooterView = UIView()
        tableView.register(class: InvestmentInfoTableViewCell.self)
    }
    
    func set(infos : [FundInfo]) {
        self.infos = infos
        self.tableView.reloadData()
        
        self.layoutIfNeeded()
        self.frame.size.height = tableView.contentSize.height
        self.invalidateIntrinsicContentSize()
    }
}

extension InvestmentInfoView : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: InvestmentInfoTableViewCell.self, indexPath: indexPath)
        
        cell.set(info: infos[indexPath.item])
        
        return cell
    }
}

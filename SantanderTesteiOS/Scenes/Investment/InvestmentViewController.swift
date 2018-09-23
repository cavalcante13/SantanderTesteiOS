//
//  InvestmentViewController.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

protocol InvestmentDisplayScreen : class {
    func displayScreen(viewModel : InvestmentModels.Screen.ViewModel)
}

class InvestmentViewController: LayoutVerticalViewController, InvestmentDisplayScreen {
    private var titleView       : SantanderLabelView = SantanderLabelView(fontSize: 16, textColor : #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1))
    private var fundView        : SantanderLabelView = SantanderLabelView(fontSize: 32, textColor:  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    private var whatIsView      : SantanderLabelView = SantanderLabelView(fontSize: 20, textColor : #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1))
    private var definitionView  : SantanderLabelView = SantanderLabelView(fontSize: 16, textColor : #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1))
    private var riskTitleView   : SantanderLabelView = SantanderLabelView(fontSize: 20, textColor : #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1))
    private var infoTitleView   : SantanderLabelView = SantanderLabelView(fontSize: 20, textColor:  #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1))
    
    private var moreInfoView    : InvestmentFundMoreInfoView = InvestmentFundMoreInfoView()
    private var infoView        : InvestmentInfoView = InvestmentInfoView()
    
    private var line : UIView {
        return self.lineView(UIColor.groupTableViewBackground, 1)
    }
    
    private var interactor : InvestmentInteractor?
    
    
    override var subviews: [UIView] {
        return [titleView, fundView, line, whatIsView, definitionView, riskTitleView, infoTitleView, moreInfoView, line, infoView]
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.interactor = InvestmentInteractor()
        self.interactor?.presenter?.viewController = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doLoadScreen()
    }
    
    private func doLoadScreen() {
        self.interactor?.doLoadScreenInfo()
    }
    
    func displayScreen(viewModel: InvestmentModels.Screen.ViewModel) {
        titleView.set(text: viewModel.screenModel.screen.title)
        fundView.set(text: viewModel.screenModel.screen.fundName)
        whatIsView.set(text: viewModel.screenModel.screen.whatIs)
        definitionView.set(text: viewModel.screenModel.screen.definition)
        riskTitleView.set(text: viewModel.screenModel.screen.riskTitle)
        infoTitleView.set(text: viewModel.screenModel.screen.infoTitle)
        
        moreInfoView.set(fund: viewModel.screenModel.screen.moreInfo?.month)
        moreInfoView.set(fund: viewModel.screenModel.screen.moreInfo?.year)
        moreInfoView.set(fund: viewModel.screenModel.screen.moreInfo?.twelveMonths)
        
        infoView.set(infos: viewModel.screenModel.screen.info)
    }
}

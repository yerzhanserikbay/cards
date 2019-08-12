//
//  ScrollView.swift
//  MemCards
//
//  Created by YS on 8/12/19.
//  Copyright © 2019 YS. All rights reserved.
//

import UIKit

class ScrollView: UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let cardView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cardView.backgroundColor = .green
        self.addSubview(cardView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

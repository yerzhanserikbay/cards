//
//  CustomButton.swift
//  MemCards
//
//  Created by YS on 8/12/19.
//  Copyright © 2019 YS. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 25
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 250).isActive = true;
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

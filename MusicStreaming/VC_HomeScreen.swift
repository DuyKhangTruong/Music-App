//
//  VC_HomeScreen.swift
//  MusicStreaming
//
//  Created by Nguyen Truong Duy Khang on 10/26/20.
//

import UIKit

class VC_HomeScreen: UIViewController {
    let homeLable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#1c223d")
        
        homeLable.text = "Home"
        homeLable.textColor = .white
        homeLable.font = homeLable.font.withSize(34)
        view.addSubview(homeLable)
        homeLable.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(14)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
    
}

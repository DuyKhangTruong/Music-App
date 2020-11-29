//
//  VC_HomeScreen.swift
//  MusicStreaming
//
//  Created by Nguyen Truong Duy Khang on 10/26/20.
//

import UIKit

class VC_HomeScreen: UICollectionViewController {
    let homeLable       =   UILabel()
    let homeTableView   =   UITableView()
    let homeTabBar      =   UITabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        homeTableView.delegate = self
//        homeTableView.dataSource = self
        
        collectionView.backgroundColor = UIColor(hexString: "#000000")
        collectionView.addSubview(homeLable)
        homeLable.text = "Home"
        homeLable.textColor = .white
        homeLable.font = homeLable.font.withSize(34)
        collectionView.addSubview(homeLable)
        homeLable.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(14)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
    
}
//extension VC_HomeScreen: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//}

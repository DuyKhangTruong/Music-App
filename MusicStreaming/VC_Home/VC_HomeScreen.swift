//
//  VC_HomeScreen.swift
//  MusicStreaming
//
//  Created by Nguyen Truong Duy Khang on 10/26/20.
//

import UIKit
import SnapKit
import iCarousel
class VC_HomeScreen: UIViewController {
    private let mainScrollView: UIScrollView = {
        let mainScrollView = UIScrollView(frame: UIScreen.main.bounds)
        mainScrollView.backgroundColor = .black
        mainScrollView.isScrollEnabled = true
        return mainScrollView
    } ()
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.textColor = .white
        label.font = label.font.withSize(26)
        return label
    }()
    
    private let carousel: iCarousel  = {
        let carousel = iCarousel()
        carousel.type = .rotary
        carousel.largeContentTitle = "New Releases"
        return carousel
    }()
    
    
    private var collectionView : UICollectionView?
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carousel.delegate = self
        carousel.dataSource = self
        
        
        view.addSubview(mainScrollView)
        
        mainScrollView.addSubview(label)
        mainScrollView.addSubview(carousel)
        
        
        carousel.frame = CGRect(x: 0, y: 127, width: mainScrollView.frame.width, height: 310)
        mainScrollView.snp.makeConstraints { (make) in
            make.width.top.bottom.left.right.equalToSuperview()
            
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40)
            make.width.equalTo(73)
            make.height.equalTo(30)
        }
        
        let dailyLabel = UILabel()
        dailyLabel.text = "Daily Charts"
        dailyLabel.textColor = .white
        mainScrollView.addSubview(dailyLabel)
        dailyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(carousel.snp.bottom).offset(40)
            make.left.width.equalToSuperview()
        }
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.backgroundColor = .white
        mainScrollView.addSubview(collectionView!)
        collectionView?.snp.makeConstraints { (make) in

            make.height.equalTo(300)
            make.centerX.width.bottom.equalToSuperview()
            make.top.equalTo(dailyLabel.snp.bottom).offset(10)
        }
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}
extension VC_HomeScreen: iCarouselDelegate, iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        4
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 310 , height: 310))
        view.backgroundColor = .red
        return view
        
    }
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        self.navigationController?.pushViewController(VC_songList(), animated: true)
    }
    
    
}

extension VC_HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .yellow
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = mainScrollView.frame.width
        let height = CGFloat(300)
        
        return CGSize(width: width, height: height)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    
}



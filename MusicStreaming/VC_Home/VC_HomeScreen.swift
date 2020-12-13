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
    private let homeLabel: UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.textColor = .white
        label.font = label.font.withSize(26)
        return label
    }()
    
    private let dailyLabel: UILabel = {
        let dailyLabel = UILabel()
        dailyLabel.text = "Daily Charts"
        dailyLabel.textColor = .white
        dailyLabel.font = dailyLabel.font.withSize(18)
        return dailyLabel
    }()
    
    private let recentlyLabel: UILabel = {
        let recentlyLabel = UILabel()
        recentlyLabel.text = "Recently Played"
        recentlyLabel.textColor = .white
        recentlyLabel.font = recentlyLabel.font.withSize(18)
        return recentlyLabel
    }()
    
    private let popularLabel: UILabel = {
        let popularLabel = UILabel()
        popularLabel.text = "Popular"
        popularLabel.textColor = .white
        popularLabel.font = popularLabel.font.withSize(18)
        return popularLabel
    }()
    
    
    
    
    private let carousel: iCarousel  = {
        let carousel = iCarousel()
        carousel.type = .rotary
        carousel.largeContentTitle = "New Releases"
        return carousel
    }()
    
    
    
    
    private var dailyCollectionView : UICollectionView?
    private let dailyCellId = "dailyCellId"
    
    private var recentlyPlayedCollectionView: UICollectionView?
    private let recentlyCellId = "recentlyCellId"
    
    private var popularCollectionView: UICollectionView?
    private let popularCellID = "popularCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carousel.delegate = self
        carousel.dataSource = self
        
        
        view.addSubview(mainScrollView)
        
        mainScrollView.addSubview(homeLabel)
        mainScrollView.addSubview(carousel)
        mainScrollView.addSubview(dailyLabel)
        mainScrollView.addSubview(recentlyLabel)
        mainScrollView.addSubview(popularLabel)
        
        carousel.frame = CGRect(x: 0, y: 127, width: mainScrollView.frame.width, height: 310)
        mainScrollView.snp.makeConstraints { (make) in
            make.width.top.bottom.left.right.equalToSuperview()
            
        }
        
        homeLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40)
            make.width.equalTo(73)
            make.height.equalTo(30)
        }
        
        
        
        dailyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(carousel.snp.bottom).offset(40)
            make.left.width.equalToSuperview()
        }
        
        
        
        recentlyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(carousel.snp.bottom).offset(273)
            make.left.width.equalToSuperview()
        }
        
        
        
        popularLabel.snp.makeConstraints { (make) in
            make.top.equalTo(carousel.snp.bottom).offset(451)
            make.left.width.equalToSuperview()
        }
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        dailyCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        dailyCollectionView?.dataSource = self
        dailyCollectionView?.delegate = self
        dailyCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: dailyCellId)
        dailyCollectionView?.backgroundColor = .white
        mainScrollView.addSubview(dailyCollectionView!)
        dailyCollectionView?.reloadData()
        dailyCollectionView?.snp.makeConstraints { (make) in
            
            make.height.equalTo(300)
            make.centerX.width.bottom.equalToSuperview()
            make.top.equalTo(dailyLabel.snp.bottom).offset(10)
        }
        
        recentlyPlayedCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        recentlyPlayedCollectionView?.dataSource = self
        recentlyPlayedCollectionView?.delegate = self
        recentlyPlayedCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: recentlyCellId)
        recentlyPlayedCollectionView?.backgroundColor = .white
        mainScrollView.addSubview(recentlyPlayedCollectionView!)
        recentlyPlayedCollectionView?.reloadData()
        recentlyPlayedCollectionView?.snp.makeConstraints { (make) in
            make.height.equalTo(300)
            make.centerX.width.bottom.equalToSuperview()
            make.top.equalTo(recentlyLabel.snp.bottom).offset(10)
        }
        
        popularCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        popularCollectionView?.dataSource = self
        popularCollectionView?.delegate = self
        popularCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: popularCellID)
        popularCollectionView?.backgroundColor = .white
        mainScrollView.addSubview(popularCollectionView!)
        popularCollectionView?.reloadData()
        popularCollectionView?.snp.makeConstraints { (make) in
            
            make.height.equalTo(300)
            make.centerX.width.bottom.equalToSuperview()
            make.top.equalTo(popularLabel.snp.bottom).offset(10)
        }
        
        dailyCollectionView?.tag = 1
        recentlyPlayedCollectionView?.tag = 2
        popularCollectionView?.tag = 3
        
        
        
        
        
        
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
        if (collectionView.tag == 1) {
            return 6
        }
        else if (collectionView.tag == 2) {
            return 30
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView.tag == 1) {
            let dailyCell = dailyCollectionView?.dequeueReusableCell(withReuseIdentifier: dailyCellId, for: indexPath)
            dailyCell?.backgroundColor = .yellow
            return dailyCell!
            
        }
        
        else if (collectionView.tag == 2) {
            let recentlyCell = recentlyPlayedCollectionView?.dequeueReusableCell(withReuseIdentifier: recentlyCellId, for: indexPath)
            recentlyCell?.backgroundColor = .blue
            return recentlyCell!
            }
        
        else {
                let popularCell = popularCollectionView?.dequeueReusableCell(withReuseIdentifier: popularCellID, for: indexPath)
                popularCell?.backgroundColor = .green
                return popularCell!
            }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView.tag == 1) {
        let width = mainScrollView.frame.width
        let height = CGFloat(300)
        
        return CGSize(width: width, height: height)
        }
        else if (collectionView.tag == 2) {
            let width = mainScrollView.frame.width
            let height = CGFloat(300)
            
            return CGSize(width: width, height: height)
        }
        else {
            let width = mainScrollView.frame.width
            let height = CGFloat(300)
            
            return CGSize(width: width, height: height)
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    
}



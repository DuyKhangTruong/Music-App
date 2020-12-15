//
//  SongCell.swift
//  MusicStreaming
//
//  Created by Thao Vu on 12/13/20.
//

import UIKit
import SnapKit

class SongCell: UITableViewCell {

    private let  songImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 16, y: 10, width: 50, height: 50)
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        
        return imageView
    }()
    
    var favoriteImageView   =  UIImageView()
    
    private let songTitleLabel  : UILabel = {
        let songTitle               = UILabel()
        songTitle.textColor         = .white
        songTitle.font              = UIFont(name: "Circular-Medium", size: 14.0)
        
        return songTitle
        
    }()
    var artistTitleLabel    = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        addSubview(songImageView)
        addSubview(songTitleLabel)
        setImageConstraints()
        setSongTitleLabelConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(song: Song){
        songImageView.image     = song.image
        songTitleLabel.text     = song.songTitle
        artistTitleLabel.text   = song.artistName
    }
    
    func setImageConstraints(){
    }
    
    
    func setSongTitleLabelConstraints(){
        songTitleLabel.numberOfLines = 0
        songTitleLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(19)
            make.left.equalTo(76)
            make.right.equalTo(96)
        }
    }
}

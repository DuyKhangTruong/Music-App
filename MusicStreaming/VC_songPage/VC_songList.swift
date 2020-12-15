//
//  VC_songList.swift
//  MusicStreaming
//
//  Created by Nguyen Truong Duy Khang on 11/29/20.
//
//Library

import UIKit
import SnapKit


class VC_songList: UIViewController  {
    
    var songList = UITableView()
    var songs: [Song] = []
    struct Cells {
        static let songCell = "songCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Songs"
        view.backgroundColor = .black
        songs = fetchData()
        configureSongs()
        
    
    }
    
    // MARK:  NavigationBar Customize
    func customNavigationBar(){
        
    }
    
    
    // MARK:  Song Configuration
    func configureSongs() {
        view.addSubview(songList)
        setTableViewDelegates()
        songList.register(SongCell.self, forCellReuseIdentifier: Cells.songCell)
        songList.rowHeight = 70
        songList.backgroundColor = .black
        songList.snp.makeConstraints{ (make) in
            make.width.equalToSuperview()
            make.height.equalTo(734)
            make.top.equalToSuperview().offset(84)
            
        }

    }
    
    func setTableViewDelegates(){
        songList.delegate = self
        songList.dataSource = self
    }
}

extension VC_songList: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.songCell) as! SongCell
        let song = songs[indexPath.row]
        cell.set(song: song)
        return cell
    }
}

extension VC_songList {
    func fetchData() -> [Song] {
        let song1 = Song(image: Images.hollywoodBleeding , songTitle: "Circles", artistName: "Post Malone")
        let song2 = Song(image: Images.hollywoodBleeding , songTitle: "Die For Me(Ft. Future & Hailey)", artistName: "Post Malone")
        let song3 = Song(image: Images.hollywoodBleeding , songTitle: "On The Road", artistName: "Post Malone")
        let song4 = Song(image: Images.hollywoodBleeding , songTitle: "Sunflower", artistName: "Post Malone")
        let song5 = Song(image: Images.hollywoodBleeding , songTitle: "Goodbyes", artistName: "Post Malone")
        let song6 = Song(image: Images.hollywoodBleeding , songTitle: "Circles", artistName: "Post Malone")
        let song7 = Song(image: Images.hollywoodBleeding , songTitle: "Die For Me(Ft. Future & Hailey)", artistName: "Post Malone")
        let song8 = Song(image: Images.hollywoodBleeding , songTitle: "On The Road", artistName: "Post Malone")
        let song9 = Song(image: Images.hollywoodBleeding , songTitle: "Sunflower", artistName: "Post Malone")
        let song10 = Song(image: Images.hollywoodBleeding , songTitle: "Goodbyes", artistName: "Post Malone")
        
        return [song1, song2, song3, song4, song5, song6, song7, song8, song9, song10]
    }
}

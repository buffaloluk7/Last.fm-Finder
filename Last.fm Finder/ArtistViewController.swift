//
//  ArtistViewController.swift
//  Last.fm Finder
//
//  Created by Lukas Streiter on 12/11/14.
//  Copyright (c) 2014 Lukas Streiter. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController, GetTopAlbumDelegate {
    
    var lastFmApi: LastFmApi = LastFmApi()
    var searchQuery: String = ""
    
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var albumPlayCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Use a semicolon if there is code above the closure to prevent a compiler error.
        //{ self.getArtist() } ~> { self.updateUI($0) }
        
        getAndShowArtist()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAndShowArtist() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            self.lastFmApi.getTopAlbum(self.searchQuery, delegate: self)
        }
    }
    
    func success(album: Album?) {
        self.title = self.searchQuery
        self.artistName.text = self.searchQuery
        
        if let topAlbum = album {
            self.albumName.text = topAlbum.name
            self.albumPlayCount.text = String(topAlbum.playCount!)
        }
    }
    
    func failure(error: NSError) {
        println("error")
    }
    
}
//
//  ArtistViewController.swift
//  Last.fm Finder
//
//  Created by Lukas Streiter on 12/11/14.
//  Copyright (c) 2014 Lukas Streiter. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController {
    
    var lastFmApi: LastFmApi = LastFmApi()
    var searchQuery: String = ""
    
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var playCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();

        // Use a semicolon if there is code above the closure to prevent a compiler error.
        { self.getArtist() } ~> { self.updateUI($0) }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getArtist() -> Artist {
        return self.lastFmApi.getTopAlbum(self.searchQuery)
    }
    
    func updateUI(artist: Artist) {
        self.title = artist.name
        self.artistName.text = artist.name
        
        if let topAlbum = artist.topAlbums.first {
            self.playCount.text = String(topAlbum.playcount)
        }
    }
    
}
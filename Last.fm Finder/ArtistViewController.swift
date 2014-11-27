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
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Empty all labels
        self.title = "Top album"
        self.artistName.text = ""
        self.albumName.text = ""
        self.albumPlayCount.text = ""
        self.errorMessage.text = ""

        // Use a semicolon if there is code above the closure to prevent a compiler error.
        //{ self.getArtist() } ~> { self.updateUI($0) }
        self.getAndShowArtist()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getAndShowArtist() {
        self.loadingView.startAnimating()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            self.lastFmApi.getTopAlbum(self.searchQuery, delegate: self)
        }
    }
    
    func success(artist: Artist) {
        dispatch_async(dispatch_get_main_queue()) {
            self.loadingView.stopAnimating()
            
            self.artistName.text = artist.name
        
            if let topAlbum = artist.albums?.first {
                self.albumName.text = topAlbum.name
                self.albumPlayCount.text = "\(topAlbum.playCount!) times played"
            } else {
                self.errorMessage.text = "No albums available."
            }
        }
    }
    
    func failure(error: NSError) {
        dispatch_async(dispatch_get_main_queue()) {
            self.errorMessage.text = "Unable to retrieve data."
            self.loadingView.stopAnimating()
        }
    }
    
}
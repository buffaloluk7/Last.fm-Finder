//
//  ArtistViewController.swift
//  Last.fm Finder
//
//  Created by Lukas Streiter on 12/11/14.
//  Copyright (c) 2014 Lukas Streiter. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController {
    
    var searchQuery: String = ""
    
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var playCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = searchQuery
        self.artistName.text = searchQuery;
        
        // start last.fm request in background task
        // process response
        // fill ui with data
        
        // Use a semicolon if there is code above the closure to prevent a compiler error.
        { self.getPlayCount() } ~> { self.updateUI($0) }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getPlayCount() -> Int {
        return 5
    }
    
    func updateUI(playCount: Int) {
        self.playCount.text = String(playCount)
    }
    
}
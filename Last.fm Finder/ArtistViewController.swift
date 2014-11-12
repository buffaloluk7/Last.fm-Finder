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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.artistName.text = searchQuery
        // start last.fm request in background task
        // process response
        // fill ui with data
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
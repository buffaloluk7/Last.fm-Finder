//
//  Album.swift
//  Last.fm Finder
//
//  Created by Lukas Streiter on 13/11/14.
//  Copyright (c) 2014 Lukas Streiter. All rights reserved.
//

import Foundation

class Album {
    
    var name: String = ""
    var playcount: Int = 0
    
    init() {}
    
    init(name: String, playcount: Int) {
        self.name = name
        self.playcount = playcount
    }
    
}
//
//  Artist.swift
//  Last.fm Finder
//
//  Created by Lukas Streiter on 13/11/14.
//  Copyright (c) 2014 Lukas Streiter. All rights reserved.
//

import Foundation

class Artist {
    
    var name: String = ""
    var topAlbums: [Album] = []
    
    init() {}
    
    init(name: String, topAlbums: [Album]) {
        self.name = name
        self.topAlbums = topAlbums
    }
    
}
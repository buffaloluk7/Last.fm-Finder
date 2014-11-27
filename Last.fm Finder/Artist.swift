//
//  Artist.swift
//  Last.fm Finder
//
//  Created by Lukas Streiter on 13/11/14.
//  Copyright (c) 2014 Lukas Streiter. All rights reserved.
//

import Foundation
import JSONJoy

class Artist: JSONJoy {
    
    var name: String?
    var albums: [Album]?
    
    init() {}
    
    required init(_ decoder: JSONDecoder) {
        self.name = decoder["topalbums"]["@attr"]["artist"].string
        if let topAlbums = decoder["topalbums"]["album"].array {
            self.albums = [Album]()
            for albumDecoder in topAlbums {
                self.albums?.append(Album(albumDecoder))
            }
        }
    }
    
    init(name: String, albums: [Album]) {
        self.name = name
        self.albums = albums
    }
    
}
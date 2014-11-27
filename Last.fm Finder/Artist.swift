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
        self.albums = [Album]()
        
        if let topAlbums = decoder["topalbums"]["album"].array {
            for albumDecoder in topAlbums {
                self.albums?.append(Album(albumDecoder))
            }
        } else {
            // Parse single album, may fail
            let album = Album(decoder["topalbums"]["album"])
            if album.name != nil && album.playCount != nil {
                self.albums?.append(album)
            }
        }
    }
    
    init(name: String, albums: [Album]) {
        self.name = name
        self.albums = albums
    }
    
}
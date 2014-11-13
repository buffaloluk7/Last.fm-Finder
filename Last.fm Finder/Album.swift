//
//  Album.swift
//  Last.fm Finder
//
//  Created by Lukas Streiter on 13/11/14.
//  Copyright (c) 2014 Lukas Streiter. All rights reserved.
//

import Foundation
import JSONJoy

class Album: JSONJoy {
    
    var name: String?
    var playCount: Int?
    
    init() {}
    
    required init(_ decoder: JSONDecoder) {
        self.name = decoder["name"].string
        self.playCount = decoder["playcount"].string?.toInt()
    }
    
    init(name: String, playCount: Int) {
        self.name = name
        self.playCount = playCount
    }
    
}
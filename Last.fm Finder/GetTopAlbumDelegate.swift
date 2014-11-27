//
//  GetTopAlbumDelegate.swift
//  Last.fm Finder
//
//  Created by Lukas Streiter on 13/11/14.
//  Copyright (c) 2014 Lukas Streiter. All rights reserved.
//

import Foundation

protocol GetTopAlbumDelegate {
    
    func success(artist: Artist)
    func failure(error: NSError)
    
}
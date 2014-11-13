//
//  LastFmApi.swift
//  Last.fm Finder
//
//  Created by Lukas Streiter on 13/11/14.
//  Copyright (c) 2014 Lukas Streiter. All rights reserved.
//

import Foundation

class LastFmApi {
    
    let responseFormat: String
    let apiKey: String
    let apiUrl: String
    
    init() {
        self.responseFormat = "json"
        self.apiKey = "a65d06953de344d726c8f5a324f2aaad"
        self.apiUrl = "http://ws.audioscrobbler.com/2.0/?api_key=\(self.apiKey)&format=\(self.responseFormat)"
    }
    
    func getTopAlbum(artistName: String) -> Artist {
        let artist = Artist()
        artist.name = artistName
        artist.topAlbums = [Album(name: "Michael Jackson Album 1", playcount: 10)]
        
        // Execute request
        self.execute("artist=" + artistName)
        
        return artist
    }
    
    func execute(path: String) {
        let urlString: String = self.apiUrl + "&" + path.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
        let url = NSURL(string: urlString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()
    }
    
}
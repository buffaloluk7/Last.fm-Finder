//
//  LastFmApi.swift
//  Last.fm Finder
//
//  Created by Lukas Streiter on 13/11/14.
//  Copyright (c) 2014 Lukas Streiter. All rights reserved.
//

import Foundation
import SwiftHTTP
import JSONJoy

class LastFmApi {

    let apiURL: String
    let apiParameters: [String: String] = [:]
    
    init() {
        self.apiURL = "http://ws.audioscrobbler.com/2.0"
        self.apiParameters["api_key"] = "a65d06953de344d726c8f5a324f2aaad"
        self.apiParameters["format"] = "json"
    }
    
    func getTopAlbum(artistName: String, delegate: GetTopAlbumDelegate) {
        // Create request object
        let request = HTTPTask()
        request.requestSerializer = HTTPRequestSerializer()
        request.responseSerializer = JSONResponseSerializer()
        
        // Append parameters
        var parameters = self.apiParameters
        parameters["method"] = LastFmMethod.TopAlbums.rawValue as String
        parameters["artist"] = artistName
        
        // Execute request
        request.GET(self.apiURL, parameters: parameters, success: {(response: HTTPResponse) in
                if response.responseObject != nil {
                    let artist = Artist(JSONDecoder(response.responseObject!))
                    delegate.success(artist.albums?.first)
                }
            }, failure: {(error: NSError, response: HTTPResponse?) in
                delegate.failure(error)
                println("error: \(error)")
        })
    }
    
}
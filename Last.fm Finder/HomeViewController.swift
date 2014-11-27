//
//  HomeViewController.swift
//  Last.fm Finder
//
//  Created by Lukas Streiter on 12/11/14.
//  Copyright (c) 2014 Lukas Streiter. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "searchSegue" {
            let viewController = segue.destinationViewController as ArtistViewController
            viewController.searchQuery = self.searchBar.text
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if identifier == "searchSegue" && self.searchBar.text.isEmpty {
            return false
        }
        return true
    }
    
}
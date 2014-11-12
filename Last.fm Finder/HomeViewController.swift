//
//  HomeViewController.swift
//  Last.fm Finder
//
//  Created by Lukas Streiter on 12/11/14.
//  Copyright (c) 2014 Lukas Streiter. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func searchArtist() {
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("ArtistViewController") as ArtistViewController
        viewController.searchQuery = self.searchBar.text
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
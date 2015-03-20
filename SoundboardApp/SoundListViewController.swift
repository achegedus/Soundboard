//
//  SoundListViewController.swift
//  SoundboardApp
//
//  Created by Adam Hegedus on 3/20/15.
//  Copyright (c) 2015 Adam Hegedus. All rights reserved.
//

import UIKit
import AVFoundation

class SoundListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel!.text = "Hello"
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var soundPath = NSBundle.mainBundle().pathForResource("TestSound", ofType: "m4a")
        var soundURL = NSURL.fileURLWithPath(soundPath!)
        
        self.audioPlayer = AVAudioPlayer(contentsOfURL: soundURL, error: nil)
        self.audioPlayer.play()
    }


}


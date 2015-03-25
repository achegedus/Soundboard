//
//  NewSoundViewController.swift
//  SoundboardApp
//
//  Created by Adam Hegedus on 3/25/15.
//  Copyright (c) 2015 Adam Hegedus. All rights reserved.
//

import UIKit

class NewSoundViewController : UIViewController {
    
    @IBOutlet weak var soundName: UITextField!
    
    var previousSoundListViewController = SoundListViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Go
        
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func saveTapped(sender: AnyObject) {
        // create a sound object
        var sound = Sound()
        sound.name = self.soundName.text
        
        // add sound to sound array
        self.previousSoundListViewController.sounds.append(sound)
        
        // dismiss view controller
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

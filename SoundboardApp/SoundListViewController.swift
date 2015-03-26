//
//  SoundListViewController.swift
//  SoundboardApp
//
//  Created by Adam Hegedus on 3/20/15.
//  Copyright (c) 2015 Adam Hegedus. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData

class SoundListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var audioPlayer = AVAudioPlayer()
    
    var sounds: [Sound] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        var soundPath = NSBundle.mainBundle().pathForResource("TestSound", ofType: "m4a")
        var soundURL = NSURL.fileURLWithPath(soundPath!)
        
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        var sound1 = NSEntityDescription.insertNewObjectForEntityForName("Sound", inManagedObjectContext: context) as Sound
        sound1.name = "My Sound"
        sound1.url = soundURL!.absoluteString!
        
        context.save(nil)
        
        var request = NSFetchRequest(entityName: "Sound")
        
        self.sounds = context.executeFetchRequest(request, error: nil)! as [Sound]
        
//        var sound1 = Sound()
//        sound1.name = "Blah Blah"
//        sound1.URL = soundURL!
//        self.sounds.append(sound1)
//        
//        var sound2 = Sound()
//        sound2.name = "Turn down for what?"
//        sound2.URL = soundURL!
//        self.sounds.append(sound2)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sounds.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        var sound = self.sounds[indexPath.row]
        cell.textLabel!.text = sound.name
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var newSoundViewController = segue.destinationViewController as NewSoundViewController
        newSoundViewController.previousSoundListViewController = self
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var sound = self.sounds[indexPath.row]
        
//        self.audioPlayer = AVAudioPlayer(contentsOfURL: sound.URL, error: nil)
        self.audioPlayer.play()
    }


}


//
//  NewSoundViewController.swift
//  SoundboardApp
//
//  Created by Adam Hegedus on 3/25/15.
//  Copyright (c) 2015 Adam Hegedus. All rights reserved.
//

import UIKit
import AVFoundation

class NewSoundViewController : UIViewController {
    

    required init(coder aDecoder: NSCoder) {
        var baseString : String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String
        
        var pathComponents = [baseString, "MyAudio.m4a"]
        
        self.audioURL = NSURL.fileURLWithPathComponents(pathComponents)!
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        var recordSettings: [NSObject : AnyObject] = Dictionary()
        recordSettings[AVFormatIDKey] = kAudioFormatMPEG4AAC
        recordSettings[AVSampleRateKey] = 44100.0
        recordSettings[AVNumberOfChannelsKey] = 2
        
        self.audioRecorder = AVAudioRecorder(URL: audioURL, settings: recordSettings, error: nil)
        self.audioRecorder.meteringEnabled = true
        self.audioRecorder.prepareToRecord()
        
        // super init is below
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var soundName: UITextField!
    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder : AVAudioRecorder
    var audioURL : NSURL
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
//        sound.URL = self.audioURL
        
        // add sound to sound array
        self.previousSoundListViewController.sounds.append(sound)
        
        // dismiss view controller
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func recordTapped(sender: AnyObject) {
        if self.audioRecorder.recording {
            self.audioRecorder.stop()
            
            self.recordButton.setTitle("RECORD", forState: UIControlState.Normal)
            
        } else {
            var session = AVAudioSession.sharedInstance()
            session.setActive(true, error: nil)
            self.audioRecorder.record()
            
            self.recordButton.setTitle("FINISH RECORDING", forState: UIControlState.Normal)
        }
    }
}

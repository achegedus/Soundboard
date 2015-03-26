//
//  Sound.swift
//  SoundboardApp
//
//  Created by Adam Hegedus on 3/26/15.
//  Copyright (c) 2015 Adam Hegedus. All rights reserved.
//

import Foundation
import CoreData

class Sound: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var url: String
    
}

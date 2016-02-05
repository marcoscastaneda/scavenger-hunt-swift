//
//  ItemsManager.swift
//  Scavenger Hunt
//
//  Created by Marcos Castaneda on 2/4/16.
//  Copyright © 2016 Marcos Castaneda. All rights reserved.
//

import Foundation
import UIKit

class ItemsManager {
    var itemsList = [ScavengerHuntItem]()
    
    func archivePath() -> String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        if let documentsPath = directoryList.first {
            return documentsPath + "/ScavengerHuntItems"
        }
        
        assertionFailure("Could not determine where to save.")
        return nil
    }
    
    func save() {
        if let theArchivePath = archivePath() {
            if NSKeyedArchiver.archiveRootObject(itemsList, toFile: theArchivePath) {
                print("Saved successfully.")
            }
        }
        else {
            assertionFailure("Could not save file")
        }
    }
    
    init() {
        if let theArchivePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                itemsList = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [ScavengerHuntItem]
            }
        }
    }
}
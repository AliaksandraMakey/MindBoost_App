//
//  CheckDeviceSize.swift
//  MindBoost_App
//
//  Created by Alexandra Makey on 06.08.24.
//

import UIKit

enum Device {
    /// Returns true if the current device is an iPhone.
    static var iPhone: Bool {
        if UIDevice().userInterfaceIdiom == .phone {
            return true
        } else {
            return false
        }
    }
}

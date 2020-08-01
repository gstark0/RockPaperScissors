//
//  HostingController.swift
//  RockPaperScissors
//
//  Created by Greg Stark on 01/08/2020.
//  Copyright © 2020 Gregory Stark. All rights reserved.
//

import UIKit
import SwiftUI

class HostingController: UIHostingController<ContentView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

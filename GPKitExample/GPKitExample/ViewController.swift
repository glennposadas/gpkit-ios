//
//  ViewController.swift
//  GPKitExample
//
//  Created by Glenn Posadas on 5/10/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import GPKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GPLog(classSender: self, log: "viewDidLoad!")
        
        let sampleInvalidEmail = "f214321fda"
        print("Is \"\(sampleInvalidEmail)\" a valid email? \(sampleInvalidEmail.isValidEmail())")
        
        // Title View Test: -
        
        let navBarImage = UIImage(named: "ic_logo_navbar")!
        self.setNavBarTitleWithFeedback(image: navBarImage, navBarTintColor: .white)
    }
}

extension ViewController: GPTitleViewDelegate {
    func gpTitleView(userDidTapTitleView gpTitleView: GPTitleView) {
        GPLog(classSender: self, log: "userDidTapTitleView🌈")
    }
    
    func gpTitleView(userDidFinishLongPress gpTitleView: GPTitleView) {
        GPLog(classSender: self, log: "userDidFinishLongPress🌺")
    }
}

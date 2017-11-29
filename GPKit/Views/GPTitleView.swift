//
//  GPTitleView.swift
//  GPKit
//
//  Created by Glenn Posadas on 6/8/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit

/** Optional protocol/delegate that tells when the title was tapped.
 */

public protocol GPTitleViewDelegate: NSObjectProtocol {

}

public extension GPTitleViewDelegate {
    func gpTitleView(userDidTapTitleView gpTitleView: GPTitleView) {}
    func gpTitleView(userDidFinishLongPress gpTitleView: GPTitleView) {}
}

public class GPTitleView: UIView {
    
    // MARK: - Properties
    
    @IBOutlet public weak var image_Title: UIImageView!
    
    public weak var delegate: GPTitleViewDelegate?
    
    // MARK: - Function
    // MARK: IBAction
    
    @IBAction func longPress(_ sender: Any) {
        self.delegate?.gpTitleView(userDidTapTitleView: self)
    }
    
    @IBAction private func titleViewTapped(_ sender: Any) {
        self.delegate?.gpTitleView(userDidTapTitleView: self)
    }
}

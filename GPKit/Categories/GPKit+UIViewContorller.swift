//
//  GPKit+UIViewContorller.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/10/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    // MARK: - Properties
    
    public typealias GPKitAlertCallBack = (_ userDidTapOk: Bool) -> Void
    
    // MARK: - Shorter public functions
    
    /** Shorter syntax for popping view controllers
     */
    
    public func popVC() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    public func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Status Bar
    
    /** Status Bar Configuration
     */
    
    public func showStatusBar() {
        UIApplication.shared.isStatusBarHidden = false
    }
    
    public func hideStatusBar() {
        UIApplication.shared.isStatusBarHidden = true
    }
    
    public func makeStatusBarLight() {
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    public func makeStatusBarDark() {
        UIApplication.shared.statusBarStyle = .default
    }
    
    public func makeNavBarTransparent() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = .black
        
        self.makeStatusBarDark()
    }
    
    public func makeNavBarTransparentWithoutBGImage() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = .black
        self.hideNavBar()
    }
    
    public func makeNavBarWhite() {
        self.navigationController?.navigationBar.isTranslucent = false
        let whiteImage = UIImage(color: .white)
        self.navigationController?.navigationBar.setBackgroundImage(whiteImage, for: .default)
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.view.backgroundColor = .white
        
        self.navigationController?.navigationBar.tintColor = .black
        self.makeStatusBarDark()
    }
    
    public func makeNavBarBlack() {
        self.navigationController?.navigationBar.isTranslucent = false
        let blackImage = UIImage(color: .black)
        self.navigationController?.navigationBar.setBackgroundImage(blackImage, for: .default)
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.view.backgroundColor = .black
        
        self.navigationController?.navigationBar.tintColor = .white
        self.makeStatusBarLight()
    }
    
    public func makeNavBarDefaultColor(color: UIColor, animated: Bool) {
        
        self.navigationController?.navigationBar.tintColor = .white
        
        self.navigationController?.view.backgroundColor = color
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        
        if animated {
            UIView.transition(with: self.navigationController!.navigationBar,
                              duration: 1.0,
                              options: [.beginFromCurrentState, .transitionCrossDissolve],
                              animations: {
                                self.navigationController?.navigationBar.isTranslucent = false
                                self.navigationController?.navigationBar.backgroundColor = color
            }, completion: nil)
        } else {
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.backgroundColor = color
        }
    }
    
    public func showNavBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    public func showNavBarAnimated() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    public func hideNavBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - BackButton
    
    /** Configures the back button
     */
    
    public func setBackButtonVisible(animated: Bool) {
        self.navigationItem.setHidesBackButton(false, animated: animated)
    }
    
    public func setBackButtonHidden(animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: animated)
    }
    
    // MARK: - NavBar Logos
    
    /** Configures te logos of the nav bar
     */
    
    public func removeLogoTitleView() {
        self.navigationItem.titleView = nil
    }
    
    /** Sets the title with attributed string
     */
    
    public func setNavBarTitleWithAttributedString(title: String, color: UIColor, font: UIFont) {
        
        let titleLabel = UILabel()
        let attributes = [NSForegroundColorAttributeName: color,
                          NSFontAttributeName : font as Any]
        titleLabel.attributedText = NSAttributedString(string: title, attributes: attributes)
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
    }
    
    // MARK: - Alerts
    
    /**
     Generates and shows an alertController with a native design
     */
    
    public func showAlert(
        title: String?,
        message: String?,
        okayButtonTitle: String,
        cancelButtonTitle: String?,
        withBlock completion: @escaping GPKitAlertCallBack) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okayButtonTitle, style: .default) { _ in
            completion(true)
        }
        alertController.addAction(okAction)
        
        if let cancelButtonTitle = cancelButtonTitle {
            let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .default) { _ in
                completion(false)
            }
            alertController.addAction(cancelAction)
        }
        
        alertController.view.tintColor = .black
        present(alertController, animated: true, completion: nil)
    }
    
}

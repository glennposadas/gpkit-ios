//
//  UIViewContorller+GPKit.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/10/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    // MARK: - Properties
    
    public typealias GPKitAlertControllerCallBack = (_ sourceType: UIImagePickerControllerSourceType) -> Void
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
    
    /** Navigation Bar Configuration
     */
    
    public func hideBackButton() {
        self.navigationController?.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    public func hideBackButtonForTabBarController() {
        self.tabBarController?.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    public func setupNavBarTitleCustomFont(font: UIFont, textColor: UIColor? = nil) {
        var attributes: [NSAttributedStringKey : Any] = [NSAttributedStringKey.font : font]
        
        if let textColor = textColor {
            attributes[NSAttributedStringKey.foregroundColor] = textColor
        }
        
        self.navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    public func setupBackButtonTitleCustomFont(font: UIFont, textColor: UIColor? = nil) {
        var attributes: [NSAttributedStringKey : Any] = [NSAttributedStringKey.font : font]
        
        if let textColor = textColor {
            attributes[NSAttributedStringKey.foregroundColor] = textColor
        }
        
        self.navigationController?.navigationBar.backItem?.backBarButtonItem?.setTitleTextAttributes(attributes, for: .normal)
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
    
    @available(*, deprecated, message: "Use makeNavBarColor(color: UIColor, itemsTintColor: UIColor)")
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
    
    @available(*, deprecated, message: "Use makeNavBarColor(color: UIColor, itemsTintColor: UIColor)")
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
    
    public func makeNavBarColor(color: UIColor, itemsTintColor: UIColor) {
        self.navigationController?.navigationBar.isTranslucent = false
        let colorImage = UIImage(color: color)
        self.navigationController?.navigationBar.setBackgroundImage(colorImage, for: .default)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.backgroundColor = color
        self.navigationController?.view.backgroundColor = color
        
        self.navigationController?.navigationBar.tintColor = itemsTintColor
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
    
    public func makeNavBarItemsTintColor(color: UIColor) {
        self.navigationController?.navigationBar.tintColor = color
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
    
    /** Sets the navbar title with image and feedback from the button.
     *  Will call delegate if the navbar title is tapped.
     */
    
    public func setNavBarTitleWithFeedback(image: UIImage, navBarTintColor: UIColor) {
        self.navigationController?.navigationBar.tintColor = navBarTintColor
        
        let gpKitBundle = Bundle(for: GPTitleView.self)
        if let gpTitleView = UINib(nibName: "GPTitleView", bundle: gpKitBundle).instantiate(withOwner: nil, options: nil)[0]
            as? GPTitleView {
            
            gpTitleView.delegate = self as? GPTitleViewDelegate
            gpTitleView.image_Title.image = image
            self.navigationItem.titleView = gpTitleView
        }
    }
    
    public func setNavBarTitle(image: UIImage, navBarTintColor: UIColor) {
        self.navigationController?.navigationBar.tintColor = navBarTintColor
        
        let gpKitBundle = Bundle(identifier: "ph.cituslabs.app.gpkit")
        if let gpTitleView = UINib(nibName: "GPTitleView", bundle: gpKitBundle).instantiate(withOwner: nil, options: nil)[0]
            as? GPTitleView {
            
            gpTitleView.image_Title.image = image
            self.navigationItem.titleView = gpTitleView
        }
    }
    
    /** Sets the title with attributed string
     */
    
    public func setNavBarTitleWithAttributedString(title: String, color: UIColor, font: UIFont) {
        
        let titleLabel = UILabel()
<<<<<<< HEAD
        let attributes = [NSAttributedStringKey.foregroundColor: color,
=======
        let attributes = [NSAttributedStringKey.foregroundColor : color,
>>>>>>> 191d73fecc2afbba7424659dd16fa1dd12588cd0
                          NSAttributedStringKey.font : font as Any]
        titleLabel.attributedText = NSAttributedString(string: title, attributes: attributes)
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
    }
    
    // MARK: - Alerts
    
    /**
     Generates and shows an alertController with a native design
     */
    
    public func showAlert(
        title: String,
        message: String? = nil,
        okayButtonTitle: String,
        cancelButtonTitle: String? = nil,
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
    
    
    // MARK: - AlertController for Image Picker and Camera Source
    
    public func showAlertControllerForPhoto(sourceView: UIView, tintColor: UIColor, withBlock completion: @escaping GPKitAlertControllerCallBack) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // provide the view source
        alertController.popoverPresentationController?.sourceView = sourceView
        alertController.popoverPresentationController?.sourceRect = sourceView.bounds
        alertController.view.tintColor = tintColor
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
                _ in
                
                alertController.view.tintColor = tintColor
                completion(.camera)
                
            })
            
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {
                _ in
                
                alertController.view.tintColor = tintColor
                completion(.photoLibrary)
                
            })
            
            alertController.addAction(photoLibraryAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

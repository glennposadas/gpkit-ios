//
//  GPKit+UITextField.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/10/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import Foundation
import UIKit

public extension UITextField {

    /**
     
     - Validation for TextFields.
     - Call this extension function like this:
     - if (textField.hasContents()) then proceed
     
     */
    
    public func hasContents() -> Bool {
        
        let whitespaceSet = CharacterSet.whitespaces
        
        if self.text == "" || self.text == "" {
            return false
        }
        
        if self.text!.trimmingCharacters(in: whitespaceSet).isEmpty
            || self.text!.trimmingCharacters(in: whitespaceSet).isEmpty {
            return false
        }
        
        return true
    }
    
    /**
     The function to be called for the alert.
     */
    
    public func setupTextFieldWithDelegate(
        delegate: UITextFieldDelegate,
        textColor: UIColor,
        placeholderText: String?,
        imageIcon: UIImage?) -> UITextField {
        
        // The half of the height of the superview, which is the textField minus half of the height of imageView
        let y = 19.0 - 7.5
        
        let imageView = UIImageView(frame: CGRect(x: 15, y: y, width: 15, height: 15))
        
        if let imageIcon = imageIcon {
            imageView.image = imageIcon
            imageView.contentMode = .scaleAspectFill
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
            self.backgroundColor = .clear
        } else {
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        }
        
        self.leftViewMode = .always
        self.textColor = textColor
        self.delegate = delegate
        
        self.addSubview(imageView)
        
        if let placeHolder = placeholderText {
            let localizedPlaceHolder = NSLocalizedString(placeHolder, comment: "")
            let attributedString = NSAttributedString(string: localizedPlaceHolder,
                                                      attributes: [NSForegroundColorAttributeName: textColor])
            self.attributedPlaceholder = attributedString
        }
        
        return self
    }
    
    /**
     The function to setup a textField for any input type
     */
    
    public func setupTextFieldForInputType(inputType: UIKeyboardType) -> UITextField {
        //self.font = R.font.gothamBook(size: 14.0)
        self.keyboardType = inputType
        
        switch inputType {
        case .default:
            // for default
            self.autocapitalizationType = .words
            self.spellCheckingType = .yes
            self.autocorrectionType = .yes
            
        default:
            // for emails
            self.autocapitalizationType = .none
            self.spellCheckingType = .no
            self.autocorrectionType = .no
        }
        
        return self
    }
}

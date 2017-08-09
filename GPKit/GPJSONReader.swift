//
//  GPJSONReader.swift
//  GPKit
//
//  Created by Glenn Posadas on 6/7/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit

public class GPJSONReader {
    
    /** Get the whole JSON object from a file
     *  @returns an optional dictionary [String: Any]?
     */
    
    public class func readJson(fileName: String, withBlock completion: ([String : Any]?) -> Void) {
        do {
            if let file = Bundle.main.url(forResource: fileName, withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String : Any] {
                    GPLog(classSender: self, log: "JSON found as dictionary")
                    completion(object)
                } else {
                    GPLog(classSender: self, log: "JSON is invalid")
                    completion(nil)
                }
            } else {
                GPLog(classSender: self, log: "No file found!")
                completion(nil)
            }
        } catch {
            GPLog(classSender: self, log: error.localizedDescription)
            completion(nil)
        }
    }
}

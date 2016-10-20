//
//  NSData+Extension.swift
//  ObjectMapperUseage
//
//  Created by 杨晓冬 on 10/18/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import Foundation

extension NSData {
    class func dataFromJSONFile(fileName: String) -> NSData? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try NSData(contentsOf: URL(fileURLWithPath: path), options: NSData.ReadingOptions.mappedIfSafe)
                return data
            } catch let error as NSError {
                print(error.localizedDescription)
                return nil
            }
        } else {
            print("Invalid filename/path.")
            return nil
        }
    }
}

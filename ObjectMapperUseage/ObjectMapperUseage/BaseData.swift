//
//  BaseData.swift
//  ObjectMapperUseage
//
//  Created by 杨晓冬 on 10/18/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import Foundation
import ObjectMapper


class BaseData: NSObject, Mappable {
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
    }
}

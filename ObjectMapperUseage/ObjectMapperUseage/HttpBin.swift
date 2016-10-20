//
//  HttpBin.swift
//  ObjectMapperUseage
//
//  Created by 杨晓冬 on 10/18/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import Foundation
import ObjectMapper

class HttpBin: BaseData {
    var origin: String?
    var url: String?
    
    override func mapping(map: Map) {
        origin <- map["origin"]
        url <- map["url"]
    }
}

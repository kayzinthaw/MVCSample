//
//  EmployeeResponse.swift
//  MVCSample
//
//  Created by Kay Zin Thaw on 23/06/2020.
//  Copyright © 2020 cbbank. All rights reserved.
//

import Foundation
class EmployeeResponse: Codable {
    var data : [EmployeeModel]!
    var status : String!
}

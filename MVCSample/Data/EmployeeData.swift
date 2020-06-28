//
//  EmployeeData.swift
//  MVCSample
//
//  Created by Kay Zin Thaw on 23/06/2020.
//  Copyright © 2020 cbbank. All rights reserved.
//

import Foundation
import UIKit
class EmployeeData {
    static let service = EmployeeService()
    static func getAllEmplyoeeData() -> [EmployeeModel] {
        var responseObj: EmployeeResponse?
        var nameList: [String] = []
        var ageList: [String] = []
        var arrData: [EmployeeModel] = []
        service.getAllEmployee(success: { (employee) in
            
            responseObj = employee
            print("Response is :: \(responseObj?.data.count)")
            arrData = responseObj!.data
//            print("Resss : \(arrData)")
            
        }) { (error) in
            print("Error \(error)")
        }
        return arrData
    }
}

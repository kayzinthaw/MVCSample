//
//  ProductService.swift
//  MVCSample
//
//  Created by Kay Zin Thaw on 23/06/2020.
//  Copyright © 2020 cbbank. All rights reserved.
//

import Foundation
import Alamofire
import EVReflection

class EmployeeService: BaseService {
    private let url: String = "employees"
    func getAllEmployee(success: @escaping (EmployeeResponse) -> Void, fail: @escaping (String) -> Void ){
        let params: Parameters = [:]
        let header: HTTPHeaders = [:]

        requestApi(url: url, header: header, method: .get, params: params, encoding: JSONEncoding.default, success: { (response) in
            debugPrint(response)
    
            let data = try! JSONDecoder().decode(EmployeeResponse.self, from: response)
            success(data)
        }) { (error) in
            debugPrint("Error : \(error)")
        }
    }

}





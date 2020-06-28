//
//  FirstViewController.swift
//  MVCSample
//
//  Created by Kay Zin Thaw on 23/06/2020.
//  Copyright © 2020 cbbank. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var arrayData = [ProductModel]()
    var employeeData: [EmployeeModel] = []
    let service = EmployeeService()

    override func viewDidLoad() {
        super.viewDidLoad()
        arrayData = ProductData.getAllProduct()
        getAllEmplyoeeData()
       
    }
    func getAllEmplyoeeData() {
        var responseObj: EmployeeResponse?
        service.getAllEmployee(success: { (employee) in
            responseObj = employee
            print("Response is :: \(String(describing: responseObj?.data.count))")
            self.employeeData = responseObj!.data
            for i in self.employeeData {
                print("Employee Name : \(String(describing: i.employee_name))")
            }
        }) { (error) in
            print("Error \(error)")
        }
    }
    
}
extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
        cell.productData = arrayData[indexPath.row]
        return cell
    }
}

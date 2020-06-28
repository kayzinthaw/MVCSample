//
//  Constant.swift
//  MVCSample
//
//  Created by Kay Zin Thaw on 23/06/2020.
//  Copyright © 2020 cbbank. All rights reserved.
//

import Foundation
import UIKit

let BASE_URL = "http://dummy.restapiexample.com/api/v1"

let HTTP_REQUEST_STARTING_NOTIFICATION = "httpRequestStartNotification";
let HTTP_REQUEST_FINISHING_NOTIFICATION = "httpRequestFinishNotification";
let HTTP_UPLOAD_STARTING_NOTIFICATION = "httpUploadStartNotification";
let HTTP_UPLOAD_FINISHING_NOTIFICATION = "httpUploadFinishNotification";
let HTTP_UPLOAD_PROGRESS_NOTIFICATION = "httpUploadProgressNotification";

let LOGIN_SUCCESS_NOTIFICATION = "loginSuccessNotification"
let LOGOUT_SUCCESS_NOTIFICATON = "logoutSuccessNotification"

let APPLICATION_DID_ENTER_BACKGROUND = "UIApplicationDidEnterBackgroundNotification"
let APPLICATION_DID_BECOME_ACTIVE = "UIApplicationDidBecomeActiveNotification"

//colour
let primaryColor = "#FF6B00";

//let fICODE = "CPOBMMMY"

// Age of 18.
let MINIMUM_AGE: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!;
// Age of 100.
let MAXIMUM_AGE: Date = Calendar.current.date(byAdding: .year, value: -100, to: Date())!;

func buildUrl(url:String) -> String{
    print("Base URL \(BASE_URL)/\(url)")
    return "\(BASE_URL)/\(url)";
}

func addPathParam(url:String, pathParam:Int) -> String{
    return "\(url)/\(pathParam)";
}
func getAppDelegate() -> AppDelegate{
    return UIApplication.shared.delegate as! AppDelegate;
}
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}
func getDocumentFolder() -> String{
    return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
}
func makeDocumentPath(filename : String) -> String{
    let documentFolder = getDocumentFolder();
    return "\(documentFolder)/\(filename)";
}
func postGlobalNotification(name: String, param : AnyObject?) {
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: name), object: param);
}

func addObserverForGlobalNotification(name : String, target : AnyObject, action : Selector, obj : AnyObject?) {
    NotificationCenter.default.addObserver(target, selector: action, name: NSNotification.Name(rawValue: name), object: obj);
}

func removeObserverForGlobalNotification(name : String?, target : AnyObject, obj : AnyObject?) {
    if let notiName = name {
        NotificationCenter.default.removeObserver(target, name: NSNotification.Name(rawValue: notiName), object: obj);
    }
    else{
        NotificationCenter.default.removeObserver(target);
    }
}



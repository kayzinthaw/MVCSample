//
//  BaseService.swift
//  MVCSample
//
//  Created by Kay Zin Thaw on 23/06/2020.
//  Copyright © 2020 cbbank. All rights reserved.
//

import Foundation
import Alamofire
import EVReflection

enum HTTPMETHOD : String{
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
}
class MultipartInfo:NSObject{
    var data:Data
    var filename:String
    init(data:Data, filename:String){
        self.data = data
        self.filename = filename
    }
    
}
class BaseService {
  static let internalQueue = DispatchQueue(label: "serialQueue")
        static let semaphore = DispatchSemaphore(value: 1)
        public typealias Completion<T> = (_ result:T?, _ error: ApplicationError?) -> Void
        
        var baseDomain:String = "baseDomain";
        
        func addBasicParams(params: inout Parameters){
            let versionNumber: NSInteger = 0001
            params["versionNo"] = "0001";
            params["clientVersion"] = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String;
            params["channel"] = "iOS";
            params["date"] = Date.stringFromCurrentDate(format: "yyyyMMdd");
            params["time"] = Date.stringFromCurrentDate(format: "HHmmss");
                    params["timezone"] = (NSTimeZone.local as NSTimeZone).name;
            
        }
    
    func requestApi(
        url:String,
        header:HTTPHeaders,
        method:HTTPMethod,
        params:Parameters,
        encoding:ParameterEncoding,
        success: @escaping(Data) -> Void,
        fail: @escaping(String) ->Void) {
        
        switch method {
        case .get,
             .delete:
            
            
            Alamofire.request(buildUrl(url: url), method: method, parameters: nil, encoding: encoding,headers: header).responseJSON { (response) in
                
                switch response.result {
                    
                case .success:
                    
                    success(response.data!)
                    
                case .failure(let error):
                    
                    debugPrint(error.localizedDescription)
                    
                    fail(error.localizedDescription)
                }
            };
        case .post,
             .put:
            Alamofire.request(buildUrl(url: url), method: method, parameters: params, encoding: encoding,headers: header).responseJSON { (response) in
                
                switch response.result {
                    
                case .success:
                    
                    success(response.data!)
                    
                case .failure(let error):
                    
                    debugPrint(error.localizedDescription)
                    
                    fail(error.localizedDescription)
                }
                
            };
            
        default:
            print("Defalult")
        }
        
    }
    
    
    func requestApiwithRawparam(url:String,
                                header:HTTPHeaders,
                                method:HTTPMethod,
                                params:Parameters,
                                rawValue:String,
                                success: @escaping(Data) -> Void,
                                fail: @escaping(String) ->Void) {
        
        Alamofire.request(buildUrl(url: url), method: method, parameters: params, encoding: BodyStringEncoding(body: rawValue),headers: header).responseJSON { (response) in
            
            switch response.result {
                
            case .success:
                
                success(response.data!)
                
            case .failure(let error):
                
                debugPrint(error.localizedDescription)
                
                fail(error.localizedDescription)
            }
        }
    }
    

        func updateProgress(progress:Double){
            postGlobalNotification(name: HTTP_UPLOAD_PROGRESS_NOTIFICATION, param: progress as AnyObject);
        }
        
        func convertErrorToApplicationError(error:Error, domain:String) -> ApplicationError{
            return ApplicationError(domain:domain, code:999, message: error.localizedDescription);
        }
        
        func convertToApplictionErrorFromMessage(message:String, domain:String) -> ApplicationError{
            return ApplicationError(domain: domain, code: 999, message: message);
        }
        
        
    }






//
//  APIRequest.swift
//  Techflitter_task
//
//  Created by Chetan Desai on 28/09/20.
//  Copyright © 2020 Chetan Desai. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

class APIRequest: NSObject {
    static let shared = APIRequest()
    func getAPIRequest<T:Decodable>(serviceName: String, completionBlockSuccess aBlock: @escaping ((T) -> Void), andFailureBlock failBlock:@escaping ((AnyObject) -> Void)) {
        performGetRequest(serviceName: serviceName, success: aBlock, failure: failBlock)
    }
    
    func performGetRequest<T:Decodable>(serviceName: String,success successBlock: @escaping ((T) -> Void), failure failureBlock: @escaping ((AnyObject) -> Void)) {
        
        let checkInterNet:Bool =  Connectivity.isConnectedToInternet()
        let requestURL = serviceName
        print("requestURL: \(requestURL)")
        if checkInterNet == true {
            
            Alamofire.request(requestURL, method: .get, parameters: nil, encoding: URLEncoding.default).responseJSON { (responsed) in
                if responsed.result.isSuccess {
                    if responsed.response?.statusCode == 200 {
                        do {
                            
                            if let json = try JSONSerialization.jsonObject(with: responsed.data!, options:.allowFragments) as? [String: Any] {
                                print("Response Data = \(json)")
                                
                                if let result = json["result"] as? Bool, result == false {
                                    if let message = json["msg"] as? String {
                                        failureBlock(message as AnyObject)
                                    } else {
                                        failureBlock("API response not coming please try again" as AnyObject)
                                    }
                                    return
                                }
                            }
                            
                            let obj = try JSONDecoder().decode(T.self , from: responsed.data!)
                            successBlock(obj)
                        }
                        catch {
                            failureBlock("API response not coming please try again" as AnyObject)
                        }
                    }
                    else
                    {
                        failureBlock("API response not coming please try again" as AnyObject)
                    }
                } else if responsed.result.isFailure {
                    debugPrint("getEvents error: \(responsed.result.error.debugDescription)")
                    failureBlock(responsed.result.error?.localizedDescription as AnyObject)
                }
            }
        }
        else {
             failureBlock("Please check your Internet Connection " as AnyObject)
        }
    }
}

//
//  YTSManager.swift
//  ytsMoviesApp
//
//  Created by DCMac01 on 11/6/17.
//  Copyright © 2017 DCMac01. All rights reserved.
//

import Foundation
import SystemConfiguration
import Alamofire
import SwiftyJSON

class YTSManager:NSObject {
    static let shared = YTSManager()
    var movieInfo = [Movies]()
    
    //  MARK :- Custom method
    func isConnectedToNetwork() -> Bool{
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
            
        }) else {
            
            return false
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    // MARK :- API Methods
    
    func getMovies(requestURL: String , completion: @escaping (_ error: String, _ success: Bool)->Void) {
        
        let completeURL = "\(kBaseUrl)\(requestURL)"
        
        Alamofire.request(completeURL, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error):
                    completion("Negative responce", false)
                    print(error)
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    if json["response_status"] == 1 {
                        let sports = json["sports_data"].arrayObject
            
                        completion("" , true)
                    }else{
                        completion( json["msg"].string! , false)
                    }
                }
        }
    }
    
    
    
    
    
}

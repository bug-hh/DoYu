//
//  NetworkTools.swift
//  DoYu
//
//  Created by 彭豪辉 on 2020/8/12.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class NetworkTools {
    class func requestData(_ type: MethodType, urlString: String, parameters: [String : Any]? = nil, finishedCallback: @escaping (_ result: Any) -> ()) {
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        AF.request(urlString, method: method, parameters: parameters).responseJSON { (response) in
            switch response.result {
            case .success:
                finishedCallback(response.value ?? "")
            case let .failure(error):
                print(error)
            }
        }
    }
}

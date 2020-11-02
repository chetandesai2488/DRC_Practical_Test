//
//  NewsViewModel.swift
//  DRC_Practical_Test
//
//  Created by Chetan Desai on 02/11/20.
//  Copyright © 2020 Chetan Desai. All rights reserved.
//

import UIKit

class NewsViewModel: NSObject {

    var successLoginMessage:taAPISucccesMessage?
    var errorLoginMesssage:taAPIErrorMessage?
    var arrListArticles = [articlesModel]()
    
    //MARK:- API request Login
    func newsListCall(){
        
        let getInfo = baseURL
        DispatchQueue.global(qos: .userInitiated).sync {
        
            APIRequest.shared.getAPIRequest(serviceName: getInfo, completionBlockSuccess: { (result:newsModel) in
                print(result)
                self.arrListArticles = result.articles!
                self.successLoginMessage!(result.status!)

            }) { (value) in
                self.errorLoginMesssage!(value as! String)
            }
            
        }
    }
    
}

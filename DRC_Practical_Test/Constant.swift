//
//  Constant.swift
//  DRC_Practical_Test
//
//  Created by Chetan Desai on 02/11/20.
//  Copyright © 2020 Chetan Desai. All rights reserved.
//

import Foundation
import UIKit
import JGProgressHUD

let hud = JGProgressHUD(style: .dark)

//MARK:- Set ProgressHUD
func setProgressHub(view:UIView) {
    hud.show(in:view)
}
func removeProgressHub() {
    hud.dismiss()
}

//MARK:- News Credentials
let newsAPIKey = "7ef6c6ad69394f70947a9f4a83b37864"

//MARK:- Screen Resolution
let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height

//MARK:- UserDefaults keys
let userDefault = UserDefaults.standard

//MARK:- TypeDefine Declaration
typealias ImagePass = (UIImage) -> Void
typealias taAPIErrorMessage = ((String) -> Void)
typealias taAPISucccesMessage = ((String) -> Void)

//MARK:- Constant API URL
let baseURL = "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=7ef6c6ad69394f70947a9f4a83b37864"

//MARK:- Constant Struct

struct AppMessage {
    var internetIssue:String = "Please check the internet connection"
}

struct Alert {
    func showAlert(message:String,viewController:UIViewController) {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "DRC Systems", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}

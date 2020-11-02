//
//  ViewController.swift
//  DRC_Practical_Test
//
//  Created by Chetan Desai on 02/11/20.
//  Copyright © 2020 Chetan Desai. All rights reserved.
//

import UIKit
import SDWebImage
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var tblNewsList: UITableView!
    
    var objNewsViewModel = NewsViewModel()
    private let reuseIdentifier = "NewsTableViewCell"
    
    // MARK: View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getNewsUpdate()
    }

    // MARK: News api call
    func getNewsUpdate() {
        
        objNewsViewModel.errorLoginMesssage = {[weak self] value in
            removeProgressHub()
            Alert().showAlert(message: value, viewController: self!)
        }
        
        objNewsViewModel.successLoginMessage = {[weak self] value in
            removeProgressHub()
            if self != nil {
                print("\(self!.objNewsViewModel.arrListArticles)")
                print(self!.objNewsViewModel.arrListArticles[0].author as Any)
                //self!.tblNewsList.reloadData()
            }
        }
        
        setProgressHub(view: self.view)
        objNewsViewModel.newsListCall()
    }
    

}


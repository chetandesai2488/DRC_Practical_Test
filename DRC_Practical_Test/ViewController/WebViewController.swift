//
//  WebViewController.swift
//  DRC_Practical_Test
//
//  Created by Chetan Desai on 02/11/20.
//  Copyright © 2020 Chetan Desai. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet var webload: WKWebView!
    @IBOutlet weak var Activity: UIActivityIndicatorView!
    var strUrl: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let web_url = URL(string:strUrl)!
        let web_request = URLRequest(url: web_url)
        webload.load(web_request)
        
        self.Activity.startAnimating()
        self.webload.navigationDelegate = self
        self.Activity.hidesWhenStopped = true
    }
    
    // MARK: UIAction methods
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: WKNavigationDelegate methods
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Activity.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        Activity.stopAnimating()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

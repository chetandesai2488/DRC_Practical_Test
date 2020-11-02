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

class ViewController: UIViewController, RowCellDelegate {
    

    @IBOutlet weak var tblNewsList: UITableView!
    
    var objNewsViewModel = NewsViewModel()
    private let reuseIdentifier = "NewsTableViewCell"
    
    // MARK: View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "News"
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
                self!.tblNewsList.reloadData()
            }
        }
        
        setProgressHub(view: self.view)
        objNewsViewModel.newsListCall()
    }
    
    func btnNewsLinkTapped(cell: NewsTableViewCell) {
        let indexPath = self.tblNewsList.indexPath(for: cell)
        print(indexPath?.section)
    }
}

// MARK: UICollection view methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return objNewsViewModel.arrListArticles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NewsTableViewCell
        cell.lblTitle.text = objNewsViewModel.arrListArticles[indexPath.section].title
        cell.lblAuthorName.text = objNewsViewModel.arrListArticles[indexPath.section].author
        
        let newDate = NSString.convertFormatOfDate(date: "\(objNewsViewModel.arrListArticles[indexPath.section].publishedAt ?? "")", originalFormat: "yyyy-MM-dd'T'HH:mm:ssZ", destinationFormat: "dd MMM, yyyy hh:mm a")
        cell.lblDate.text = newDate
        
        let imageURL = URL(string: objNewsViewModel.arrListArticles[indexPath.section].urlToImage ?? "")
        cell.newImage.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder"))
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 8))
        footerView.backgroundColor = .clear
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tblNewsList.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController") as! NewsDetailViewController
        initialViewController.valueNews = [objNewsViewModel.arrListArticles[indexPath.section]]
        self.navigationController?.pushViewController(initialViewController, animated: true)
    }
    
}

extension NSString {

class func convertFormatOfDate(date: String, originalFormat: String, destinationFormat: String) -> String! {

    // Orginal format :
    let dateOriginalFormat = DateFormatter()
    dateOriginalFormat.dateFormat = originalFormat      // in the example it'll take "yy MM dd" (from our call)

    // Destination format :
    let dateDestinationFormat = DateFormatter()
    dateDestinationFormat.dateFormat = destinationFormat // in the example it'll take "EEEE dd MMMM yyyy" (from our call)

    // Convert current String Date to NSDate
    let dateFromString = dateOriginalFormat.date(from: date)

    // Convert new NSDate created above to String with the good format
    let dateFormated = dateDestinationFormat.string(from: dateFromString!)

    return dateFormated

}
}

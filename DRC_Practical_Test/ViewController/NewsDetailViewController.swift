//
//  NewsDetailViewController.swift
//  DRC_Practical_Test
//
//  Created by Chetan Desai on 02/11/20.
//  Copyright © 2020 Chetan Desai. All rights reserved.
//

import UIKit
import SDWebImage

class NewsDetailViewController: UIViewController, LinkCellDelegate {

    @IBOutlet weak var largeImage: UIImageView!
    @IBOutlet weak var vwLargeImage: UIView!
    
    @IBOutlet weak var tblNewsDetail: UITableView!
    private let reuseIdentifier = "DetailNewsTableViewCell"

    var valueNews = [articlesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.vwLargeImage.isHidden = true

    }
    
    func btnNewsLinkTapped(cell: DetailNewsTableViewCell) {
        let indexPath = self.tblNewsDetail.indexPath(for: cell)
        print(indexPath?.section)
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


// MARK: UICollection view methods
extension NewsDetailViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! DetailNewsTableViewCell
        cell.lblTitle.text = valueNews[indexPath.section].title
        cell.lbldescription.text = valueNews[indexPath.section].description
        cell.lblauthor.text = valueNews[indexPath.section].author
        
        let newDate = NSString.convertFormatOfDate(date: "\(valueNews[indexPath.section].publishedAt ?? "")", originalFormat: "yyyy-MM-dd'T'HH:mm:ssZ", destinationFormat: "dd MMM, yyyy hh:mm a")
        cell.lblpublishedAt.text = newDate
        
        let imageURL = URL(string: valueNews[indexPath.section].urlToImage ?? "")
        cell.newImage.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder"))
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tblNewsDetail.deselectRow(at: indexPath, animated: true)
    }
    
}

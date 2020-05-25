//
//  ViewController.swift
//  TopHeadlines
//
//  Created by Naresh Sir on 25/05/20.
//  Copyright © 2020 Shiva Ganesh. All rights reserved.
//

import UIKit
 
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var newsTV: UITableView!
    var activityView: UIActivityIndicatorView?
    var  newsModelRef :GetTopNewsModel?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModelRef?.articles?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsTVCell", for: indexPath) as! newsTVCell
        let titleNames = newsModelRef?.articles?[indexPath.row].title
        cell.label.text = titleNames?.capitalized
        let url = URL(string:newsModelRef?.articles?[indexPath.row].urlToImage ?? "")
        cell.imgView.image = UIImage(url:url)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        networkCall()
        showActivityIndicator()
        // Do any additional setup after loading the view.
    }
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    
    func networkCall(){
        if let url = URL(string: "\(URLModel.getUrl)") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            let decodedResponce = try JSONDecoder().decode(GetTopNewsModel.self, from: data)
                            print(decodedResponce)
                            self.newsModelRef = decodedResponce
                            self.newsTV.reloadData()
                            self.hideActivityIndicator()
                            } catch let error {
                            print(error)
                        }
                    }
                }
            }.resume()
        }
    }
}
extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }

        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
        } catch {
            print("Cannot load image from url: \(url) with error: \(error)")
            return nil
        }
    }
}
class newsTVCell:UITableViewCell{
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
}

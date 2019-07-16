//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Dina Mansour on 7/15/19.
//  Copyright © 2019 MAF. All rights reserved.
//

import UIKit
import Reachability

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    lazy var viewModel = NewsViewModel()
    var dialogFullScreenView: UIView?
    var dialogLoadingGroup: STLoadingGroup?
    private let refreshControl = UIRefreshControl()
 
    
    @IBOutlet weak var tableView: UITableView!
    
    var newsList = NewsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     
         viewModel.getNewsData(delegate: self)

        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if #available(iOS 10.0, *){
            tableView.refreshControl = refreshControl
        }else{
            tableView.addSubview(refreshControl)
        }
        
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        
       
    }
  
    @objc private func refreshData(_ sender: Any){
       
       viewModel.getNewsData(delegate: self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        let news = Array(newsList.articles)
        
        
        return (news.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        
        
      
            
            let news = Array(newsList.articles)
            
            let urlString = news[indexPath.row].urlToImage
            
            if (urlString != nil){
                let url = URL(string: urlString!.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)! )
                
                
                cell.newsImage.kf.setImage(with: url)
                
            } else{
                cell.newsImage.image = UIImage(named: "newspaper.png")
            }
            
            cell.newsTitle.text = news[indexPath.row].title
            
            
            
      
    
        
        return cell
        
        
    }

    
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let news = Array(newsList.articles)
        
        let detailView =  NewsDetailsViewController(nibName: "NewsDetailsViewController", bundle: nil)
        let title = news[indexPath.row].title
        detailView.newsTit = title!
        let newsDesc = news[indexPath.row].descriptionn
        if (newsDesc != nil) {
        detailView.newsDesc = newsDesc
        }
        let urlString = news[indexPath.row].urlToImage
        if (urlString != nil){
        detailView.newsImg = urlString
        }
       
  
        self.navigationController?.pushViewController(detailView, animated: true)
        
    }
    
    public func showProgressDialog(){
        dialogLoadingGroup = STLoadingGroup(side: 80, style: .arch)
        
        if dialogFullScreenView == nil {
            dialogFullScreenView = UIView(frame: self.view.frame)
            dialogFullScreenView?.backgroundColor = UIColor(red: 0.0, green: 0.0, blue:0.0, alpha: 0.3)
        }
        
        if !(dialogFullScreenView?.isDescendant(of: self.view))!{
            self.view.addSubview(dialogFullScreenView!)
            dialogFullScreenView?.fillScreenLayoutConstrains()
        }
        
        dialogLoadingGroup?.show(dialogFullScreenView)
        dialogLoadingGroup?.startLoading()
    }
    
    public func hideProgressDialog(){
        dialogLoadingGroup?.stopLoading()
        dialogFullScreenView?.removeFromSuperview()
    }
    
    
    
    
    public func isNetworkConnected() -> Bool{
        let reachability = Reachability()!
        return reachability.isReachable
    }
    
    public func showNoNetworkConnectedMessage(){
        UIHelper.showErrorMessage(Utils.localizedString(forKey: "noNetworkConnected"))
    }
    
}

//MARK: RequestDelegate
extension NewsViewController: NewsRequestDelegate {
    
    
    func requestWillSend() {
        showProgressDialog()
    }
    
    func requestSucceeded(data: NewsModel?) {
        hideProgressDialog()
        self.refreshControl.endRefreshing()
       
        DispatchQueue.main.async{
        if let newsData = data {
            
        self.newsList = newsData
        }
        self.tableView.reloadData()
        }
      
      
    }
    
    func requestFailed() {
        hideProgressDialog()
        self.refreshControl.endRefreshing()
        showNoNetworkConnectedMessage()
    }
    
    
}

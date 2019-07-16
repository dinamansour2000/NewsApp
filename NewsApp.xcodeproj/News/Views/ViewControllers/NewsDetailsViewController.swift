//
//  NewsDetailsViewController.swift
//  NewsApp
//
//  Created by Dina Mansour on 7/15/19.
//  Copyright © 2019 MAF. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {

   
    @IBOutlet weak var newsDescription: UITextView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    public var newsDesc: String? = ""
    public var newsTit: String? = ""
    public var newsImg : String? = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
        newsDescription.text = newsDesc
        newsTitle.text = newsTit
        let urlString = newsImg
        if (urlString != ""){
            let url = URL(string: urlString!.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)! )
            
            
            newsImage.kf.setImage(with: url)
            
        } else{
            newsImage.image = UIImage(named: "newspaper.png")
        }
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }


}

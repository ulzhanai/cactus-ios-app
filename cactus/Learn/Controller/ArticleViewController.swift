//
//  ArticleViewController.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/16/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    var article:Article!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var articleTitleLabel: UILabel!
    @IBOutlet var articleTextLabel: UILabel!
    
    @IBOutlet var authorImageView: UIImageView!
    @IBOutlet var authorNameLabel: UILabel!
    @IBOutlet var authorSubtitleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = article.title
        articleTitleLabel.text = article.title
        articleTextLabel.text = article.text
        
        authorNameLabel.text = article.author.name
        authorSubtitleLabel.text = article.author.subtitle
    
    }

}

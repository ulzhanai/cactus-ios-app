//
//  Article.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/6/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import Foundation

class Article {
    let title: String
    let subtitle: String
    let text: String
    let author: Author
    
    init(title: String, subtitle: String, text:String, author:Author) {
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.author = author
    }
}

//
//  Author.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/16/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import Foundation

//{
//  "name": "Steven Grey",
//  "subtitle": "Professor at the Wharton School",
//  "image": "https://pbs.twimg.com/profile_images/1169919000123518978/37QQ8Una_400x400.jpg"
//}

class Author:Decodable {
    let name:String
    let subtitle:String
    
    init(name:String, subtitle:String){
        self.name = name
        self.subtitle = subtitle
    }
    
}

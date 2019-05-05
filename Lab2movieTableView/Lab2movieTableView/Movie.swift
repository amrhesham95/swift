//
//  Movie.swift
//  Lab2movieTableView
//
//  Created by JETS Mobile Lab - 5 on 5/5/19.
//  Copyright © 2019 ios. All rights reserved.
//

import Foundation
class Movie{
    var title:String
    var image:String
    var rating:String
    var releaseYear:Int
    var genre:[String]
    init(title:String,image:String,rating:String,releaseYear:Int,genre:[String]){
        self.title=title
        self.image=image
        self.rating=rating
        self.releaseYear=releaseYear
        self.genre=genre
    }
}

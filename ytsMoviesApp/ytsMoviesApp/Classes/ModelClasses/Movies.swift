//
//  Movies.swift
//  ytsMoviesApp
//
//  Created by DCMac01 on 11/6/17.
//  Copyright © 2017 DCMac01. All rights reserved.
//

import Foundation

class Movies:NSObject {
    var movieID:Int!
    var movieName:String!
    var movieImage:String!
    var movieYear:String!
    var movieRating:String!
    var movieQuality:String!
    
    convenience init(pdictResponse:[String:AnyObject])
    {
        self.init()
        
        if (pdictResponse["movieID"] != nil){
            movieID = pdictResponse["movieID"] as? Int
        }
        if (pdictResponse["movieName"] != nil){
            movieName = pdictResponse["movieName"] as? String
        }
        if (pdictResponse["movieImage"] != nil){
            movieImage = pdictResponse["movieImage"] as? String
        }
        if (pdictResponse["movieYear"] != nil){
            movieYear = pdictResponse["movieYear"] as? String
        }
        if (pdictResponse["movieRating"] != nil){
            movieRating = pdictResponse["movieRating"] as? String
        }
        if (pdictResponse["movieQuality"] != nil){
            movieQuality = pdictResponse["movieQuality"] as? String
        }
    }
    
    override init() {
        movieID = kInt0
        movieName = kBlank
        movieImage = kBlank
        movieYear = kBlank
        movieRating = kBlank
        movieQuality = kBlank
    }
    
    
}

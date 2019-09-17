//
//  YoutubeModel.swift
//  reactiveJSON
//
//  Created by MyGlamm on 9/17/19.
//  Copyright © 2019 MyGlamm. All rights reserved.
//
//https://hackernoon.com/everything-about-codable-in-swift-4-97d0e18a2999


import UIKit

struct VideoPlaylist : Decodable{
    
    var video : [Video]
    
    enum CodingKeys : String,CodingKey{
        case video = "items"
    }
    
    
}

struct Video : Decodable {
    var videoId : String
    
    var snippet : Snippet
    
    enum CodingKeys : String,CodingKey{
        case videoId = "id"
        case snippet = "snippet"
    }
    
}

struct Snippet : Decodable{
 
    var title : String
    
    var description : String?
    
    var thumbnails : Thumbnails?
    
}

struct Thumbnails : Decodable{
    
    var defaultImage : VideoImage
    
    var mediumImage : VideoImage
    
    var highImage : VideoImage
    
    var standardImage : VideoImage
    
    
    enum CodingKeys : String,CodingKey{
        case defaultImage = "default"
        case mediumImage = "medium"
        case highImage = "high"
        case standardImage = "standard"
        
    }

}

struct VideoImage : Decodable{
    
    var url : String?
    
    
}




struct YoutubeVideoCellData{
    
    var title : String
    
    var desc : String?
    
    var image : UIImage?
    
    
}

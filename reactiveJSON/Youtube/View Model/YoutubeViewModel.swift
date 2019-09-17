//
//  YoutubeViewModel.swift
//  reactiveJSON
//
//  Created by MyGlamm on 9/17/19.
//  Copyright © 2019 MyGlamm. All rights reserved.
//

import UIKit

protocol YoutubeVideoDataDelegate{
  
    func updateList(videos : [YoutubeVideoCellData])
    
}


final class  YoutubeViewModel{
    
    private var youtubeVideoCellData : [YoutubeVideoCellData] = []
    
    private var countOfVideos : Int = 0
    
    func requestVideos(){
        
        NetworkWrapper.sharedInstance.networkDelegate = self
        
    }
    
    func getImageFromURL(url : String,id : String, completion : @escaping (_ result : UIImage?,_ id : String) -> Void){
        
        NetworkWrapper.sharedInstance.getImageFromURL(url: url) { (img) in
            completion(img,id)
        }
        
    }
    
}


extension YoutubeViewModel : NetworkWrapperDelegate{
    
    func didReceiveYoutubePlayListData(data: Data) {
        do {
            
            let videoPlaylist : VideoPlaylist = try JSONDecoder().decode(VideoPlaylist.self, from: data)
            
            for video in videoPlaylist.video{
                
                let cell : YoutubeVideoCellData = YoutubeVideoCellData(title: video.snippet.title, desc: video.snippet.description, image: nil)
                
                if let imageString = video.snippet.thumbnails?.standardImage{
                     
                }
                
                
            }
            
            
        } catch let error {
            
        }
    }
    
}

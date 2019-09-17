//
//  NetworkWrapper.swift
//  reactiveJSON
//
//  Created by MyGlamm on 9/17/19.
//  Copyright © 2019 MyGlamm. All rights reserved.
//

import UIKit

protocol NetworkWrapperDelegate : class {
    func didReceiveYoutubePlayListData(data : Data)
}



final class NetworkWrapper{
    
    static let sharedInstance : NetworkWrapper = NetworkWrapper()
    
    private let baseUrl : String = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet"
    
    private let userKey : String = "AIzaSyCKrVC4PbYLa0S0CmIFj97PdjhwvEcALV4"
    
    weak var networkDelegate : NetworkWrapperDelegate?
    
    
//https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=PLSFwGHU9R1W15_H1hxoeCiYib8aPuPo7Y&key=AIzaSyCKrVC4PbYLa0S0CmIFj97PdjhwvEcALV4
    
    func getVideosData(maxResults : Double = 50,playListID : String = "PLSFwGHU9R1W15_H1hxoeCiYib8aPuPo7Y"){
        
        let urlString : String = "\(baseUrl)&maxResults=\(maxResults)&playlistId=\(playListID)"
        
        if let url : URL = URL(string: urlString){
            hitRequest(url: url, addHeader: true) { (data, error) in
                
                if let data : Data = data{
                    
                    self.networkDelegate?.didReceiveYoutubePlayListData(data: data)
                    
                }
     
            }
        }

   
    }
    
    
    func getImageFromURL(url : String,completion : @escaping (_ result : UIImage?) -> Void){
        
        if let url : URL = URL(string: url){
            
            hitRequest(url: url, addHeader: false) { (data, _) in
                if let data : Data = data{
                    completion(UIImage(data: data))
                }
                else{
                    completion(nil)
                }
            }
            
        }
    }
    
    
    func hitRequest(url : URL,addHeader : Bool,completionHandler : @escaping (Data?,Error?) -> Void)
    {
        
        var urlRequest = URLRequest(url: url)
        
        if addHeader{
            urlRequest.addValue(userKey, forHTTPHeaderField: "key")
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            completionHandler(data,error)
        }.resume()
        
    }
    
    
}

//
//  Model.swift
//  youtube-copy
//
//  Created by Lucas Danelon on 10/06/2020.
//  Copyright © 2020 Lucas Danelon. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videosFetched (_ video:[Video])
}


class Model {
    
    var delegate:ModelDelegate?
    
    func getVideo() {
         // create a URL object
        let url = URL(string: Constant.api_url)
        
        guard url != nil else{
            return
        }
        // get a URLSession
        let session = URLSession.shared
        // get a data task for the URLSession
        let dataTask = session.dataTask(with: url!) { (data, response, erro) in
            
            if erro != nil || data == nil {
                return
            }
            
            do {
                // parsing the data intro the object video
                
                let decoder = JSONDecoder()
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        
                        // call the "videosFetched" methods
                        self.delegate?.videosFetched(response.items!)
                    }
                  }
                 //dump (response)
            } catch {
            }
         }
        // Kick off the task
        
        dataTask.resume()
    }
}

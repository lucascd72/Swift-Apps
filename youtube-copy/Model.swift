//
//  Model.swift
//  youtube-copy
//
//  Created by Lucas Danelon on 10/06/2020.
//  Copyright © 2020 Lucas Danelon. All rights reserved.
//

import Foundation


class Model {
    
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
            
            // parsing the data intro the object video
        }
        // Kick off the task
        
        dataTask.resume()
    }
}

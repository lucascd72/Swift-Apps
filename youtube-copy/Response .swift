//
//  Response .swift
//  youtube-copy
//
//  Created by Lucas Danelon on 12/06/2020.
//  Copyright © 2020 Lucas Danelon. All rights reserved.
//

import Foundation

struct Response: Decodable {
  
 
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        
        case items

        
    }
    
    init(from decoder: Decoder) throws {
        
        let contanier = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try contanier.decode([Video].self, forKey: .items)
     
    }
    
}

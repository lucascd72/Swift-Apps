//
//  VIdeo.swift
//  youtube-copy
//
//  Created by Lucas Danelon on 09/06/2020.
//  Copyright © 2020 Lucas Danelon. All rights reserved.
//

import Foundation

struct Video: Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = ""
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        
        
        case title
        case published = "publishedAt"
        case videoID = "id"
        case description
        case thumbnail = "url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        
        //Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        //Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        //Parse the publish date
        self.published = try snippetContainer.decode(String.self, forKey: .published)
        
        //Parse the thumbnailCntanainer
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        //Parse the High Container
        let highContaniner = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        //Parse the URL
        self.thumbnail = try highContaniner.decode(String.self, forKey: .thumbnail)
        
        //Parse the VideoId
        self.videoId = try container.decode(String.self, forKey: .videoID)
    }
}

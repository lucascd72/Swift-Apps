//
//  Constant.swift
//  youtube-copy
//
//  Created by Lucas Danelon on 09/06/2020.
//  Copyright © 2020 Lucas Danelon. All rights reserved.
//

import Foundation

struct Constant {
    static var api_key = ""
    static var playlist_id = "UCsquXBGEDONI_hKQmPBCJzA"
    static var api_url = "https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=\(Constant.playlist_id)&key=\(Constant.api_key)"
}


//
//  Video.swift
//  Africa
//
//  Created by Philip Al-Twal on 10/17/22.
//

import Foundation

enum VideoPrefix: String {
    case video = "video-"
}

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //Computed Property
    var thumbnail : String {
        return "\(VideoPrefix.video.rawValue)\(id)"
    }
}


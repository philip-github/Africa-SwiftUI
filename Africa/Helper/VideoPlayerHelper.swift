//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Philip Al-Twal on 10/17/22.
//

import Foundation
import AVKit


var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else { return AVPlayer() }
    videoPlayer = AVPlayer(url: url)
    guard videoPlayer != nil else { return AVPlayer() }
    videoPlayer!.volume = 1
    videoPlayer!.play()
    return videoPlayer!
}

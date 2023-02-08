//
//  SocialMedia.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import Foundation

struct SocialMedia: Identifiable {
    var urlString: String
    var channel: SocialMediaChannel
    var coverImage: String
    var headline: String
    var username: String
    var id: String = UUID().uuidString
    
    init(data: [String:Any]) {
        urlString = data[FirebaseKeys.Socials.stringUrl] as? String ?? ""
        let channelString = data[FirebaseKeys.Socials.channel] as? String ?? ""
        channel = SocialMediaChannel.selfFromString(channelString)
        coverImage = data[FirebaseKeys.Socials.bannerImageRef] as? String ?? ""
        headline = data[FirebaseKeys.Socials.headline] as? String ?? ""
        username = data[FirebaseKeys.Socials.username] as? String ?? ""
    }
}
enum SocialMediaChannel {
    
    case linkedIn, gitHub, polywork, unknown
    
    static func getTitle(_ type:SocialMediaChannel) -> String {
        switch type {
        case .linkedIn: return "LinkedIn"
        case .gitHub: return "GitHub"
        case .polywork: return "Polywork"
        case .unknown: return ""
        }
    }
    
    static func selfFromString(_ string: String) -> SocialMediaChannel {
        switch string {
        case "gitHub": return .gitHub
        case "linkedIn": return .linkedIn
        case "polywork": return .polywork
        default: return .unknown
        }
    }
    
    static func getUrlString(_ channel: SocialMediaChannel) -> String {
        switch channel {
        case .gitHub:
            return "https://github.com/twittt"
        case .linkedIn:
            return "https://www.linkedin.com/in/tela-wittig/"
        case .polywork:
            return "https://www.polywork.com/tela_w"
        case .unknown:
            return ""
        }
    }
}

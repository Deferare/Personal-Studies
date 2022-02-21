//
//  User.swift
//  MyRestfulAPI
//
//  Created by Deforeturn on 2/18/22.
//

import Foundation

public struct DTTwitterUser: Codable {
    public var email: String?
    public var id: String?
    public var name: String?
    public var profileImageURL: String?
    public var username: String?
    public var oauthToken: String?
    
    private enum CodingKeys: String, CodingKey {
        case email
        case id = "id_str"
        case name
        case profileImageURL = "profile_image_url"
        case username = "screen_name"
        case oauthToken = "oauth_token"
    }
}

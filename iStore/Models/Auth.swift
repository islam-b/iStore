//
//  Auth.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 8/8/2023.
//

import Foundation


struct TokenResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let expiresAt: String
    let userInfo: UserInfo
}

struct UserInfo:  Codable {
    let id: Int
    let username: String
    let firstName: String
    let lastName: String
}

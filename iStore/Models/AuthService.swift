//
//  AuthService.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 8/8/2023.
//

import Foundation
import Security


class AuthService : BaseService {
    
    static let AccessTokenKey = "com.iStore.accessToken"

    var delegate : AuthServiceDelegate?
    
    func signIn(username: String, password: String) {
        let url = URL(string: "\(baseUrl)/signin")
        var request = URLRequest(url: url!)
        let data = "username=\(username)&password=\(password)".data(using: .utf8)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        performRequest(request) { (response: TokenResponse) in
            self._saveTokenData(response)
            self.delegate?.onUserAuthenticated(response.userInfo)
        } handleError: { error in
            self.delegate?.handleError(error)
        }
    }
    
    func isAuthenticated() -> Bool {
        let token = _loadTokenData()
        return token != nil
    }
    
    private func _saveTokenData(_ data: TokenResponse) {
        do {
            let encoder = JSONEncoder()
            let tokenData = try encoder.encode(data)
            let query: [String: Any] = [
                        kSecClass as String: kSecClassGenericPassword,
                        kSecAttrAccount as String: AuthService.AccessTokenKey,
                        kSecValueData as String: tokenData,
                        kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlockedThisDeviceOnly
                    ]
            let status = SecItemAdd(query as CFDictionary, nil)
        } catch {
            print("Unable to save access token")
        }
    }
    
    private func _loadTokenData() -> TokenResponse? {
        do {
            let query: [String: Any] = [
                        kSecClass as String: kSecClassGenericPassword,
                        kSecAttrAccount as String:  AuthService.AccessTokenKey,
                        kSecMatchLimit as String: kSecMatchLimitOne,
                        kSecReturnData as String: kCFBooleanTrue!,
                        kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlockedThisDeviceOnly
                    ]
            var item: CFTypeRef?
            let decoder = JSONDecoder()
            let status = SecItemCopyMatching(query as CFDictionary, &item)
            if status == errSecSuccess, let tokenData = item as? Data {
                let output = try decoder.decode(TokenResponse.self, from: tokenData)
                return output
            } else {
                print("Unable to load access token")
                return nil
            }
        } catch {
            print("Unable to load access token")
            return nil
        }
    }
    
}

protocol AuthServiceDelegate: BaseServiceDelegate {
    
    func onUserAuthenticated(_ user: UserInfo) -> Void
}


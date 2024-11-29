//
//  KeyChainManager.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/28/24.
//

import Foundation
import Security

public class TokenManager {
    static public let shared = TokenManager()
    let service = "com.festimate.iOS"
    
    private let isFirstLaunchKey = "isFirstLaunch"
    
    private init() {
        if UserDefaults.standard.bool(forKey: isFirstLaunchKey) == false {
            clearKeychainOnFirstLaunch()
            UserDefaults.standard.set(true, forKey: isFirstLaunchKey)
        }
    }

    private func clearKeychainOnFirstLaunch() {
        do {
            try delete()
            print("Keychain data cleared on first launch.")
        } catch {
            print("Failed to clear Keychain on first launch: \(error)")
        }
    }
    
    public func create(value: String) {
        let keychainQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: "accessToken",
            kSecValueData as String: value.data(using: .utf8)!,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlockedThisDeviceOnly
        ]
        
        SecItemDelete(keychainQuery as CFDictionary)
        let status = SecItemAdd(keychainQuery as CFDictionary, nil)
        assert(status == errSecSuccess, "Failed to save access token to Keychain")
    }
    
    public func read() -> String? {
        let keychainQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: "accessToken",
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(keychainQuery as CFDictionary, &result)
        
        if status == errSecSuccess, let data = result as? Data,
           let value = String(data: data, encoding: .utf8) {
            return value
        } else {
            print("Failed to read access token from Keychain - status: \(status)")
            return nil
        }
    }
    
    public func delete() throws {
        let keychainQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: "accessToken"
        ]
        
        let status = SecItemDelete(keychainQuery as CFDictionary)
        if status != errSecSuccess {
            let errorMessage = SecCopyErrorMessageString(status, nil) as String? ?? "Unknown error"
            throw KeychainError.deleteFailed(errorMessage)
        }
    }
}

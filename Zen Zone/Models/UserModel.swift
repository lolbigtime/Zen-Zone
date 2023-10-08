//
//  UserModel.swift
//  Zen Zone
//
//  Created by Tai Wong on 10/5/23.
//

import Foundation
import SwiftUI

class UserModel: ObservableObject {
    @AppStorage("Points") var points = UserDefaults.standard.integer(forKey: "Points")
    @Published var banners: [String] = []
    @Published var badges: [String] = []
    @Published var username: String? {
        didSet {
            saveUsername()
        }
    }
    
    func saveUsername() {
        UserDefaults.standard.set(username, forKey: "Username")
    }
    
    func loadUsername() {
        if let userName = UserDefaults.standard.string(forKey: "Username") {
            username = userName
        }
    }
    
    @Published var profileImage: UIImage? {
        didSet {
            // Save the profile image when it's set
            saveProfileImage()
        }
    }

    // Initialize the UserModel and load data from UserDefaults
    init() {
        loadUsername()
        loadBannersFromUserDefaults()
        loadBadgesFromUserDefaults()
        loadProfileImage()
    }

    private func saveBannersToUserDefaults() {
        if let encodedData = try? JSONEncoder().encode(banners) {
            UserDefaults.standard.set(encodedData, forKey: "banners")
        }
    }

    func loadBannersFromUserDefaults() {
        if let savedData = UserDefaults.standard.data(forKey: "banners"),
            let decodedArray = try? JSONDecoder().decode([String].self, from: savedData) {
            banners = decodedArray
        }
    }

    func addToBanners(banner: String) {
        banners.append(banner)
        saveBannersToUserDefaults()
    }
    
    private func saveBadgesToUserDefaults() {
        if let encodedData = try? JSONEncoder().encode(badges) {
            UserDefaults.standard.set(encodedData, forKey: "badges")
        }
    }

    func loadBadgesFromUserDefaults() {
        if let savedData = UserDefaults.standard.data(forKey: "badges"),
            let decodedArray = try? JSONDecoder().decode([String].self, from: savedData) {
            badges = decodedArray
        }
    }

    func addToBadges(badge: String) {
        badges.append(badge)
        loadBadgesFromUserDefaults()
    }

    // Function to save the profile image to UserDefaults
    private func saveProfileImage() {
        if let imageData = profileImage?.pngData() {
            UserDefaults.standard.set(imageData, forKey: "ProfileImageData")
        } else {
            UserDefaults.standard.removeObject(forKey: "ProfileImageData")
        }
    }

    // Function to retrieve the profile image from UserDefaults
    func loadProfileImage() {
        if let imageData = UserDefaults.standard.data(forKey: "ProfileImageData") {
            self.profileImage = UIImage(data: imageData)
        }
    }
}

//
//  ProfileHeaderViewModel.swift
//  TwitterTutorial
//
//  Created by Stephen Dowless on 2/2/20.
//  Copyright © 2020 Stephan Dowless. All rights reserved.
//

import UIKit

enum ProfileFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var description: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}

struct ProfileHeaderViewModel {
    
    private let user: User
    
    let usernameText: String
    
    var actionButtonTitle: String {
        if user.isCurrentUser {
            return "Edit Profile"
        }
        
        if !user.isFollowed {
            return "Follow"
        }
        
        if user.isFollowed {
            return "Following"
        }
        
        return "Loading"
    }
    
    init(user: User) {
        self.user = user
        
        self.usernameText = "@" + user.username
    }
    
    func followersString(valueColor: UIColor, textColor: UIColor) -> NSAttributedString {
        return attributedText(withValue: user.stats?.followers ?? 0, text: "followers",
                              valueColor: valueColor, textColor: textColor)

    }
    
    func followingString(valueColor: UIColor, textColor: UIColor) -> NSAttributedString {
        return attributedText(withValue: user.stats?.following ?? 0, text: "following",
                              valueColor: valueColor, textColor: textColor)
    }
    
    fileprivate func attributedText(withValue value: Int, text: String,
                                    valueColor: UIColor, textColor: UIColor) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value)",
            attributes: [.font : UIFont.boldSystemFont(ofSize: 14), .foregroundColor: valueColor])
        
        attributedTitle.append(NSAttributedString(string: " \(text)",
                                                  attributes: [.font: UIFont.systemFont(ofSize: 14),
                                                               .foregroundColor: textColor]))
        return attributedTitle
    }
}

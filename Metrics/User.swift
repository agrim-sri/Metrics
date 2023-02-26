//
//  User.swift
//  Metrics
//
//  Created by Agrim Srivastava on 25/02/23.
//

import Foundation
import UIKit


class User {
    var username: String
    //var fullName: String
    //var email: String
    var profileImage: String
    //var posts: [Post]

    init(username: String, /* fullName: String */ /* email: String */ profileImageURL: String /* posts: [Post] */) {
        self.username = username
        //self.fullName = fullName
        //self.email = email
        self.profileImage = profileImageURL
        //self.posts = posts
    }
}


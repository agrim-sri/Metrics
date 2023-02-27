//
//  post.swift
//  Metrics
//
//  Created by Agrim Srivastava on 25/02/23.
//

import Foundation
import UIKit

/*
class User {
    var username: String
    //var fullName: String
//    var email: String
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
*/

struct User {
    var username: String
    var profileImage: String
    var location: String
}

struct Post {
    
    var createdBy: User
    //var timeAgo: String?
    //var caption: String?
    var image: String
    //var numberOfLikes: Int?
    //var numberOfComments: Int?
    //var numberOfShares: Int?
    
    static func fetchPosts() -> [Post] {
        var posts = [Post]()
        
        let agrim = User(username: "Agrim", profileImage: "macLabPhoto", location: "Gurgaon")
        let post1 = Post(createdBy: agrim, image: "Macbook")
        
        return posts
        
    }
}

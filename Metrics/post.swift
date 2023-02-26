//
//  post.swift
//  Metrics
//
//  Created by Agrim Srivastava on 25/02/23.
//

import Foundation
import UIKit

struct Post {
    
    var createdBy: User
    //var timeAgo: String?
    //var caption: String?
    var image: String
    //var numberOfLikes: Int?
    //var numberOfComments: Int?
    //var numberOfShares: Int?
    
    static func fetchPost() -> [Post] {
        var posts = [Post]()
        
        let agrim = User(username: "Agrim", profileImageURL: "macLabPhoto")
        let post1 = Post(createdBy: agrim, image: "Macbook")
        
        return posts
        
    }
}

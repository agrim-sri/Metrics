//
//  FYPViewController.swift
//  Metrics
//
//  Created by Agrim Srivastava on 20/02/23.
//

import UIKit

class FYPViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.tableView.dataSource = self
//        self.tableView.delegate = self
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        if let posts = posts {
//            return posts.count
//        }
//
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if posts != nil {
//            return 1
//        }
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: indexPath) as! FYPViewController
//
//        cell.posts = posts[indexPath.row]
//        cell.selectionStyle = .none
//
//        return cell
//    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

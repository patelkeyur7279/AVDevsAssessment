//
//  UserDetailsViewController.swift
//  AVDevsAssessment
//
//  Created by Keyur Patel on 18/12/22.
//

import UIKit

class UserDetailsViewController: UIViewController {

    var user: User!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userStatusImageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmailAddress: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userImageView.image = UIImage(named: user.gender == .male ? "male" : "female")
        userStatusImageView.tintColor = user.status == .active ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        userName.text = user.name
        userEmailAddress.text = user.email
        
        print("User: \(user)")
        navigationItem.title = user.name
        
    }
    
}

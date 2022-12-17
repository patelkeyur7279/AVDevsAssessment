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
        userEmailAddress.delegate = self
        
        navigationItem.title = user.name
        
    }
    
}

// Note: I'm not able to test below code in simulator So, if anything wrong with below code then please ignore And nothing happens with requested functionality
extension UserDetailsViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith url: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print("URL: \(url)")
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        return true
    }
    
}

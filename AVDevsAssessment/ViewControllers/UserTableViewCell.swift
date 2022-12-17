//
//  UserTableViewCell.swift
//  AVDevsAssessment
//
//  Created by Keyur Patel on 18/12/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    
    @IBOutlet weak var genderImageView: UIImageView!
    @IBOutlet weak var userStatusImageView: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userEmailLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateCellView(user: User) {
        genderImageView.image = UIImage(named: user.gender == .male ? "male" : "female")
        userStatusImageView.tintColor = user.status == .active ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        userNameLbl.text = user.name
        userEmailLbl.text = user.email
    }
    
}

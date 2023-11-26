//
//  UserCell.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import UIKit

protocol UserCellProtocol {
    var userName: String {get}
    var userEmail: String {get}
}

class UserCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    func configureUI(data: UserCellProtocol) {
        email.text = data.userEmail
        name.text = data.userName
    }
}

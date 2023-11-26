//
//  UserDetailsCell.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import UIKit
protocol UserDetailsCellProtocol {
    var userName: String {get}
    var userEmail: String {get}
    var userCompany: String {get}
    var userPhone: String {get}
    var userAddress: String {get}
}

class UserDetailsCell: UITableViewCell {
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var username: UILabel!    
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    
    func configureUI (data: UserDetailsCellProtocol) {
        username.text = data.userName
        email.text = data.userEmail
        address.text = data.userAddress
        phone.text = data.userPhone
        company.text = data.userCompany
    }
}

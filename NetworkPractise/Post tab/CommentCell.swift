//
//  CommentCell.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import UIKit

protocol CommentCellProtocol {
    var commentName: String {get}
    var commentEmail: String {get}
    var commentBody: String {get}
}

class CommentCell: UITableViewCell {

    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var name: UILabel!
    
    func configureUI (data: CommentCellProtocol) {
        body.text = data.commentBody
        name.text = data.commentName
        email.text = data.commentEmail
    }
}

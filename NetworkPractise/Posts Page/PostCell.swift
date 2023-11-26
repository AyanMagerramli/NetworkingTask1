//
//  PostCell.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import UIKit
protocol PostCellProtocol{
    var postBody: String {get}
    var postTitle: String {get}
}

class PostCell: UITableViewCell {

    @IBOutlet weak var postBody: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    
    func configureUI(data: PostCellProtocol) {
        postBody.text = data.postBody
        postTitle.text = data.postTitle
    }
    
}

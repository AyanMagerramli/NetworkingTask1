//
//  PhotoDetailCell.swift
//  NetworkPractise
//
//  Created by Ayan on 27.11.23.
//

import UIKit
import SDWebImage

protocol PhotoDetailCellProtocol {
    var userPhoto: String {get}
}

class PhotoDetailCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    
    func configureUI(data: PhotoDetailCellProtocol) {
        photoView.sd_setImage(with: URL(string: data.userPhoto), completed: nil)
    }
}

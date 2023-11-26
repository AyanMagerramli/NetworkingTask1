//
//  PhotoCell.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import UIKit
import SDWebImage

protocol PhotoCellProtocol {
    var photoView: String {get}
    var titleLabel: String {get}
}

class PhotoCell: UITableViewCell {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    func configureUI(data: PhotoCellProtocol) {
        photo.sd_setImage(with: URL(string: data.photoView), completed: nil)
        title.text = data.titleLabel
    }
}

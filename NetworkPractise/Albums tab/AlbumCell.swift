//
//  AlbumCell.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import UIKit
protocol AlbumCellProtocol{
    var albumName: String {get}
}

class AlbumCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    func configureUI(data: AlbumCellProtocol) {
        name.text = data.albumName
    }
}

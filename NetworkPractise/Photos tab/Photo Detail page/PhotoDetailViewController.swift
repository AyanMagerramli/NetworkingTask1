//
//  PhotoDetailViewController.swift
//  NetworkPractise
//
//  Created by Ayan on 27.11.23.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    var viewModel = PhotoDetailViewModel(networkManager: NetworkManager.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.getPhotos { [weak self] in
            DispatchQueue.main.async {
                self?.table.reloadData()
            }
        }
    }
    
    func configureUI() {
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "PhotoDetailCell", bundle: nil), forCellReuseIdentifier: "PhotoDetailCell")
    }
}

extension PhotoDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoDetailCell", for: indexPath) as! PhotoDetailCell
        cell.configureUI(data: viewModel.photos[indexPath.row])
        return cell
    }
}

extension PhotoDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.frame.height
    }
}

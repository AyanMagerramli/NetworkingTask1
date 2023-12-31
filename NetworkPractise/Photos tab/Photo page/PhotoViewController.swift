//
//  PhotoViewController.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    let viewModel = PhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.getPhotos { [weak self] in
            DispatchQueue.main.async {
                self?.table.reloadData()
            }
        }
    }
    
    func configureUI () {
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "PhotoCell", bundle: nil), forCellReuseIdentifier: "PhotoCell")
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 30.0
    }
}

extension PhotoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.configureUI(data: viewModel.photos[indexPath.row])
        return cell
    }
}

extension PhotoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "PhotoDetailViewController") as! PhotoDetailViewController
        navigationController?.show(controller, sender: nil)
        controller.viewModel = PhotoDetailViewModel(id: viewModel.photos[indexPath.row].id ?? 0)
    }
}

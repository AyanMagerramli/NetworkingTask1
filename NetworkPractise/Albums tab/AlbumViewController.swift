//
//  AlbumViewController.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import UIKit

class AlbumViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    let viewModel = AlbumViewModel(networkManager: NetworkManager.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.getAlbums { [weak self] in
            DispatchQueue.main.async {
                self?.table.reloadData()
            }
        }
    }
    
    func configureUI() {
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "AlbumCell", bundle: nil), forCellReuseIdentifier: "AlbumCell")
    }
}

extension AlbumViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
        cell.configureUI(data: viewModel.albums[indexPath.row])
        return cell
    }
}

extension AlbumViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}

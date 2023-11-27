//
//  UserDetailsViewController.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import UIKit

class UserDetailsViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    var viewModel = UserDetailsViewModel(userID: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.getUserDetails { [weak self] in
            DispatchQueue.main.async {
                self?.table.reloadData()
            }
        }
    }
    
    func configureUI() {
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "UserDetailsCell", bundle: nil), forCellReuseIdentifier: "UserDetailsCell")
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 20.0
    }
}

extension UserDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.userDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailsCell", for: indexPath) as! UserDetailsCell
        cell.configureUI(data: viewModel.userDetails[indexPath.row])
        navigationItem.title = viewModel.userDetails[indexPath.row].userName
        return cell
    }
}

extension UserDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

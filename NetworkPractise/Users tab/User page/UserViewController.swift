//
//  UserViewController.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    let viewModel = UserViewModel(networkManager: NetworkManager.shared)
    let viewModel2 = UserDetailsViewModel(networkManager: NetworkManager.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.getUsers { [weak self] in
            DispatchQueue.main.async {
                self?.table.reloadData()
            }
        }
    }
    
    func configureUI() {
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }
}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.configureUI(data: viewModel.users[indexPath.row])
        return cell
    }
}

extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(identifier: "UserDetailsViewController") as! UserDetailsViewController
        navigationController?.show(controller, sender: nil)
        controller.viewModel = viewModel2
        viewModel2.userID = viewModel.users[indexPath.row].id ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

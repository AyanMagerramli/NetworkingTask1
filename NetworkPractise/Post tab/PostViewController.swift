//
//  ViewController.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    let viewModel = PostViewModel(networkManager: NetworkManager.shared)
    let viewModel2 = CommentsViewModel(networkManager: NetworkManager.shared)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.getPostItems {
            DispatchQueue.main.async {[weak self] in
                self?.table.reloadData()
            }
        }
    }
    
    func configureUI() {
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
    }
}

extension PostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let postId = viewModel.postItems?[indexPath.row].id else {
                   print("postId is nil")
                   return
               }
               print("Setting secondViewModel.postId to \(postId)")
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(CommentsViewController.self)") as! CommentsViewController
        navigationController?.show(controller, sender: nil)
        
        controller.viewModel = viewModel2
        viewModel2.postId = postId
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

extension PostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.postItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.configureUI(data: (viewModel.postItems?[indexPath.row])!)
        return cell
    }
}

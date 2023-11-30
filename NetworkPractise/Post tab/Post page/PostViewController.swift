//
//  ViewController.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import UIKit

class PostViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    let viewModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.getPostItems {
            DispatchQueue.main.async { [weak self] in
                self?.table.reloadData()
            }
        }
    }
    
    //MARK: creating new post {POST}
    @IBAction func addButtontapped(_ sender: Any) {
        viewModel.createPosts {
            DispatchQueue.main.async { [weak self] in
                self?.table.reloadData()
            }
        }
    }
    
    func configureUI() {
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 30.0
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
        controller.viewModel = CommentsViewModel(postId: viewModel.postItems?[indexPath.row].id ?? 0)
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

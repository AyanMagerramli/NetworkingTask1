//
//  ViewController.swift
//  NetworkPractise
//
//  Created by Ayan on 29.11.23.
//

import UIKit
import Alamofire

class AlamofireVC: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    private let viewModel = AlamofireViewModel()
    var postItems: [PostResponseModel]?
    let baseURL = "https://jsonplaceholder.typicode.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.getObjects {
            DispatchQueue.main.async { [weak self] in
                self?.table.reloadData()
            }
        }
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        viewModel.createObjects {
            DispatchQueue.main.async { [weak self] in
                self?.table.reloadData()
            }
        }
    }
    
    func configureUI() {
        table.delegate = self
        table.dataSource = self
    }
}

extension AlamofireVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AlamofireVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.postItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celll", for: indexPath)
        cell.textLabel?.text = viewModel.postItems?[indexPath.row].title ?? ""
        return cell
    }
}

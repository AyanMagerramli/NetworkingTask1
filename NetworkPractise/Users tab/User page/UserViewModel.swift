//
//  UserViewModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation

final class UserViewModel {
    var users = [UserInfo]()
    
    private enum Constant: String {
        case userParam = "users"
    }
    
    func getUsers(completion: @escaping ()->Void) {
        NetworkManager.shared.getObjects(
            type: [UserInfo].self,
            urlParam: Constant.userParam.rawValue)
        {
            [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

//
//  UserDetailsViewModel.swift
//  NetworkPractise
//
//  Created by Ayan on 26.11.23.
//

import Foundation
final class UserDetailsViewModel {
    var userDetails = [UserInfo]()
    var userID: Int
    
    init(userID: Int) {
        self.userID = userID
    }
    
    private enum Constant: String {
        case userParam = "users?id="
    }
    
    func getUserDetails(completion: @escaping ()-> Void) {
        NetworkManager.shared.getObjects(
            type: [UserInfo].self,
            urlParam: Constant.userParam.rawValue + "\(userID)")
        {
            [weak self] result in
            switch result {
            case .success(let users):
                self?.userDetails = users
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

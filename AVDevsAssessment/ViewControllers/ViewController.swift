//
//  ViewController.swift
//  AVDevsAssessment
//
//  Created by Keyur Patel on 16/12/22.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    // MARK: Global Variables
    private var users = [User]()
    private var pagination: Pagination?
    private var cancellables = Set<AnyCancellable>()
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getUsers(nil)
    }
    
    // MARK: API Call
    private func getUsers(_ page: Int?) {
        
        APIService.shared.sessionManager.request(APIRouters.users(page: page ?? 1))
            .publishDecodable(type: UsersResponse.self)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (response) in
                print("Response: \(response)")
                if let result = response.value {
                    self?.users = result.data ?? [User]()
                    self?.pagination = result.meta?.pagination
                    self?.tableView.reloadData()
                } else if let error = response.error {
                    print("Error: \(error.errorDescription)")
                }
            }
            .store(in: &cancellables)
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell {
            let user = self.users[indexPath.row]
            print("Cell: \(user)")
            cell.updateCellView(user: user)
            return cell
        } else {
            return UserTableViewCell()
        }
    }
    
}

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
        
        users.removeAll()
        getUsers(nil)
        
        navigationItem.title = "Users"
    }
    
    // MARK: API Call
    private func getUsers(_ page: Int?) {
        
        APIService.shared.sessionManager.request(APIRouters.users(page: page ?? 1))
            .publishDecodable(type: UsersResponse.self)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (response) in
                print("Response: \(response)")
                if let result = response.value {
                    self?.users.append(contentsOf: result.data ?? [User]())
                    self?.pagination = result.meta?.pagination
                    self?.tableView.reloadData()
                } else if let error = response.error {
                    print("Error: \(error.errorDescription ?? "Something Wrong!!!")")
                }
            }
            .store(in: &cancellables)
        
    }

}

// MARK: TableView Functions
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell {
            let user = self.users[indexPath.row]
            cell.updateCellView(user: user)
            return cell
        } else {
            return UserTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let user = self.users[indexPath.row]
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = self.users.count - 1
        if indexPath.row == lastItem {
            guard let data = pagination else { return }
            if (data.page ?? 1) < (data.pages ?? 1) {
                getUsers(((data.page ?? 1) + 1))
            }
        }
    }
}

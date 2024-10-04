//
//  UserDetailsViewController.swift
//  shopeCard
//
//  Created by SID on 03/10/2024.
//

import UIKit

class UserDetailsViewController: UIViewController {

    
    @IBOutlet weak var userTableView: UITableView!
    private var userViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
    }
    private func setupTableView() {
        userTableView.register(UINib(nibName: Identifiers.USER_XiB_NANME, bundle: nil), forCellReuseIdentifier: Identifiers.USER_CELL_ID)
    }
    
    
    private func bindViewModel() {
        userViewModel.fetchProducts()
        userViewModel.onProductsFetched = { [weak self] in
            self?.reloadTableView()
        }
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.userTableView.reloadData()
        }
    }
}
extension UserDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.USER_CELL_ID, for: indexPath) as? UserDetailsTableViewCell else {
            return UITableViewCell()
        }
        
        let user = userViewModel.users[indexPath.row]
        cell.configure(with: user)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Identifiers.CELL_HEIGHT_FOR_USER
    }
}

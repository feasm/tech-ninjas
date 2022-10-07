// 
//  SelectUsersViewController.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 06/09/22.
//

import UIKit
import SwiftUI

import TNCore
import TNUI

class SelectUsersViewController: UIViewController {
    
    private var viewModel: SelectUsersViewModel
    lazy private var contentView: SelectUsersView = {
        SelectUsersView()
    }()
    
    init(viewModel: SelectUsersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
        title = "Select Users"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getUsers()
    }
    
    private func setup() {
        setupTableView()
        setupBindings()
    }
    
    private func setupBindings() {
        viewModel.didUpdateUsers = { [weak self] in
            self?.contentView.tableView.reloadData()
        }
        
        contentView.searchTextField.addTarget(self, action: #selector(onUpdateSearchText), for: .editingChanged)
        contentView.selectButton.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
    }
    
    @objc private func onUpdateSearchText() {
        let searchText = contentView.searchTextField.text ?? ""
        viewModel.filterUsers(text: searchText)
    }
    
    @objc private func onTapButton() {
        viewModel.didTapSelectButton()
    }

}

extension SelectUsersViewController: UITableViewDataSource {

    private func setupTableView() {
        let tableView = contentView.tableView
        tableView.register(UserSummaryViewCell.self, forCellReuseIdentifier: "UserSummaryViewCell")
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredUserModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UserSummaryViewCell()
        let model = viewModel.filteredUserModels[indexPath.row]
        cell.setup(model, index: indexPath.row)
        cell.userSummaryView.delegate = self

        return cell
    }
}

extension SelectUsersViewController: TNUserSummaryViewDelegate {
    func didUpdateSwitch(index: Int, value: Bool) {
        viewModel.selectUser(index: index, isSelected: value)
    }
}

struct SelectUsersViewController_Previews: PreviewProvider {
    static var previews: some View {
        let service = SelectUsersServiceMock()
        let viewModel = SelectUsersViewModelImpl(service: service)
        ViewControllerPreview {
            SelectUsersViewController(viewModel: viewModel)
        }
    }
}

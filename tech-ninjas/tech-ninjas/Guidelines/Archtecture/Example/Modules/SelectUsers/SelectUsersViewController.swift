// 
//  SelectUsersViewController.swift
//  tech-ninjas
//
//  Created by Felipe Alexander Da Silva Melo on 06/09/22.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftUI

import TNCore
import TNUI

// View segregada em duas camadas
// Controller -> Gerenciar inputs e outputs do usuário
// View -> Montar o layout
class SelectUsersViewController: UIViewController {
    
    private let viewModel: SelectUsersViewModel
    private var contentView: SelectUsersView?
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: SelectUsersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        contentView = SelectUsersView()
        view = contentView
        title = "Select Users"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        setupTableView()
        setupBindings()
    }
    
    private func setupBindings() {
        /*
         viewModel
            .output
            .onFilter
            .drive { [weak self] text in
                // do something with text
            }
            .disposed(by: disposeBag)
         */
    }

}

class UserSummaryViewCell: UITableViewCell {
    
    lazy var userSummaryView: TNUserSummaryView = {
        let view = TNUserSummaryView()
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UserSummaryViewCell: ViewCoded {
    func buildViewHierarchy() {
        addSubview(userSummaryView)
    }
    
    func setupConstraints() {
        userSummaryView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func addAdditionalConfiguration() {
        
    }
}

extension SelectUsersViewController: UITableViewDataSource {
    private func setupTableView() {
        let tableView = contentView?.tableView
        tableView?.register(UserSummaryViewCell.self, forCellReuseIdentifier: "UserSummaryViewCell")
        tableView?.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UserSummaryViewCell()
        
        return cell
    }
}

struct SelectUsersViewController_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SelectUsersViewModelImpl()
        ViewControllerPreview {
            SelectUsersViewController(viewModel: viewModel)
        }
    }
}

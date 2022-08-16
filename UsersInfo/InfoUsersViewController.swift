//
//  InfoUsersViewController.swift
//  UsersInfo
//
//  Created by Maksim Malofeev on 16/08/2022.
//

import UIKit

class InfoUsersViewController: UIViewController {

    // MARK: - Properies

    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray
        image.layer.cornerRadius = 100
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var infoTable: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.backgroundColor = .white
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .edit,
            target: nil,
            action: nil)
        setupHierarhy()
        setConstraints()
        infoTable.dataSource = self
    }

    // MARK: - Private func

    private func setupHierarhy() {
        view.addSubview(avatarImage)
        view.addSubview(infoTable)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            avatarImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: 200),
            avatarImage.heightAnchor.constraint(equalToConstant: 200),

            infoTable.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 30),
            infoTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            infoTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            infoTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension InfoUsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Maksim"
        return cell
    }


}

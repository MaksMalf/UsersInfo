import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Users"
        tableView.dataSource = self
        tableView.delegate = self
        setupHierarhy()
        setLayout()
    }

    // MARK: - Create UI
    
    private var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Print your name here"
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    private var pressButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        button.setTitle("Press", for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .white
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    // MARK: - Private func

    private func setupHierarhy() {
        view.addSubview(textField)
        view.addSubview(pressButton)
        view.addSubview(tableView)
    }

    private func setLayout() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textField.heightAnchor.constraint(equalToConstant: 40),

            pressButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            pressButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            pressButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            pressButton.heightAnchor.constraint(equalToConstant: 40),

            tableView.topAnchor.constraint(equalTo: pressButton.bottomAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Maksim"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = InfoUsersViewController()
        navigationController?.pushViewController(destination, animated: true)
    }
}

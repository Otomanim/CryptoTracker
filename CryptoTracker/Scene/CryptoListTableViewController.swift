//
//  CryptoListTableViewController.swift
//  CryptoTracker
//
//  Created by Evandro Rodrigo Minamoto on 04/11/21.
//
// API KEY E20B88D5-204A-4656-886D-D47CFE59CC49
import UIKit

final class CryptoListTableViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.indentifier)
        tableView.backgroundView = stateDescriptionLabel
        return tableView
    }()
    private let stateDescriptionLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemGray
        label.text = "Loading Cryptos...."
        
        return label
    }()
    
    private let viewModel = CryptoListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
        setup()
        setupViewModel()

    }
    func setupViewModel() {
        viewModel.stateChaged = { [weak self] in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.stateDescriptionLabel.text = self.viewModel.stateDescription
            
            }
        }
        viewModel.loadCryptos()
    }
}

extension CryptoListTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.indentifier, for: indexPath) as? CryptoTableViewCell else {
            return UITableViewCell()
        }
//        cell.configure(with: CryptoCellModel(name: "BITCOIN",
//                                             symbol: "BTC",
//                                             price: 10))
        
        let model = viewModel.modelForRow(at: indexPath.row)
        cell.configure(with: model)
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
}

extension CryptoListTableViewController: ViewCode{
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func addConstraints() {
        tableView.fillSuperview()
    }
    
    func additionalConfiguration() {
        title = "Cripto Tracker"
    }
    
    
}

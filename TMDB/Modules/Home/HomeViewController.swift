//
//  HomeViewController.swift
//  TMDB
//
//  Created by Yaffi Azmi on 03/08/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "azmi"
        return cell
    }
}

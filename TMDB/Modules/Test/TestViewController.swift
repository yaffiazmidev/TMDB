//
//  TestViewController.swift
//  TMDB
//
//  Created by Yaffi Azmi on 06/08/21.
//

import UIKit
import RxSwift
import RxCocoa

struct Product {
    let imageName, name, price: String
}

class ProductViewModel {
    
    let items = PublishSubject<[Product]>()
    
    func fetchProductList() {
        let productArray = [
            Product(imageName: "mac", name: "MacBook", price: "1500"),
            Product(imageName: "iphone", name: "iPhone Xs", price: "1200"),
            Product(imageName: "watch", name: "iWatch", price: "300"),
            Product(imageName: "ipad", name: "iPad", price: "1100"),
            Product(imageName: "iphone", name: "iPhone X", price: "999")
        ]
        
        items.onNext(productArray)
        items.onCompleted()
    }
    
}

class TestViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        return table
    }()
    
    private let bag = DisposeBag()
    private let viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.rx.setDelegate(self).disposed(by: bag)
        
        bindTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func bindTableView() {
//        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        
        
        viewModel.items.bind(to: tableView.rx.items(cellIdentifier: ProductTableViewCell.identifier,
                                                    cellType: ProductTableViewCell.self)) { (row,item,cell) in
            //                cell.item = item
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(Product.self).subscribe(onNext: { item in
            print("SelectedItem: \(item.name)")
        }).disposed(by: bag)
        
        viewModel.fetchProductList()
    }
}

extension TestViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

//
//  MainViewController.swift
//  8homework3m
//
//  Created by mavluda on 1/4/23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    
    private var contacts = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
    
        searchBar.returnKeyType = .default
        searchBar.backgroundColor = .systemGray6
        searchBar.placeholder = "Search"
        let micImage = UIImageView(image: UIImage(systemName: "mic.fill"))
        micImage.tintColor = .lightGray
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(70)
        }
        searchBar.addSubview(micImage)
        micImage.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(22)
        }
        
        searchBar.searchTextField.clearButtonMode = .never
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorColor = .clear
        
        initData()
    }
    
    func initData(){
        contacts.addContact(name: "Nurdin Aidarov", number: "+996777666", image: "person")
        contacts.addContact(name: "Bektur Aibekov", number: "+996777666", image: "bell")
        contacts.addContact(name: "Aidos Bekmuratov", number: "+996777666", image: "envelope")
        contacts.addContact(name: "Alex Bord", number: "+996777666", image: "envelope.circle")
        contacts.addContact(name: "Mark Spencer", number: "+996777666", image: "printer")
        contacts.addContact(name: "Selena Gomez", number: "+996777666", image: "keyboard")
        contacts.addContact(name: "Killian Murphy", number: "+996777666", image: "scanner")
        contacts.addContact(name: "Steve Jobs", number: "+996777666", image: "faxmachine")
        
        tableView.reloadData()
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.getCount() + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row % 2 == 0{
            cell.backgroundColor = .systemGray6
        }
        
        if indexPath.row == 0{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            cell.imageView?.image = UIImage(systemName: "person")
            cell.textLabel?.text = "Mavlyuda"
            cell.detailTextLabel?.text = "My number: +996999777888"
        }else{
            cell.textLabel?.text = contacts.getModel(index: indexPath.row - 1).name
        }
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0{
            let vc = DetailViewController()
            
            vc.image = contacts.getModel(index: indexPath.row - 1).image
            vc.name = contacts.getModel(index: indexPath.row - 1).name
            vc.number = contacts.getModel(index: indexPath.row - 1).number
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


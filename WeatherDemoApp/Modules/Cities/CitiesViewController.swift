//
//  CitiesViewController.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import UIKit

protocol CitiesInterface: AnyObject {
    func setTableView(provider: CitiesTableViewProvider)
    func reloadData()
}

class CitiesViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: Private properties
    private var presenter: CitiesPresentation!
    private let searchController = UISearchController(searchResultsController: nil)

    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        setupSearchBar()
        presenter.onViewDidLoad()
    }

    
    //MARK: Public methods
    func setPresenter(_ presenter: CitiesPresenter) {
        self.presenter = presenter
    }
    
    
    //MARK: Private methods
    private func setupTableView() {
        tableView.register(CityTableViewCell.identifier)
        tableView.rowHeight = 80
    }
    
    private func setupNavigationBar() {
        navigationItem.title = NSLocalizedString("Cities", comment: "")
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    private func setupSearchBar() {
        if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField,
            let iconView = textField.leftView as? UIImageView {
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = UIColor.lightGray
        }
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = .white
        searchController.searchBar.searchTextField.textColor = .white
        searchController.searchBar.searchTextField.keyboardAppearance = .dark
    }

}


//MARK: CitiesInterface
extension CitiesViewController: CitiesInterface {
    
    func setTableView(provider: CitiesTableViewProvider) {
        tableView.dataSource = provider
        tableView.delegate = provider
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}


//MARK: - UISearchBarDelegate
extension CitiesViewController: UISearchControllerDelegate, UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        presenter.onSearching(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.resignFirstResponder()
        presenter.onStopSearching()
    }
}

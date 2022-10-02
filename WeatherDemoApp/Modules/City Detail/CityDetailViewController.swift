//
//  CityDetailViewController.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import UIKit


protocol CityDetailInterface: AnyObject {
    func setTableView(provider: CityDetailTableViewProvider)
    func reloadData()
    func setHeader(image: UIImage)
    func scrollViewDidScroll()
}


class CityDetailViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Private properties
    private var presenter: CityDetailPresentation!
    

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
        setupTableView()
        configureViews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    //MARK: Public methods
    func setPresenter(_ presenter: CityDetailPresenter) {
        self.presenter = presenter
    }

    
    //MARK: Private methods
    private func setupTableView() {
        tableView.register(WeatherTableViewCell.identifier)
        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height / 3))
        header.imageView.alpha = 0
        tableView.tableHeaderView = header
        
    }
    
    private func configureViews() {
        backView.layer.cornerRadius = 9
        backView.backgroundColor = .black.withAlphaComponent(0.5)
    }
    
    
    //MARK: Actions
    @IBAction func onBackButtonAction(_ sender: UIButton) {
        presenter.onDismissAction()
    }
   
}

extension CityDetailViewController: CityDetailInterface {
    func setTableView(provider: CityDetailTableViewProvider) {
        tableView.dataSource = provider
        tableView.delegate = provider
    }
    
    func reloadData() {
        tableView.reloadData()
    }

    func setHeader(image: UIImage) {
        guard let header = tableView.tableHeaderView as? StretchyTableHeaderView else { return }
        header.imageView.image = image
        UIView.animate(withDuration: 0.3) {
            header.imageView.alpha = 1
        }
    }
    
    func scrollViewDidScroll() {
        guard let header = tableView.tableHeaderView as? StretchyTableHeaderView else { return }
        header.scrollViewDidScroll(tableView)
    }
}




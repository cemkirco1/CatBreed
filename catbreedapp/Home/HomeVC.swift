//
//  HomeVC.swift
//  catbreedapp
//
//  Created by Cem Kırkoyun on 4.05.2022.
//
import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var vm = HomeVM()

    private var searchText: String? {
        didSet {
            if searchText == "" {
                vm.getBreedsList()
                self.tableView.reloadData()
            }else {
                vm.getBreedWithSearchText(searchText: searchText)
            }
        }
    }

    
    private var response : [BreedsResponse]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        vm.getBreedsList()
        setDelegatesSelf()
    }
    
    private func setDelegatesSelf() {
        vm.delegate = self
        searchBar.delegate = self
    }
    
    private func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView?.registerCells([HomePageCell.self])
    }
    
    @IBAction func favoritesBttnClicked(_ sender: Any) {
    }
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageCell", for: indexPath) as! HomePageCell
        cell.setCell(breed: response?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailVC(nibName: "DetailVC", bundle: nil)
        vc.vm = DetailVM(breed: response?[indexPath.row])
        self.animateNavigate(vc: vc)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.count ?? .zero
    }
    
}

extension HomeVC: HomeVMDelegate {
    func didGetBreedWithSearchText(breed: [BreedsResponse]?) {
        response = breed
    }
    
    func didGetBreedsList(breeds: [BreedsResponse]?) {
        if breeds?.count != 0 {
            response = breeds
        }
    }
}

extension HomeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
    }
}

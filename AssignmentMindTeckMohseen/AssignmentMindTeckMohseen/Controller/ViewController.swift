//
//  ViewController.swift
//  AssignmentMindTeckMohseen
//
//  Created by Mohseen Shaikh on 21/08/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var images: [String] = ["flower1", "flower2", "flower3","flower4","flower5",
                            "flower1", "flower2", "flower3","flower4","flower5"]
    var items: [String] = ["flower1", "flower2", "flower3", "flower4", "flower5",
                           "flower6", "flower7", "flower8", "flower9", "flower10"]
    
    var images1: [String] = ["nature1", "nature2", "nature3","nature4","nature5",
                             "nature1", "nature2", "nature3","nature4","nature5"]
    var items1: [String] = ["nature1", "nature2", "nature3", "nature4", "nature5",
                            "nature6", "nature7", "nature8", "nature9", "nature10"]
    
    var images2: [String] = ["birds1", "birds2", "birds3","birds4","birds5",
                             "birds1", "birds2", "birds3","birds4","birds5"]
    var items2: [String] = ["birds1", "birds2", "birds3", "birds4", "birds5",
                            "birds6", "birds7", "birds8","birds9","birds10"]
    
    var images3: [String] = ["car1", "car2", "car3","car4","car5",
                             "car1", "car2", "car3","car4","car5"]
    var items3: [String] = ["car1", "car2", "car3", "car4", "car5",
                            "car6", "car7", "car8","car9","car10"]
    
    var filteredItems: [String] = []
    var filteredItemsImages: [String] = []
    var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        searchBar = UISearchBar()
        //self.filteredItems = items
        DispatchQueue.main.async {
            self.reloadData(index: 0)
        }
    }
    func reloadData(index: Int)  {
        switch index {
        case 0:
            self.filteredItemsImages = images
            self.filteredItems = items
            break;
        case 1:
            self.filteredItemsImages = images1
            self.filteredItems = items1
            break;
        case 2:
            self.filteredItemsImages = images2
            self.filteredItems = items2
            break;
        case 3:
            self.filteredItemsImages = images3
            self.filteredItems = items3
            break;
        default:
            break;
        }
        self.tableView.reloadData()
    }
}


// MARK: - UITableView DataSource and Delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return filteredItems.count
        } else {
            return 1
        }
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell1", for: indexPath) as! TableViewCell1
            // Configure the cell
            cell.callback = { [unowned self] index in
                debugPrint(index)
                self.reloadData(index: index)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell2", for: indexPath) as! TableViewCell2
            // Configure the cell
            cell.tblListLabel.text = filteredItems[indexPath.row]
            cell.tblListImg.image = UIImage(named: filteredItemsImages[indexPath.row]) // Load local image
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 250 : 70 // Example heights for different cell types
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        if section == 0 {
            return nil
        } else {
            searchBar = {
                let bar = UISearchBar()
                bar.placeholder = "search conversations"
                bar.translatesAutoresizingMaskIntoConstraints = false
                bar.delegate = self
                return bar
            }()
            
            //headerView.backgroundColor = UIColor.gray // Set the background color
            headerView.addSubview(searchBar)
            searchBar.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
            searchBar.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
            searchBar.widthAnchor.constraint(equalTo: headerView.widthAnchor, constant: 0.0).isActive = true
            
        }
        headerView.backgroundColor = UIColor.gray
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 50 // Height of the header
        }
    }
}

// MARK: - UISearchBar Delegate Methods
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Handle search text changes
        if searchText.isEmpty {
            filteredItems = items
        } else {
            filteredItems = items.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filteredItems.removeAll()
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
}

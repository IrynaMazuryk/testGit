//
//  ViewController.swift
//  JSON2_Test
//
//  Created by Itcrystal Mac on 05.12.17.
//  Copyright © 2017 Ira. All rights reserved.
//

import UIKit


enum selectedScope: Int{
    case first = 0
    case last = 1
    case balance = 2
    
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    var componets = [Components]()
    var filteredComponets = [Components]()
    var searchBar = UISearchBar()
    
    var isSearching = false
    
  //  var indexArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarSetup()
        downloadJSON {
            self.tableview.reloadData()
//
            self.searchBar.delegate = self
            self.searchBar.returnKeyType = UIReturnKeyType.done
    self.filteredComponets = self.componets
        }
    
        
    }
    
    func searchBarSetup() {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["First Name", "Last Name", "Balance"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        self.tableview.tableHeaderView = searchBar
        
    }
    
    
    //MARK: search Bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == nil || searchText == "" {
            isSearching = false
            view.endEditing(true)
            componets = filteredComponets
            self.tableview.reloadData()
        }else{
            componets = filteredComponets
            isSearching = true
        filterTableView(ind: searchBar.selectedScopeButtonIndex, text: searchText)
            self.tableview.reloadData()
    }
    }
    
    
    //MARK: filter
    func filterTableView(ind: Int,text: String){
        switch ind {
        case selectedScope.first.rawValue:
              componets = componets.filter({ (mod) -> Bool in
                    return mod.first.lowercased().contains(text.lowercased())
            })
            self.tableview.reloadData()
            
        case selectedScope.last.rawValue:
               componets = componets.filter({ (mod) -> Bool in
                    return mod.last.lowercased().contains(text.lowercased())
            })
            self.tableview.reloadData()
        case selectedScope.balance.rawValue:
               componets = componets.filter({ (mod) -> Bool in
                    return mod.balance.lowercased().contains(text.lowercased())
                })
            self.tableview.reloadData()
        default:
            print ("no tupe")
        }
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return componets.count
        }
        return componets.count
    }
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        
        cell.first.text = componets[indexPath.row].first
        cell.last.text = componets[indexPath.row].last
        cell.balance.text = componets[indexPath.row].balance

       // cell.balance.text.sort({$0[componets[indexPath.row]] <  $1[componets[indexPath.row]})
            return cell
    }

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
 
    
    // MARC: segue
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController{
            destination.components = componets[(self.tableview.indexPathForSelectedRow?.row)!]
        }
    }
    
    
    
    // MARK: pars JSON
    
        func downloadJSON(completed:@escaping () -> () ){
            
            let url = URL(string: "https://randomapi.com/api/6de6abfedb24f889e0b5f675edc50deb?fmt=raw&sole")
            URLSession.shared.dataTask(with: url!) { (data,response, error) in
                if error == nil {
                    do{
                        self.componets = try JSONDecoder().decode([Components].self, from: data!)
                        DispatchQueue.main.async {
                            completed()
                        }
                    }catch {
                        print("JSON Error")
                        
                    }
                    
                }
                
                }.resume()

}
}


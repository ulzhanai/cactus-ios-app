//
//  LeaderboardViewController.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/4/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit


class LeaderResponse:Decodable {
    let users: [Leader]
    
}

class LeaderboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var users = [Leader]()
    let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Leaderboard"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.refreshControl = refreshController
        refreshController.addTarget(self,  action: #selector(reload), for: .valueChanged)
        
        loadInitial()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leaderCell = tableView.dequeueReusableCell(withIdentifier: "leader_cell", for: indexPath) as! LeaderboardTableViewCell
        
        let leader = self.users[indexPath.row]
        
        leaderCell.configure(with: leader, index: indexPath.row)
        return leaderCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         performSegue(withIdentifier: "showLeaderProfile", sender: nil)
         tableView.deselectRow(at: indexPath, animated: false)
         print("didSelect")
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == users.count - 2 {
                  loadMore()
              }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           print("Deleted")

            self.users.remove(at: indexPath.row)
           tableView.deleteRows(at: [indexPath], with: .automatic)
            
           tableView.reloadData() //update indexes
         }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let profileVC = segue.destination as? LeaderProfileViewController{
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            let selectedLeader = self.users[selectedIndexPath.row]
            profileVC.leader = selectedLeader
        }
        
    }
    
  //MARK: -Loading
    
    func loadInitial(){
        activityIndicator.isHidden = false
        
        loadUsers(offset: 0) { (users) in
            self.activityIndicator.isHidden = true
            
            guard let users = users else {
                return
            }
            
            self.users = users
            self.tableView.reloadData()
        }
    }
    
    @objc func reload(){
        isLoadingMore =  false
        
        loadUsers(offset: 0) { (users) in
            
            self.refreshController.endRefreshing()
            guard let users = users else {
                return
            }
            
            self.users = users
            self.tableView.reloadData()
            
            self.lastOffset = 0
            self.allLeadersAreLoaded = false
        }
    }
    
    
    var lastOffset = 0
    var isLoadingMore = false
    var allLeadersAreLoaded = false
    
    func loadMore(){
        if allLeadersAreLoaded || isLoadingMore {
            return
        }
        
        isLoadingMore = true
        
        let offset = lastOffset + 10
        loadUsers(offset: offset) {(newLeaders) in
            
            self.isLoadingMore = false
            guard let newLeaders = newLeaders else {
                return
            }
            
            self.lastOffset = offset
            
            if newLeaders.isEmpty {
                self.allLeadersAreLoaded = true
                return
            }
            
            let startIndex = self.users.count
            let endIndex = self.users.count + newLeaders.count - 1
            
            let indexPathsToAdd:[IndexPath] = (startIndex...endIndex).map{
                IndexPath(row: $0, section: 0)
            }
            
            self.users.append(contentsOf: newLeaders)
            self.tableView.insertRows(at: indexPathsToAdd, with: .automatic)
     
        }
    }
    
    
    var dataTask: URLSessionDataTask?
    
    func loadUsers(offset: Int, completion: @escaping ([Leader]?)-> Void){
        dataTask?.cancel()
        
        
        let url = URL(string: "https://ios-cactus-app.herokuapp.com/leaderboard?offset=\(offset)&limit=10")!
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
               self.dataTask = nil
            
               if let data = data{
                   let leaderResponse = try! JSONDecoder().decode(LeaderResponse.self, from: data)
                   DispatchQueue.main.async {
                    completion(leaderResponse.users)
                   }
                  return
               }
            
               if let error = error{
                   DispatchQueue.main.async {
                    self.showError(error)
                   }
               }
            
               DispatchQueue.main.async {
                   completion(nil)
                }
           }
           dataTask?.resume()
    }
    
    
    func showError(_ error: Error){
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: false, completion: nil)
        
    }
    
    
    

}

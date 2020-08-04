//
//  LeaderboardViewController.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/4/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Leaderboard"
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LeadersStorage.shared.leaders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leaderCell = tableView.dequeueReusableCell(withIdentifier: "leader_cell", for: indexPath) as! LeaderboardTableViewCell
        
        let leader = LeadersStorage.shared.leaders[indexPath.row]
        
        leaderCell.configure(with: leader, index: indexPath.row)
        return leaderCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print("didSelect")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           print("Deleted")

           LeadersStorage.shared.leaders.remove(at: indexPath.row)
           tableView.deleteRows(at: [indexPath], with: .automatic)
            
           tableView.reloadData() //update indexes
         }
    }
    

}

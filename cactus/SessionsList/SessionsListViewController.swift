//
//  SessionsListViewController.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/4/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

class SessionsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sessions"
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SessionsStorage.shared.sessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sessionCell = tableView.dequeueReusableCell(withIdentifier: "session_cell", for: indexPath) as! SessionsListTableViewCell
        
        let session = SessionsStorage.shared.sessions[indexPath.row]
        sessionCell.configure(with: session)
        return sessionCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select")
    }

}

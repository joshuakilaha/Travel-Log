//
//  LogTableViewController.swift
//  Travel Log
//
//  Created by Kilz on 01/04/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import UIKit

class LogTableViewController: UITableViewController {
    
    var logs = [LogEntry] ()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageTitle()
        getTravelLogs()
    }
    
    
    @IBAction func refresh(_ sender: UIRefreshControl) {
       getTravelLogs()
        sender.endRefreshing()
    }
    
    
    //MARK: FUnctions
    
    //Title
    
    private func pageTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Destinations"
    }
    
    
    
    //GET LOGS
    fileprivate func getTravelLogs() {
        Service.shared.getLogs { (res) in
            switch res {
            case.failure(let err):
                print("Failed to fetch Logs", err)
                
            case .success(let logs):
                print(logs)
                self.logs = logs
                self.tableView.reloadData()
            }
        }
    }
    
    
    //Navigation
    private func moveToDestinationView(_ logs: LogEntry) {
        let toDestinationVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "logDestination") as! ViewController
        
         toDestinationVC.logs = logs
        
        
          self.navigationController?.pushViewController(toDestinationVC, animated: true)
    }
    
    
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return logs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logCell", for: indexPath) as! logTableViewCell
        
        cell.generateCell(logs[indexPath.row])

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        moveToDestinationView(logs[indexPath.row])
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

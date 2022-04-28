//
//  TableViewController.swift
//  TableView
//
//  Created by nikhil on 03/03/22.
//

import UIKit

class TableViewController: UITableViewController {
    var numberOfRows = 10
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfRows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:.default,reuseIdentifier:"cell")
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let share = UIContextualAction(style: .normal, title: "Share") { action, view, completion in
            completion(true)
        }

        let delete = UIContextualAction(style: .destructive, title: "Delete") { [weak self] action, view, completion in
            completion(true)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            if let rowcount = self?.numberOfRows
            {
                self?.numberOfRows = rowcount - 1
            }
            tableView.endUpdates()
        }
        delete.image = UIImage(systemName:  "trash.circle")


        return UISwipeActionsConfiguration(actions: [delete, share])
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let like = UIContextualAction(style: .normal, title: "Like") { [weak self] action, view, completion in
            
            completion(true)
        }
        like.image = UIImage(systemName: "hand.thumbsup")
        like.backgroundColor = UIColor.darkGray

        return UISwipeActionsConfiguration(actions: [like])
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let currentOffset = scrollView.contentOffset.y;
            let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;

            // Change 10.0 to adjust the distance from bottom
            if (maximumOffset - currentOffset <= 10.0) {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
            }
            else{
                self.navigationController?.setNavigationBarHidden(false, animated: true)
            }
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

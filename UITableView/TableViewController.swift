//
//  TableViewController.swift
//  UITableView
//
//  Created by sirius on 15.02.2019.
//  Copyright © 2019 sirius. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var dataArray: [String] = []
    
    func saveData() {
        UserDefaults.standard.set(dataArray, forKey: "dataArray")
        UserDefaults.standard.synchronize()
    }
    
    func loadData() {
        let data = UserDefaults.standard.object(forKey: "dataArray")
        if data != nil {
            dataArray = data as! [String]
        } else {
            dataArray = []
        }
    }
    

    @IBAction func pushEditData(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    @IBAction func addData(_ sender: Any) {
//        dataArray.append("New element")
//        tableView.reloadData()
//        saveData()
        let alert = UIAlertController(title: "Добавьте элемент в список", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addTextField(configurationHandler: { (UITextField) in UITextField.placeholder = "Нызвание транспорта"})
        let alertActionAdd = UIAlertAction(title: "Добавить", style: UIAlertAction.Style.default, handler: {
            (UIAlertAction) in if alert.textFields?.first?.text != "" {
                self.dataArray.append((alert.textFields?.first?.text)!)
                self.tableView.reloadData()
                self.saveData()
                }
            print("push Add")})
        let alertActionCancel = UIAlertAction(title: "Отмена", style: UIAlertAction.Style.cancel, handler: {(UIAlertAction) in print("push Cancel")})
        alert.addAction(alertActionAdd)
        alert.addAction(alertActionCancel)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData();
//        dataArray.append("Subaru")
//        dataArray.append("BMW")
//        dataArray.append("Mercedes-Benz")
//        dataArray.append("Suzuki")
//        dataArray.append("Yaz")

    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let currentTextInCell = dataArray[indexPath.row]
        
        cell.textLabel?.text = currentTextInCell
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataArray.remove(at: indexPath.row)
            saveData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let from = dataArray[fromIndexPath.row]
        
        dataArray.remove(at: fromIndexPath.row)
        dataArray.insert(from, at: to.row)
        saveData()
        tableView.reloadData()
        
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "newViewControllerSId") as! NewViewController
        vc.textData = dataArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
//        present(vc, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedData = dataArray[(tableView.indexPathForSelectedRow?.row)!]
        (segue.destination as! NewViewController).textData = selectedData
        
    }
 
     */
    

}

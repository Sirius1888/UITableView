//
//  NewViewController.swift
//  UITableView
//
//  Created by sirius on 19.02.2019.
//  Copyright © 2019 sirius. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBAction func pushBackNav(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func pushBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var label: UILabel!
    var textData: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = textData
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

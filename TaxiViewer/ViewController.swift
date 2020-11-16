//
//  ViewController.swift
//  TaxiViewer
//
//  Created by Mustafa Yousef on 16.11.20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var hpArray = ["Hp1","Hp2","Hp3","Hp4","Hp5",]

    @IBOutlet weak var hpTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hpTableView.delegate = self
        hpTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        
    }

    
    // MARK: - Protocol Stubs
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hpArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hpCell", for: indexPath)
        
        cell.textLabel?.text = hpArray[indexPath.row]
        return cell
    }

}


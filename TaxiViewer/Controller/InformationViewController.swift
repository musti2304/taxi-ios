//
//  InformationViewController.swift
//  TaxiViewer
//
//  Created by Mustafa Yousef on 16.11.20.
//

import UIKit

protocol InfoDelegate {
    func updateInformation(infoNewArray: String)
}

class InformationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, InfoDelegate {

    @IBOutlet weak var infoTableView: UITableView!
    @IBOutlet weak var updateInfo: UIBarButtonItem!
    
    var infoArray = [Information]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoTableView.delegate = self
        infoTableView.dataSource = self
        
        HPService.services.infoDelegate = self
        HPService.services.fetchInformation()
        
    }
    
    // MARK: - Action
    
    @IBAction func updateInfo(_ sender: Any) {
        HPService.services.fetchInformation()
    }
    
    
    // MARK: - InfoDelegate Protocol Stubs
    
    func updateInformation(infoNewArray: String) {
        
        do {
            
            infoArray = try JSONDecoder().decode([Information].self, from: infoNewArray.data(using: .utf8)!)
            
        } catch {
            print(error)
        }
        
        self.infoTableView.reloadData()
    }
    
    
    // MARK: - TableView Protocol Stubs
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InformationTableViewCell
        
        cell.loggedIn.text = infoArray[indexPath.row].gesamt
        cell.busy.text = infoArray[indexPath.row].besetzt
        
        return cell
    }
}
